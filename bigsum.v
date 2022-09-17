module bigsum(input sign_A, input sign_B, input [10:0]mantissa_A,input [10:0]mantissa_B,
output reg sign_res,output reg [11:0] bigsum12);

always@(mantissa_A,mantissa_B,sign_A,sign_B) begin
	case({sign_A,sign_B})

	2'b00 , 2'b11 : begin bigsum12 = mantissa_A + mantissa_B;
			      sign_res = sign_A;end
	2'b01 , 2'b10 : begin
			   if(mantissa_A > mantissa_B)begin
				bigsum12 = mantissa_A - mantissa_B;
				sign_res = sign_A; end
			   else if (mantissa_B > mantissa_A)begin
				bigsum12 = mantissa_B - mantissa_A;
				sign_res = sign_B; end
			   else begin
				bigsum12 = 12'b0;
				sign_res = 0; end
			end
	endcase

end
endmodule


