module Normalize_mul(input [21:0] big_product,input [4:0]exponent_res,
							output reg [9:0]mantissa_Res,output reg[4:0]exp_res);

always @(big_product,exponent_res) begin
		casex(big_product) 
			22'b1xxxxxxxxxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[20:11];
			    exp_res = exponent_res + 1;
			  end
			22'b01xxxxxxxxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[19:10];
			    exp_res = exponent_res;
			  end
			22'b001xxxxxxxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[18:9];
			    exp_res = exponent_res-1;
			  end
			22'b0001xxxxxxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[17:8];
			    exp_res = exponent_res-2;
			  end
			22'b00001xxxxxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[16:7];
			    exp_res = exponent_res-3;
			  end
			22'b000001xxxxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[15:6];
			    exp_res = exponent_res-4;
			  end
			22'b0000001xxxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[14:5];
			    exp_res = exponent_res-5;
			  end
			22'b00000001xxxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[13:4];
			    exp_res = exponent_res-6;
			  end
			22'b000000001xxxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[12:3];
			    exp_res = exponent_res-7;
			  end
			22'b0000000001xxxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[11:2];
			    exp_res = exponent_res-8;
			  end
			22'b00000000001xxxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[10:1];
			    exp_res = exponent_res-9;
			  end
			22'b000000000001xxxxxxxxxx:
			  begin
			    mantissa_Res = big_product[9:0];
			    exp_res = exponent_res-10;
			  end
			22'b0000000000001xxxxxxxxx:
			  begin
			    mantissa_Res = {big_product[8:0],1'b0};
			    exp_res = exponent_res-11;
			  end
			22'b00000000000001xxxxxxxx:
			  begin
			    mantissa_Res = {big_product[7:0],2'b00};
			    exp_res = exponent_res-12;
			  end
			22'b000000000000001xxxxxxx:
			  begin
			    mantissa_Res = {big_product[6:0],3'b000};
			    exp_res = exponent_res-13;
			  end
			22'b0000000000000001xxxxxx:
			  begin
			    mantissa_Res = {big_product[5:0],4'b0000};
			    exp_res = exponent_res-14;
			  end
			22'b00000000000000001xxxxx:
			  begin
			    mantissa_Res = {big_product[4:0],5'b0000};
			    exp_res = exponent_res-15;
			  end
			22'b000000000000000001xxxx:
			  begin
			    mantissa_Res = {big_product[3:0],6'b0};
			    exp_res = exponent_res-16;
			  end
			22'b0000000000000000001xxx:
			  begin
			    mantissa_Res = {big_product[2:0],7'b0};
			    exp_res = exponent_res-17;
			  end
			22'b00000000000000000001xx:
			  begin
			    mantissa_Res = {big_product[1:0],8'b0};
			    exp_res = exponent_res-18;
			  end
			22'b000000000000000000001x:
			  begin
			    mantissa_Res = {big_product[0],9'b0};
			    exp_res = exponent_res-19;
			  end
			default:
			  begin
			    mantissa_Res = 10'b0;
			    exp_res = 5'b0;
			  end
      			endcase
end
endmodule
 