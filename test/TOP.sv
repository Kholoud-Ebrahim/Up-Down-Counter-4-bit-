parameter REPETATIONS = 100;
parameter size = 4;
	`include "Transaction.sv"
	`include "Generator.sv"
	`include "Driver.sv"
	`include "Monitior.sv"
    `include "ScoreBoard.sv"
    `include "Environment.sv"
//======================================================
interface InterFace();
	bit clk, rst, up_down;
	bit [size-1 : 0] count;
	initial begin
		forever begin #10 clk = ~clk; end 
	end	
    modport DUT (input clk, rst, up_down, output count);
endinterface
//======================================================
program test(InterFace IF);
	Environment env;
	initial begin
		env = new(IF);
		env.run();
	end
endprogram: test
//======================================================
module Top;
	InterFace IFC();
	Up_Down_Counter #(size)DUT(IFC.DUT);
	test  T1(IFC);
	initial begin 
      $dumpfile("test.vcd");
      $dumpvars;
    end
endmodule