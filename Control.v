`timescale 1ns / 1ps
module Control(OpCode, Funct,
	PCSrc, Branch, RegWrite, RegDst, 
	MemRead, MemWrite, MemtoReg, 
	ALUSrc1, ALUSrc2, ExtOp, LuOp, ALUOp,irq);
	input [5:0] OpCode;
	input [5:0] Funct;
	output [1:0] PCSrc;
	output Branch;
	output RegWrite;
	output [1:0] RegDst;
	output MemRead;
	output MemWrite;
	output [1:0] MemtoReg;
	output ALUSrc1;
	output ALUSrc2;
	output ExtOp;
	output LuOp;
	output [3:0] ALUOp;
	output irq;
	
	// Your code below
	 assign PCSrc =((OpCode==6'h00)&&(Funct==6'h08||Funct==6'h09))?2'b11:((OpCode==6'h02)||(OpCode==6'h03))?2'b10: ((OpCode==6'h04))?2'b01:2'b00 ;
               assign Branch=(OpCode==6'h04)?1:0;
               assign RegWrite=((OpCode==6'h02)||(OpCode==6'h04)||(OpCode==6'h2b)||((OpCode==6'h00)&&(Funct==6'h08)))?1'b0:1'b1;
               assign RegDst[1]=(OpCode==6'h03)?1'b1:1'b0;
               assign RegDst[0]=(OpCode==6'h00)?1'b1:1'b0;
               assign MemRead=(OpCode==6'h23)?1'b1:1'b0;
               assign MemWrite=(OpCode==6'h2b)?1'b1:1'b0;
               assign MemtoReg=((OpCode==6'h03)||((OpCode==6'h00)&&(Funct==6'h09)))?2'b10: ((OpCode==6'h23))?2'b01:2'b00;
               assign ALUSrc1=((OpCode==6'h00)&&((Funct==6'h00)||(Funct==6'h02)||(Funct==6'h03)))?1'b1:1'b0;
               assign ALUSrc2=(OpCode==6'h23||OpCode==6'h2b||OpCode==6'h0f||OpCode==6'h08||OpCode==6'h09||OpCode==6'h0c||OpCode==6'h0a||OpCode==6'h0b)?1'b1:1'b0;
               assign ExtOp=(OpCode==6'h0c)?1'b0:1'b1;
               assign LuOp=(OpCode==6'h0f)?1'b1:1'b0;
               assign irq = ((OpCode==6'h00)||(OpCode==6'h03)||(OpCode==6'h08)||(OpCode==6'h09)
               ||(OpCode==6'h23)||(OpCode==6'h2b)||(OpCode==6'h0f)||(OpCode==6'h0c)
               ||(OpCode==6'h0a)||(OpCode==6'h0b)||(OpCode==6'h04)||(OpCode==6'h02))?1'b0:1'b1;
	// Your code above
	
	assign ALUOp[2:0] = 
		(OpCode == 6'h00)? 3'b010: 
		(OpCode == 6'h04)? 3'b001: 
		(OpCode == 6'h0c)? 3'b100: 
		(OpCode == 6'h0a || OpCode == 6'h0b)? 3'b101: 
		3'b000;
		
	assign ALUOp[3] = OpCode[0];
	
endmodule