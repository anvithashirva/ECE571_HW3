module top;

	import complexpkg::*;
	
	complex A,B,Result;
	shortreal R,I;
	
	task addmul();
		Result = AddComplex(A,B);
		$display("Result: Addition of complex numbers");
		PrintComplex(Result);
		
		ComplexToComponents(Result,R,I);
		$display("Complex to components");
		$display("r: %g, i: %g",R,I);
		
		
		Result = MultComplex(A,B);
		$display("Result: Multiplication of complex numbers");
		PrintComplex(Result);
		
		ComplexToComponents(Result,R,I);
		$display("Complex to components");
		$display("r: %g, i: %g",R,I);
		
	endtask
	
	initial 
	begin
		R = 0_10000011_01000001001001001000110;  I = 0_10000011_01000001001001001000110;
		A = CreateComplex(R,I);
		$display("A:")
		PrintComplex(A);
		#10
		
		R = 0_10000011_01000001001001001000110;  I = 0_10000011_01000001001001001000110;
		B = CreateComplex(R,I);
		$display("B:")
		PrintComplex(B);
		
		addmul();
		#100
		$finish;
	end
	
endmodule