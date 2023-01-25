module Up_Down_Counter_TB;
	parameter size = 4;
	bit clk, rst, up_down;
	logic [size-1 : 0] count;
	Up_Down_Counter #(size)DUT(clk, rst, up_down, count);
	
	initial begin
		forever begin #5 clk = ~clk; end
    end
  
  	initial
		$monitor("up_down = %0d   count = %0d", up_down, count);
	initial begin
		rst = 1;
      	repeat(2) @(negedge clk);
		rst = 0;
		up_down=1;
		repeat(15) @(negedge clk);
		up_down=0;
		repeat(15) @(negedge clk);
		up_down=1;
		repeat(5) @(negedge clk);
		up_down=0;
		repeat(2) @(negedge clk);
		$finish;
	end
	
	initial begin
		$dumpfile("dump.vcd");
      	$dumpvars;
	end
endmodule