module Extraction_add(input [15:0]numA, input [15:0]numB,
		      output reg sign_A,sign_B,output reg [4:0]Exp_Res,
		      output reg [10:0]mantissa_A,output reg [10:0]mantissa_B);

reg [10:0]mA;reg [10:0]mB;reg [4:0]ExpA; reg [4:0]ExpB;
always@(numA,numB) begin
	sign_A = numA[15];// Extarcting sign bits 
	sign_B = numB[15];
	ExpA   = numA[14:10];
	ExpB   = numB[14:10];
	if({sign_A,ExpA,numA[9:0]} == 16'b0) 
		mA = {1'b0, numA[9:0]};//Adding hidden bits
	else    mA = {1'b1, numA[9:0]};//Adding hidden bits
	if({sign_B,ExpB,numB[9:0]} == 16'b0) 
		mB = {1'b0, numB[9:0]};
	else 	mB = {1'b1, numB[9:0]};
	
	if(ExpA > ExpB)begin //Aligning the mantissa
		Exp_Res = ExpA;
		mantissa_A = mA;
		mantissa_B = mB >> (ExpA - ExpB);end
	else if(ExpB > ExpA)begin
		Exp_Res = ExpB;
		mantissa_A = mA >> (ExpB - ExpA);
		mantissa_B = mB; end
	else begin
		Exp_Res = ExpA;
		mantissa_A = mA;
		mantissa_B = mB; end
end endmodule

