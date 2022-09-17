module Normalize_add(input [11:0]bigsum12,input [4:0]exponent_res,output reg [9:0]mantissa_Res,output reg[4:0]exp_res);

always @(bigsum12,exponent_res) begin
		casex(bigsum12) 
			12'b1xxxxxxxxxxx:
			  begin
			    mantissa_Res = bigsum12[10:1];
			    exp_res = exponent_res + 1;
			  end
			12'b01xxxxxxxxxx:
			  begin
			    mantissa_Res = bigsum12[9:0];
			    exp_res = exponent_res;
			  end
			12'b001xxxxxxxxx:
			  begin
			    mantissa_Res = {bigsum12[8:0],1'b0};
			    exp_res = exponent_res-1;
			  end
			12'b0001xxxxxxxx:
			  begin
			    mantissa_Res = {bigsum12[7:0],2'b0};
			    exp_res = exponent_res-2;
			  end
			12'b00001xxxxxxx:
			  begin
			    mantissa_Res = {bigsum12[6:0],3'b0};
			    exp_res = exponent_res-3;
			  end
			12'b000001xxxxxx:
			  begin
			     mantissa_Res = {bigsum12[5:0],4'b0};
			    exp_res = exponent_res-4;
			  end
			12'b0000001xxxxx:
			  begin
			     mantissa_Res = {bigsum12[4:0],5'b0};
			    exp_res = exponent_res-5;
			  end
			12'b00000001xxxx:
			  begin
			     mantissa_Res = {bigsum12[3:0],6'b0};
			    exp_res = exponent_res-6;
			  end
			12'b000000001xxx:
			  begin
 			     mantissa_Res = {bigsum12[2:0],7'b0};
			    exp_res = exponent_res-7;
			  end
			12'b0000000001xx:
			  begin
			     mantissa_Res = {bigsum12[1:0],8'b0};
			    exp_res = exponent_res-8;
			  end
			12'b00000000001x:
			  begin
			     mantissa_Res = {bigsum12[0],9'b0};
			    exp_res = exponent_res-9;
			  end
			default:
			  begin
			    mantissa_Res = 10'b0;
			    exp_res = 5'b0;
			  end

      			endcase
end
endmodule
