`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/16 21:33:58
// Design Name: 
// Module Name: BCD_display
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


module BCD_display(reset, clk, Address, Write_data, MemWrite, leds , ans);
	input reset, clk;
    input [31:0]  Address, Write_data;
    input MemWrite;
    output [6:0] leds;
    output [3:0] ans;
    
    reg [11:0] num;
    assign leds = num[6:0];
    assign ans = num[11:8];
    
    
    always @(posedge reset or posedge clk)
		if (reset)
           num <= 12'h0;
        else
            if(MemWrite&&Address==32'h40000010)
                num <= Write_data[11:0];          
endmodule
