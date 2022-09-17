module Extraction_mul(input [15:0]numA,input [15:0]numB,
							 output reg sign_res,output reg [4:0] exponent_res,
							 output reg [10:0]mantissa_A,output reg [10:0]mantissa_B);
							 
reg [9:0]m1;reg [9:0]m2;

always@(numA,numB) begin

	m1 = numA[9:0];
	m2 = numB[9:0];
	
   if(numA == 16'h0000 || numB == 16'h0000) begin
		sign_res = 1'b0;
		mantissa_A = {1'b0, m1};
		mantissa_B = {1'b0, m2};
		exponent_res = 5'b00000;
	end
	else begin
		sign_res   = (numA[15] ^ numB [15]); //sign
		exponent_res = (numA[14:10] + numB[14:10]) - 5'b01111; //exponent
		mantissa_A = {1'b1, m1};
		mantissa_B = {1'b1, m2};
	end
	

end
endmodule

