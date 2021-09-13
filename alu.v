module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] not_B;
	
	
	genvar i;
	generate	
		for(i=0;i<32;i=i+1) begin: negation
				not neg(not_B[i], data_operandB[i]);
		end
	endgenerate
	
	
	//using mux to decide whether B or not B should goes into csa
	wire [31:0] which_B;
	
	assign which_B = ctrl_ALUopcode[0] ? not_B : data_operandB;
	
	//carry in should be the least digit of ctrl_ALUopcode
	//wire carry_in;
	//assign carry_in = ctrl_ALUopcode[0];
	
	
	csa_32 alu(data_operandA, which_B, ctrl_ALUopcode[0], data_result, overflow);
	
endmodule
