module ALU #(
	parameter width = 32,
	parameter op = 4
)
(
	input [width-1 : 0] 		 a,
	input [width-1 : 0]      b,
	input [op-1 : 0]         opcode,
	
	output reg [width-1 : 0] out_alu,
	output    					 zero_flag
);

	always @(*) begin
		case(opcode) 
			4'b0000: out_alu = a + b; 														// add
			4'b0001: out_alu = a - b; 														// sub
			4'b0010: out_alu = a << b; 													//set left logical sll
			4'b0011: out_alu = (a < b) ? 32'd1 : 32'd0; 								//slt
			4'b0100: out_alu = $unsigned(a) < $unsigned(b) ? 32'b1 : 32'b0; 	// sltu
			4'b0101: out_alu = a ^ b; 														// xor
			4'b0110: out_alu = a >> b; 													// srl
			4'b0111: out_alu = a >>> b; 													// sra
			4'b1000: out_alu = a | b; 														// or
			4'b1001: out_alu = a & b; 														// and
			default: out_alu = 32'd0;
			endcase
	end

	assign zero_flag = (out_alu == 32'd0) ? 1 : 0;
endmodule
	