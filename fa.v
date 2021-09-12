module fa(a, b, in, sum, out);
	//this module will create full adders for me
	input a, b, in;
	output sum, out;
	
	wire a_xor_b;
	
	wire a_and_b;
	wire cin_and_a_xor_b;
	
	xor xor_1(a_xor_b, a, b);
	xor xor_2(sum, a_xor_b, in);
	
	and and_1(a_and_b, a, b);
	and and_2(cin_and_a_xor_b, in, a_xor_b);
	
	or or_1(out, a_and_b, cin_and_a_xor_b);
	
	
endmodule