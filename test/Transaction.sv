class Transaction;
	rand bit up_down;
	rand bit rst;
	bit clk;
	bit [size-1 : 0] count;
	static int counter;
	
	constraint C1{rst dist     {0:=50, 1:= 4};}
	constraint C2{up_down dist {1:=75, 0:=25};}
endclass