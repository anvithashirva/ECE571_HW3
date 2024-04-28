module top;
	logic  A, B,CI;
	wire S,CO;
	
	logic error;
	localparam N = 8;
	
	FullAdder FADUT (A, B, CI, S, CO);
	
	task automatic ComputeExpectedOutput(input logic A,B,CI);
		logic [1:0] ExpectedOutput;
		ExpectedOutput = A + B + CI;
		if (ExpectedOutput !== {CO,S})
		begin
			error = 1;
			$display("Inputs: A = %b, B = %b, CI = %b",A,B,CI);
			$display("Expected outputs: S = %b, CO = %b",ExpectedOutput[0],ExpectedOutput[1]);
			$display("Observed outputs: S = %b, CO = %b",S,CO);
		end
	endtask
	
	initial 
	begin
		error = 0;
		$monitor("A = %b, B = %b, CI = %b, S = %b, CO = %b",A,B,CI,S,CO);
		
		for (int i=0;i<N;i++)
		begin
			{A,B,CI} = i;
			#10;
			ComputeExpectedOutput(A,B,CI);	
			#10;
		end

		if (!error)
			$display("ALL TESTS PASSED");
	$finish;
	end
	
endmodule
