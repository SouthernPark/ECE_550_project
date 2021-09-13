module rca_2(a, b, in, sum, out, overflow);
	//this module will help me create a 16 bits RCA
	
	input [1:0]	a, b;
	input	in;
	output [1:0] sum;
	output out, overflow;

	//this register will store the carry out in the previous full adder
	//at the beginning it is set as 0
	
	//we need 17 wires for the carry in and carry out
	wire [2:0] carry;
	//carry[0] is the initial carry which depends on the input carry in
	assign carry[0]=in;
	
	//use for loop to connect the full adders
	//we need 16 full adders

	fa full_adder1(a[0], b[0], carry[0], sum[0], carry[1]);
	fa full_adder2(a[1], b[1], carry[1], sum[1], carry[2]);

	//the last carry is the output carry
	assign out = carry[2];
	
	//wire[8] is the CO of the last digit
	//wire[7] is the CI of the last digit
	//if CI != CO, then there is an overflow
	//we can use xor CI and CO to classify overflow
	xor(overflow, carry[1], carry[2]);
endmodule
