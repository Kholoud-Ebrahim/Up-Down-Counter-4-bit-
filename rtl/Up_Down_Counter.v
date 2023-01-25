module Up_Down_Counter #(parameter size = 4)(InterFace.DUT IF);
	always @(posedge IF.clk , posedge IF.rst) begin
		if(IF.rst)
            IF.count <= 0;
		else begin
			if(IF.up_down) begin
                if(IF.count == 4'hf)
                    IF.count <= IF.count;
				else
                    IF.count <= IF.count+1;
			end
			else begin
                if(IF.count == 4'h0)
                    IF.count <= IF.count;
				else
                    IF.count <= IF.count-1;
			end
		end
	end
endmodule