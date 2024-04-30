module AddSub8Bit (result, x, y, ccn, ccz, ccv, ccc, sub);
	parameter N = 8;
	input [N-1:0] x, y;
	output [N-1:0] result;
	output ccn, ccz, ccv, ccc;
	input sub;

	logic [N-1:0] B;
	logic [N:0] c;

	//Invert input y for subtraction 		
	//when sub is asserted input y is inverted
	genvar k;
	generate 
	for (k=0;k<N;k++)
	begin: XOR
		xor X (B[k],sub,y[k]);
	end
	endgenerate

	//Instantiate full adder and generate carry flag
	FullAdder FADUTS (x[0], B[0], sub, result[0], c[1]);
	
	genvar i;
	generate
		for (i = 1; i < N-1; i++)
		begin: FA
			FullAdder FADUT (x[i], B[i], c[i], result[i], c[i+1]);
		end
	endgenerate

	FullAdder FADUTC (x[N-1], B[N-1], c[N-1], result[N-1], ccc);
	
	//Overflow flag
	xor xor1(ccv,ccc,c[N-1]);
	
	//Zero flag
	assign ccz = (result == 0) ? 1 : 0; 
	
	//Negative flag
	buf buf1(ccn,result[N-1]);

endmodule
