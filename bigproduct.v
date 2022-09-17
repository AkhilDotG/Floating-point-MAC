module bigproduct(input[10:0]mantissa_A, input [10:0]mantissa_B,
							output reg [21:0] product);

always@(mantissa_A,mantissa_B) begin
		product = mantissa_A*mantissa_B;
end
endmodule


 