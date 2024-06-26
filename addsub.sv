module AddSub8Bit (result, x, y, ccn, ccz, ccv, ccc, sub);
	parameter N = 8;
	input [N-1:0] x, y;
	output [N-1:0] result;
	output ccn, ccz, ccv, ccc;
	input sub;

	logic [N-1:0] B;
	wire [N-2:0] tempresult;
	
	logic [N:0] c;
	
	assign c[0] = sub;
	assign ccc = c[N];
	
	genvar i;
	generate
		for (i = 0; i < N; i++)
		begin: FA
			FullAdder FADUT (x[i], B[i], c[i], result[i], c[i+1]);
		end
	endgenerate
	
	xor xor1(ccv,c[N],c[N-1]);
	
	//CI is implemented using buffer, sub is the input to the buffer --assign CI = (sub) ? '1 : '0;
	//not not1(n1,sub),
		//not2(CI,n1);
		
	//assign B = (sub) ? ~y : y; is implemented as XOR gate
	genvar i;
	generate 
	for (i=0;i<N;i++)
	begin: XOR
		xor X (B[i],sub,y[i]);
	end
	endgenerate
	
	
	//assign ccz = (result == 0) ? '1 : '0; //Bitwise OR operation followed by NOT operation
	genvar j;
	generate 
	for (j=0;j<N-1;j++)
	begin: OR
		or O (tempresult[i+1],result[i],tempresult[i+1]);
	end
	endgenerate
	
	not not3(ccz,tempresult[N-2]);
	
	//ADD operation of N-1th bit of result and vdd = 1 Volt
	and and1(ccn,result[N-1],1'b1);

endmodule