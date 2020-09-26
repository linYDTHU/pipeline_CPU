`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 21:03:42
// Design Name: 
// Module Name: Forward_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Forward_control(MEM_WB_RegWrite,MEM_WB_WriteReg,
EX_MEM_WriteReg,EX_MEM_RegWrite,ID_EX_Rs,ID_EX_Rt,
ForwardA,ForwardB
);
input [4:0] MEM_WB_WriteReg;
input MEM_WB_RegWrite;
input EX_MEM_RegWrite;
input [4:0] EX_MEM_WriteReg;
input [4:0] ID_EX_Rs;
input [4:0] ID_EX_Rt;
output [1:0] ForwardA;
output [1:0] ForwardB;
wire MEM_WB_A;
wire MEM_WB_B;
wire EX_MEM_A;
wire EX_MEM_B;
assign MEM_WB_A = (MEM_WB_RegWrite)&(MEM_WB_WriteReg!=5'b0)&(MEM_WB_WriteReg == ID_EX_Rs)&(EX_MEM_WriteReg != ID_EX_Rs||~EX_MEM_RegWrite);
                 
assign MEM_WB_B = (MEM_WB_RegWrite)&(MEM_WB_WriteReg!=5'b0)&(MEM_WB_WriteReg == ID_EX_Rt)&(EX_MEM_WriteReg != ID_EX_Rt||~EX_MEM_RegWrite);
                 
assign EX_MEM_A = (EX_MEM_RegWrite)&(EX_MEM_WriteReg!=5'b0)&(EX_MEM_WriteReg == ID_EX_Rs);
assign EX_MEM_B = (EX_MEM_RegWrite)&(EX_MEM_WriteReg!=5'b0)&(EX_MEM_WriteReg == ID_EX_Rt);
assign ForwardA = (MEM_WB_A)?2'b01: (EX_MEM_A)?2'b10:2'b00;
assign ForwardB = (MEM_WB_B)?2'b01: (EX_MEM_B)?2'b10:2'b00;
endmodule
