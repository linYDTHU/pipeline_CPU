`timescale 1ns / 1ps
module CPU(reset, clk, leds, ans,data1,data2,data3,data4);
	input reset, clk;
	output [6:0] leds;
	output [3:0] ans;
	output [3:0] data1;
	output [3:0] data2;
	output [3:0] data3;
	output [3:0] data4;
	reg [31:0] PC;
	reg [95:0] IF_ID;
	reg [169:0] ID_EX;
	reg [105:0] EX_MEM;
	reg [38:0] MEM_WB;
	
	wire [31:0] Instruction;
	wire [3:0] ALUOp;
	
	wire [31:0] PC_next;
	wire stall;
	wire jump_flush; //jump_flush
	wire branch_flush;
	wire interrupt; //interruptָ中断
	wire exception;//exceptionָ异常
	
	//IF阶段
	always @(posedge reset or posedge clk)
		if (reset)
			PC <= 32'h00400000;
		else
		    if(~stall)
            	PC <= PC_next;
	
	wire [31:0] PC_plus_4;
	assign PC_plus_4 = PC + 32'd4;
	wire flush_interrupt_exception;
	
	InstructionMemory instruction_memory1(.Address(PC), .Instruction(Instruction));
	
	always @(posedge reset or posedge clk)
		if(reset)
		    IF_ID <= 96'h00000000;
		else
			if(~stall)
			    IF_ID <= (jump_flush || branch_flush|| flush_interrupt_exception)?96'h0:
			    {PC, PC_plus_4,Instruction};
	
	assign flush_interrupt_exception=(interrupt&&(PCSrc==2'b01)) ||(interrupt&&(Instruction[31:28]==4'd1))|| (exception&&(PCSrc==2'b01))|| (exception&&(Instruction[31:25]==4'd1));
	
	//ID阶段
	wire [1:0] RegDst;
	wire [1:0] PCSrc;
	wire Branch;
	wire MemRead;
	wire [1:0] MemtoReg;
	wire ExtOp;
	wire LuOp;
	wire MemWrite;
	wire ALUSrc1;
	wire ALUSrc2;
	wire RegWrite;
	
	assign jump_flush = (PCSrc==2'b10||PCSrc==2'b11)?1:0;
	
	wire irq2;
	Control control1(
		.OpCode(IF_ID[31:26]), .Funct(IF_ID[5:0]),
		.PCSrc(PCSrc), .Branch(Branch), .RegWrite(RegWrite), .RegDst(RegDst), 
		.MemRead(MemRead),	.MemWrite(MemWrite), .MemtoReg(MemtoReg),
		.ALUSrc1(ALUSrc1), .ALUSrc2(ALUSrc2), .ExtOp(ExtOp), .LuOp(LuOp),.ALUOp(ALUOp),.irq(irq2));
		
	assign exception = (~PC[31]&irq2);
	
	Hazard_control hc(.ID_EX_Rt(ID_EX[132:128]),.ID_EX_MemRead(ID_EX[106]),
        .Rs(IF_ID[25:21]),.Rt(IF_ID[20:16]),.stall(stall));
	
	wire [31:0] Databus1, Databus2, Databus3;
	wire [4:0] Write_register;
	wire [31:0] PC_interrupt_exception;
	
	RegisterFile register_file1(.reset(reset), .clk(clk), .interrupt(interrupt),.exception(exception), .PC(PC_interrupt_exception), .RegWrite(MEM_WB[37]), 
		.Read_register1(IF_ID[25:21]), .Read_register2(IF_ID[20:16]), .Write_register(MEM_WB[4:0]),
		.Write_data(MEM_WB[36:5]), .Read_data1(Databus1), .Read_data2(Databus2));
	
	wire [31:0] Ext_out;
	assign Ext_out = {ExtOp? {16{IF_ID[15]}}: 16'h0000, IF_ID[15:0]};
	
	wire [31:0] LU_out;
	assign LU_out = LuOp? {IF_ID[15:0], 16'h0000}: Ext_out;
	
	wire [31:0] Jump_target;
    assign Jump_target = {IF_ID[63:60], IF_ID[25:0], 2'b00};
    
	
	always @(posedge reset or posedge clk)
        if(reset)
            ID_EX <= 170'h00000000;
        else
            ID_EX <= (branch_flush||stall || (interrupt&&(PCSrc==2'b01)) || (exception&&(PCSrc==2'b01)) )?170'h00000000:
            {IF_ID[95:64],IF_ID[63:32],IF_ID[25:0],RegDst,PCSrc,Branch,MemRead,
            MemtoReg,ALUOp,MemWrite,ALUSrc1,ALUSrc2,
            RegWrite,Databus1,Databus2,LU_out};
            //PC_plus_4:ID_EX[169:138] Rs:ID_EX[137:133] 
            //Rt:ID_EX[132:128] Rd:ID_EX[127:123]
            //shamt:ID_EX[122:118] Funct:ID_EX[117:112]
            //RegDst:ID_EX[111:110] PCSrc:ID_EX[109:108] Branch:ID_EX[107] 
            //MemRead:ID_EX[106] MemtoReg:ID_EX[105:104] ALUOp:ID_EX[103:100] 
            //MemWrite:ID_EX[99] ALUSrc1:ID_EX[98] ALUSrc2:ID_EX[97] RegWrite:ID_EX[96]
            //Databus1:ID_EX[95:64],Databus2:ID_EX[63:32],LU_out:ID_EX[31:0]
     
	//EX阶段
	wire [4:0] ALUCtl;
	wire Sign;
	ALUControl alu_control1(.ALUOp(ID_EX[103:100]), .Funct(ID_EX[117:112]), .ALUCtl(ALUCtl), .Sign(Sign));
	
	wire [31:0] in1;
    wire [31:0] in2;
	wire [31:0] ALU_in1;
	wire [31:0] ALU_in2;
	wire [31:0] ALU_out;
	wire Zero;
	wire [1:0] ForwardA;
    wire [1:0] ForwardB;
    
	assign in1 = (ForwardA == 2'b01)?MEM_WB[36:5]: (ForwardA == 2'b10)? EX_MEM[68:37]:ID_EX[95:64];
	assign in2 = (ForwardB == 2'b01)?MEM_WB[36:5]: (ForwardB == 2'b10)? EX_MEM[68:37]:ID_EX[63:32];
	
	Forward_control forward_control1(.MEM_WB_RegWrite(MEM_WB[37]),.MEM_WB_WriteReg(MEM_WB[4:0]),
    .EX_MEM_WriteReg(EX_MEM[4:0]),.EX_MEM_RegWrite(EX_MEM[69]),.ID_EX_Rs(ID_EX[137:133]),
    .ID_EX_Rt(ID_EX[132:128]),.ForwardA(ForwardA),.ForwardB(ForwardB));
    
    assign ALU_in1 = ID_EX[98]? {27'h00000, ID_EX[122:118]}:in1;
    assign ALU_in2 = ID_EX[97]? ID_EX[31:0] :in2;
    
	ALU alu1(.in1(ALU_in1), .in2(ALU_in2), .ALUCtl(ALUCtl), .Sign(Sign), .out(ALU_out), .zero(Zero));
	
	wire [31:0] Branch_target;
    assign Branch_target = ID_EX[169:138] + {ID_EX[29:0], 2'b00};//��ָ֧����תĿ�겢��PC+4ѡ��
    
    assign Write_register = (ID_EX[111:110] == 2'b00)? ID_EX[132:128]: (ID_EX[111:110] == 2'b01)? ID_EX[127:123]: 5'b11111;
    
    assign PC_next = (interrupt)?32'h80400004: (exception)?32'h80400008: (ID_EX[109:108] == 2'b01 & Zero)? Branch_target: (PCSrc == 2'b11)? Databus1: (PCSrc == 2'b10)? Jump_target:PC_plus_4 ;
    
    assign branch_flush = ID_EX[107] & Zero & (ID_EX[109:108] == 2'b01);
    
    assign PC_interrupt_exception =  (Instruction[31:26]==6'h04)?PC: (PCSrc==2'b01)? IF_ID[95:64]: (ID_EX[109:108] == 2'b01 & Zero)? Branch_target: (PCSrc == 2'b11)? Databus1: (PCSrc == 2'b10)? Jump_target:PC_plus_4;
    
	always @(posedge reset or posedge clk)
        if(reset)
            EX_MEM <= 106'h00000000;
        else
            EX_MEM <= {ID_EX[169:138],ID_EX[106:104],ID_EX[99],
            ID_EX[96],ALU_out,in2,Write_register}; 
	//PC_plus_4(ID_EX[169:138]):EX_MEM[105:74]
	//MemRead(ID_EX[106]):EX_MEM[73] MemtoReg(ID_EX[105:104]):EX_MEM[72:71] MemWrite(ID_EX[99]):EX_MEM[70]
	//RegWrite(ID_EX[96]):EX_MEM[69] ALU_out:EX_MEM[68:37]
	//in2:EX_MEM[36:5] Write_register:EX_MEM[4:0]
	
	//Mem阶段
	wire [31:0] Read_data;
	wire [31:0] DataMemory_data;
	wire [31:0] clk_num;
	wire irq1;


	DataMemory data_memory1(.reset(reset), .clk(clk), .Address(EX_MEM[68:37]), .Write_data(EX_MEM[36:5]),
	 .Read_data(DataMemory_data), .MemRead(EX_MEM[73]), .MemWrite(EX_MEM[70]),
	 .data1(data1),.data2(data2),.data3(data3),.data4(data4));
	SysClk sysclk(.clk(clk), .reset(reset), .Address(EX_MEM[68:37]), .MemRead(EX_MEM[73]), .clk_num(clk_num));
	assign Read_data = (EX_MEM[68:37]== 32'h40000014)? clk_num:DataMemory_data;
	assign Databus3 = (EX_MEM[72:71] == 2'b10)? EX_MEM[105:74]: (EX_MEM[72:71] == 2'b01)? Read_data: EX_MEM[68:37];
	Timer timer(.reset(reset), .clk(clk), .Address(EX_MEM[68:37]),.Write_data(EX_MEM[36:5]),.MemWrite(EX_MEM[70]), .irq(irq1));
	BCD_display display(.reset(reset), .clk(clk), .Address(EX_MEM[68:37]),.Write_data(EX_MEM[36:5]),.MemWrite(EX_MEM[70]), .leds(leds), .ans(ans));
	assign interrupt =(~PC[31]&&irq1);
	//WB阶段
	always @(posedge reset or posedge clk)
        if(reset)
            MEM_WB <= 39'h00000000;
        else
            MEM_WB <= {EX_MEM[73],EX_MEM[69],Databus3,EX_MEM[4:0]};
         //MemRead(EX_MEM[73]):MEM_WB[38]
        //RegWrite(EX_MEM[69]):MEM_WB[37]  Write_register(EX_MEM[4:0]):MEM_WB[4:0]
        //Databus3:MEM_WB[36:5]
endmodule
	