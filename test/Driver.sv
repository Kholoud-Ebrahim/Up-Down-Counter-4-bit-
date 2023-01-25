class Driver;
	virtual InterFace VIF1;
	mailbox gen2driv;
	Transaction trans;
	function new(mailbox gen2driv, virtual InterFace VIF1);
		this.gen2driv = gen2driv;
		this.VIF1     = VIF1;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			@(negedge VIF1.clk) begin
				gen2driv.get(trans);
				VIF1.up_down <=  trans.up_down;
				VIF1.rst     <=  trans.rst;
				trans.count  <=  VIF1.count;
				$display("<<< Driver >>> : time = %0t, rst = %1b, up_down = %1b, count = %4d", $time, trans.rst, trans.up_down, trans.count);
				$display("\n---------------------------------------------------------------------------------");
			end
		end
	endtask
endclass: Driver