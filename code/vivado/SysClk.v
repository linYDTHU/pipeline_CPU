`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/16 20:32:52
// Design Name: 
// Module Name: SysClk
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


module SysClk(clk, reset, Address, MemRead, clk_num
    );
    input clk,reset,MemRead;
    input [31:0] Address;
    output reg [31:0] clk_num;
    always @(posedge reset or posedge clk)
    if (reset)
       clk_num <= 32'h00000000;
    else
       clk_num <= clk_num+1;
endmodule
