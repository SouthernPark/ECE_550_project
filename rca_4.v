module rca_4(a, b, in, sum, out, overflow);
	//this module will help me create a 16 bits RCA
	
	input [3:0]	a, b;
	input	in;
	output [3:0] sum;
	output out, overflow;
	
	
	//this register will store the carry out in the previous full adder
	//at the beginning it is set as 0
	
	wire low_2_carry_out;
	wire low_2_overflow;
	rca_2 low_2(a[1:0], b[1:0], in, sum[1:0], low_2_carry_out, low_2_overflow);
	//secondly: calculate the high 8 bits with carry_in = 0
	wire [3:2] high_2_sum_0_carry;
	wire high_2_carry_out_0;
	wire high_2_overflow_0;
	rca_2 high_2_0(a[3:2], b[3:2], 1'b0, high_2_sum_0_carry[3:2], high_2_carry_out_0, high_2_overflow_0);
	
	//Thirdly, calculate teh high 8 bits with carry_in = 1
	wire high_2_overflow_1;
	wire high_2_carry_out_1;
	wire [3:2] high_2_sum_1_carry;
	rca_2 high_2_1(a[3:2], b[3:2], 1'b1, high_2_sum_1_carry[3:2], high_2_carry_out_1, high_2_overflow_1);
	
	
	//forthly: assign high 8 bit with mux
	assign sum[3:2] = low_2_carry_out ? high_2_sum_1_carry[3:2] : high_2_sum_0_carry[3:2];
	
	assign out = low_2_carry_out ? high_2_carry_out_1 : high_2_carry_out_0;
	
	//finally: assign overflow with mux
	assign overflow = low_2_carry_out ? high_2_overflow_1 : high_2_overflow_0;
	
endmodule