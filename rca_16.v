module rca_16(a, b, in, sum, out, overflow);
	//this module will help me create a 16 bits RCA
	
	input [15:0]	a, b;
	input	in;
	output [15:0]	sum;
	output out, overflow;
	
	
	//this register will store the carry out in the previous full adder
	//at the beginning it is set as 0
	
	wire low_8_carry_out;
	wire low_8_overflow;
	rca_8 low_8(a[7:0], b[7:0], in, sum[7:0], low_8_carry_out, low_8_overflow);
	//secondly: calculate the high 8 bits with carry_in = 0
	wire [15:8] high_8_sum_0_carry;
	wire high_8_carry_out_0;
	wire high_8_overflow_0;
	rca_8 high_8_0(a[15:8], b[15:8], 1'b0, high_8_sum_0_carry[15:8], high_8_carry_out_0, high_8_overflow_0);
	
	//Thirdly, calculate teh high 8 bits with carry_in = 1
	wire high_8_overflow_1;
	wire high_8_carry_out_1;
	wire [15:8] high_8_sum_1_carry;
	rca_8 high_8_1(a[15:8], b[15:8], 1'b1, high_8_sum_1_carry[15:8], high_8_carry_out_1, high_8_overflow_1);
	
	
	//forthly: assign high 8 bit with mux
	assign sum[15:8] = low_8_carry_out ? high_8_sum_1_carry[15:8] : high_8_sum_0_carry[15:8];
	
	assign out = low_8_carry_out ? high_8_carry_out_1 : high_8_carry_out_0;
	
	//finally: assign overflow with mux
	assign overflow = low_8_carry_out ? high_8_overflow_1 : high_8_overflow_0;
	
endmodule