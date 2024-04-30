import complexpkg::*;

module top;	
	complex A,B;
	shortreal R,I;
	
	task automatic addmul();
		complex Result;
		Result = AddComplex(A,B);
		$display("Result: Addition of complex numbers");
		PrintComplex(Result);
		
		ComplexToComponents(Result,R,I);
		$display("Result of addition:components of complex number");
		$display("r: %g, i: %g",R,I);
			
		Result = MultComplex(A,B);
		$display("Result: Multiplication of complex numbers");
		PrintComplex(Result);
		
		ComplexToComponents(Result,R,I);
		$display("Result of Multiplication:components of complex numbers");
		$display("r: %g, i: %g",R,I);	
	endtask

	task CreateFPComplex(input shortreal R1,I1,R2,I2);
		A = CreateComplex(R1,I1);
		$display("Create complex number A");
		PrintComplex(A);
		#10;

		B = CreateComplex(R2,I2);
		$display("Create complex number B");

		PrintComplex(B);
		#10;

		addmul();
		#50;
	endtask
	
	initial 
	begin
		CreateFPComplex (2567,4578,2245,4627);
		CreateFPComplex (3768,4578,2891,5614);
		CreateFPComplex (2237,4178,2275,4127); 
		CreateFPComplex (2137,4148,2175,4157);
		CreateFPComplex (5624,8976,4156,4567);

		$finish;
	end	
endmodule
