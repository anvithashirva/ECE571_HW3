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
		R = 32'b01000001101000001001001001000110;  I = 32'b01000001101000001001001001000110;
		A = CreateComplex(R,I);
		$display("Create complex number A");
		PrintComplex(A);
		#10
		
		R = 32'b01000001101000001001001001000110;  I = 32'b01000001101000001001001001000110;
		B = CreateComplex(R,I);
		$display("Create complex number B");
		PrintComplex(B);
		
		addmul();
		#100

		R = 32'b01000011101000001001001001010110;  I = 32'b01100001101000001001101001000110;
		A = CreateComplex(R,I);
		$display("Create complex number A");
		PrintComplex(A);
		#10
		
		R = 32'b11001001101000001001001001010110;  I = 32'b01000101101010001001001001000110;
		B = CreateComplex(R,I);
		$display("Create complex number B");
		PrintComplex(B);
		
		addmul();
		#100
		$finish;
	end
	
endmodule
