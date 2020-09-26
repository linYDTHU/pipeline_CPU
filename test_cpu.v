`timescale 1ns / 1ps
module test_cpu();
	
	reg reset;
	reg clk;
	wire [6:0] leds;
	wire [3:0] ans;
	wire [3:0] data1;
	wire [3:0] data2;
	wire [3:0] data3;
	wire [3:0] data4;
	CPU cpu1(reset, clk,leds,ans,data1,data2,data3,data4);
	
	initial begin
		clk = 1;
		reset = 1;
		#15 reset = 0;
	end
	
	always #10 clk = ~clk;
		
endmodule
