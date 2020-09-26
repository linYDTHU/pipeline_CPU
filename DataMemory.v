`timescale 1ns / 1ps
module DataMemory(reset, clk, Address, Write_data, Read_data, MemRead, MemWrite, data1, data2, data3, data4);
	input reset, clk;
	input [31:0]  Address, Write_data;
	input MemRead, MemWrite;
	output [31:0] Read_data;
	output [3:0] data1;
	output [3:0] data2;
	output [3:0] data3;
	output [3:0] data4;
	
	parameter RAM_SIZE = 256;
	parameter RAM_SIZE_BIT = 8;
	
	assign data1 = RAM_data[1][3:0];
	assign data2 = RAM_data[2][3:0];
	assign data3 = RAM_data[3][3:0];
	assign data4 = RAM_data[4][3:0];


	reg [31:0] RAM_data[RAM_SIZE - 1: 0];
	assign Read_data = MemRead?RAM_data[Address[RAM_SIZE_BIT + 1:2]]: 32'h00000000;
	integer i;
	always @(posedge reset or posedge clk)
		if (reset)
			for (i = 0; i < RAM_SIZE; i = i + 1)
				RAM_data[i] <= 32'h00000000;
		else if (MemWrite&&Address[31:28]!=4'b0100)
			RAM_data[Address[RAM_SIZE_BIT + 1:2]] <= Write_data;
			
endmodule
