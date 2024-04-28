module FullAdder(A, B, CI, S, CO);
	input A, B, CI;
	output S, CO;
	 
	wire [3:0] w;
	 
	xor xor1(w[0],A,B),
		xor2(S,CI,w[0]);
		
	and and1(w[1],A,B),
		and2(w[2],A,CI),
		and3(w[3],CI,B);
		
	or or1(CO,w[1],w[2],w[3]);
	
endmodule

/*
module FullAdderNbit(A, B, CI, S, CO);
	parameter N = 8;
	input [N-1:0] A, B;
	input CI;
	output [N-1:0] S;
	output CO;
	
	logic [N:0] c;
	
	assign c[0] = CI;
	assign CO = c[N];
	
	//xor xor1(ccv,c[N],c[N-1]);
	
	genvar i;
	generate
		for (i = 0; i < N; i++)
		begin: FA
			FullAdder FADUT (A[i], B[i], c[i], S[i], c[i+1]);
		end
	endgenerate
endmodule
*/
