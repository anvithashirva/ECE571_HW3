module top;
	parameter N = 8;
	logic [N-1:0] x, y;
	wire [N-1:0] result;
	wire ccn, ccz, ccv, ccc;
	logic sub;
	
	logic error;
	wire [N-1:0] resultG;
	wire ccnG, cczG, ccvG, cccG;
	logic [N+4-1:0] DUTResult;
	logic [N+4-1:0] KGMResult;
	
	AddSub8Bit #(N) DUT(result, x, y, ccn, ccz, ccv, ccc, sub);
	AddSub8BitGolden #(N) KGM(resultG, x, y, ccnG, cczG, ccvG, cccG, sub);
	
	task CompareResults();
		DUTResult = {result,ccn,ccz,ccv,ccc};
		KGMResult = {resultG,ccnG,cczG,ccvG,cccG}
		if (DUTResult !== KGMResult)
		begin
			error = 1;
			$display("Inputs: x = %b, y = %b, sub = %b",x,y,sub);
			$display("Expected outputs: result = %b, ccn = %b, ccz = %b, ccv = %b, ccc = %b",ccn,ccz,ccv,ccc);
			$display("Observed outputs: result = %b, ccn = %b, ccz = %b, ccv = %b, ccc = %b",ccn,ccz,ccv,ccc);
		end
	endtask
	
	initial 
	begin
		error = 0;
		
		sub = 0;
		repeat (2)
		begin
			for (int i=0;i<2**N-1;i++)
			begin
				x = i;
				for (int j=0;j<2**N-1;j++)
				begin
					y = j;
					CompareResults();
				end
			end
		sub = ~sub;
		end  
		
		if (!error)
			$display("ALL TESTS PASSED");
	$finish;
	end
	
/*	
	A = '1; B = ~A; CI = 0;
		ComputeExpectedOutput(A,B,CI);
		A = '1; B = ~A; CI = 1;
		ComputeExpectedOutput(A,B,CI);
		
		A = '0; B = ~A; CI = 0;
		ComputeExpectedOutput(A,B,CI);
		A = '0; B = ~A; CI = 1;
		ComputeExpectedOutput(A,B,CI);
		
		A = {N/2{2'b10}}; B = ~A; CI = 0;
		ComputeExpectedOutput(A,B,CI);
		
		A = {N/2{2'b10}}; B = ~A; CI = 1;
		ComputeExpectedOutput(A,B,CI);
		
		A = {N/2{2'b01}}; B = ~A; CI = 0;
		ComputeExpectedOutput(A,B,CI);
		
		A = {N/2{2'b01}}; B = ~A; CI = 1;
		ComputeExpectedOutput(A,B,CI); */
	
endmodule

module AddSub8BitGolden (result, x, y, ccn, ccz, ccv, ccc, sub);
	parameter N = 8;
	input [N-1:0] x, y;
	output [N-1:0] result;
	output ccn, ccz, ccv, ccc;
	input sub;
	
	logic [N-1:0] invY;
	logic CI;
	
	always @ (x,y,sub)
	begin
		if (sub)
			{ccc,result} = x - y ; 
		else
			{ccc,result} = x + y; 
		end
	
		ccn = result[N-1];
		if (result === 0)
			ccz = '1;
		else
			ccz = '0;
			
		if (x[N-1] === y[N-1])
			begin
			if(result[N-1] !== y[N-1])
				ccv =  '1;  
			end
	end
	
	
endmodule