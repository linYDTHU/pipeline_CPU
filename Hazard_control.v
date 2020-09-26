`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 15:17:21
// Design Name: 
// Module Name: Hazard_control
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


module Hazard_control(ID_EX_Rt,ID_EX_MemRead,
Rs,Rt,stall);
input [4:0] ID_EX_Rt;
input ID_EX_MemRead;
input [4:0] Rs;
input [4:0] Rt;
output stall;
assign stall = ((Rs == ID_EX_Rt)|(Rt == ID_EX_Rt))&(ID_EX_MemRead);
endmodule
