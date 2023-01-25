module Up_Down_Counter #(parameter size = 4)(clk, rst, up_down, count);
	input clk, rst, up_down;
	output reg [size-1 : 0] count;
	
	always @(posedge clk , posedge rst) begin
		if(rst)
			count <= 0;
		else begin
			if(up_down) begin
              if(count == 4'hf)
					count <= count;
				else
					count <= count+1;
			end
			else begin
              if(count == 4'h0)
					count <= count;
				else
					count <= count-1;
			end
		end
	end
endmodule