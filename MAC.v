module MAC(input [15:0]numA,input [15:0]numB,input clk,input Asynch_Reset, output reg [15:0] ACC_Result);

/*----------Start of Multiplier variables-----------*/
/*-----------Outputs of Extraction_mul--------------*/
wire Sign_prod;
wire [4:0]Exponent_prod;
wire [10:0]MantissaA_prod;
wire [10:0]MantissaB_prod;
/*-----------Outputs of bigproduct-----------------*/
wire [21:0]Product_22;
reg Sign_prod1;
reg [4:0]Exponent_prod1;
reg [21:0]Product_22_1;
/*-----------Outputs of Normalize_mul-------------*/
wire [9:0] Mantissa_prod;
wire [4:0] Exp_prod;
reg SP;
reg [4:0]EP;
reg [9:0] MP;

reg [15:0] Product;
/*----------End of Multiplier variables-----------------*/

/*----------Start of Multiplier instatiations-----------*/
Extraction_mul U1(numA,numB,Sign_prod,Exponent_prod,MantissaA_prod,MantissaB_prod);
bigproduct U2(MantissaA_prod,MantissaB_prod,Product_22);
Normalize_mul  U3(Product_22_1,Exponent_prod1,Mantissa_prod,Exp_prod);
/*----------End of Multiplier instatiations------------*/

/*----------Start of Adder variables-------------------*/

wire sign_A_Add;
wire sign_B_Add;
wire [4:0]Exp_Res_Add;
wire [10:0]mantissa_A_Add;
wire [10:0]mantissa_B_Add;

wire sign_res_add;
wire [11:0] bigsum12;

reg sign_res_add1;
reg [4:0]Exp_Res_Add1;
reg [11:0] bigsum12_1;

reg [15:0] ACC_Result_q = 16'h0000;


wire [9:0]mantissa_ans;
wire [4:0]exp_res_ans;


/*----------End of Adder variables---------------------*/

/*----------Start of Adder instatiations---------------*/
Extraction_add U4(Product,ACC_Result_q, sign_A_Add, sign_B_Add, Exp_Res_Add, mantissa_A_Add, mantissa_B_Add);

bigsum U5(sign_A_Add,sign_B_Add,mantissa_A_Add,mantissa_B_Add,sign_res_add,bigsum12);

Normalize_add  U6(bigsum12_1,Exp_Res_Add1,mantissa_ans,exp_res_ans);
/*----------End of Adder instatiations-----------*/
always @(SP,EP,MP) begin
Product = {SP,EP,MP};
end

always@(posedge clk or posedge Asynch_Reset) begin

if(Asynch_Reset) begin
	/*Stage_1 Multiply*/
	Sign_prod1 <= 0;Exponent_prod1 <= 0;Product_22_1 <= 0;

	/*Stage_2 Normalize*/
	SP <= 0;EP <= 0;MP <= 0;

	/*Stage_3 Adder nomalize*/
	sign_res_add1 <= 0;Exp_Res_Add1  <= 0;bigsum12_1    <= 0;
end
else begin
	/*Stage_1 Multiply*/
	Sign_prod1 <= Sign_prod;Exponent_prod1 <= Exponent_prod;
	Product_22_1 <= Product_22;

	/*Stage_2 Normalize*/
	SP <= Sign_prod1;EP <= Exp_prod;MP <= Mantissa_prod;

	/*Stage_3 Adder nomalize*/
	sign_res_add1 <= sign_res_add;Exp_Res_Add1  <= Exp_Res_Add;
	bigsum12_1    <= bigsum12;

end end

always@(*) begin
ACC_Result = {sign_res_add1,exp_res_ans,mantissa_ans};end

always@(*) begin

ACC_Result_q = {sign_res_add1,exp_res_ans,mantissa_ans};

end
endmodule




