class Monitior ;
	virtual InterFace VIF2;
	mailbox mon2scb;
	Transaction trans;
	function new (virtual InterFace VIF2, mailbox mon2scb);
		this.mon2scb = mon2scb;
		this.VIF2    = VIF2;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			@(posedge VIF2.clk) begin
				trans = new();
				trans.up_down  =  VIF2.up_down;
				trans.rst      =  VIF2.rst;
				trans.count    =  VIF2.count;
				mon2scb.put(trans);
				$display("<<< Monitior >>> : time = %0t, rst = %1b, up_down = %1b, count = %4d", $time, trans.rst, trans.up_down, trans.count);
				$display("\n---------------------------------------------------------------------------------");
			end
		end
	endtask
endclass: Monitior