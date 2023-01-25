class Generator;
	Transaction trans;
	mailbox gen2driv;
	function new(mailbox gen2driv);
		this.gen2driv = gen2driv;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			trans.counter++;
			trans = new();
			as1: assert(trans.randomize());
			gen2driv.put(trans);
			$display("<<< Generator >>> : time = %0t, rst = %1b, up_down = %1b, count = %4d, Repetations=%d", $time, trans.rst, trans.up_down, trans.count, trans.counter);
			$display("\n---------------------------------------------------------------------------------");
		end
	endtask
endclass: Generator