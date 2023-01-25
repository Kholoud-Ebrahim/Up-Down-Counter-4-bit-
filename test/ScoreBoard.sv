class ScoreBoard;
	mailbox mon2scb;
	Transaction trans;
	bit[3:0]Expected_Count;

	function new (mailbox mon2scb);
		this.mon2scb = mon2scb;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			mon2scb.get(trans);
			if(trans.rst)
				Expected_Count = 0;
			else begin
				if(trans.up_down) begin
					if(Expected_Count == 4'hf)
						Expected_Count = Expected_Count;
					else
						Expected_Count = Expected_Count+1;
				end
				else begin
					if(Expected_Count == 4'h0)
						Expected_Count = Expected_Count;
					else
						Expected_Count = Expected_Count-1;
				end
		    end
			
				
            as2:assert(Expected_Count == trans.count) begin
					$display("<<< ScoreBoard >>> : time = %0t, \"passed\" rst = %1b, up_down = %1b, count = %4d, Expected_Count = %4d", $time, trans.rst, trans.up_down, trans.count, Expected_Count);
					$display("\n---------------------------------------------------------------------------------");
				end
				else begin
				    $error("<<< ScoreBoard >>> : time = %0t, \"failed\" rst = %1b, up_down = %1b, count = %4d, Expected_Count = %4d", $time, trans.rst, trans.up_down, trans.count, Expected_Count);
					$display("\n---------------------------------------------------------------------------------");
				end
		end
	endtask
endclass: ScoreBoard