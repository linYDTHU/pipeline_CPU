`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/15 22:04:53
// Design Name: 
// Module Name: Timer
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


module Timer(reset, clk, Address, Write_data, MemWrite, irq);
	input reset, clk;
	input [31:0] Address, Write_data;
	input  MemWrite;
	output  irq;
	
	reg [31:0] TH;
	reg [2:0] TCON;
	reg [31:0] TL;
	
	assign irq = TCON[2];
	
	always@(posedge reset or posedge clk)
	if(reset) begin
	   TL <= 32'd0;
	   TH <= 32'd0;
	   TCON <= 3'd0;
	end  
	else begin
       if(Address==32'h40000008 && MemWrite)
          TCON <= Write_data[2:0];
       if(Address==32'h40000000 && MemWrite)
          TH <= Write_data;
       if(Address==32'h40000004 && MemWrite)
          TL <= Write_data;  
       if(TCON[0]) begin //timer is enabled 
          if(TL==32'hffffffff) begin
             TL <= TH;
             if(TCON[1]) 
                TCON[2] <= 1'b1; //irq is enabled
          end
          else TL <= TL + 1;
       end
    end
endmodule
