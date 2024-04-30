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
