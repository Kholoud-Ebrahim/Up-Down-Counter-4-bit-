class Environment;
	Generator gen;
	Driver drv;
	Monitior mon;
	ScoreBoard scb;
	mailbox mb1;
	mailbox mb2;
	virtual InterFace VIF;
	function new(virtual InterFace VIF);
		this.VIF= VIF;
		mb1 = new();
		mb2 = new();
		gen = new(mb1);
		drv = new(mb1, VIF);
		mon = new(VIF, mb2);
		scb = new(mb2);
	endfunction

	task env_run();
		fork
			gen.run();
			drv.run();
			mon.run();
			scb.run();
		join
	endtask

	task run();
		env_run();
		$finish;
    endtask	
endclass: Environment