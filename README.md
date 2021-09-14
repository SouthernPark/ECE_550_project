# addsub-base

ZeLin Jin  (zj65)  
Qiangqiang Liu    (ql143)  

# Implementation of Adder and subtractor of ALU  

Firstly, I begin by set up an full ader module in fa.v. This full adder will help me to add two 1-bit binary with carry in. The output will be the sum and carry out.    

Secondly, I decide to create a 16-bits rca module in rca_16.v to add two 16-bits binary with carry in. We used 16 for full adders for this component. To calculate the overflow, we compared the carry in and carry out of the most significant digit with xor operation. The output of this 16-bits rca are the sum, the carry out and overflow.  


Thirdly, I create a a 32-bits csa module in csa_32.v for adding two 32-bits binary with carry in. In this component, I used three 16-bits rca adders and 17 two-to-one muxes. The first rca was used to calculate the sum of the 16 lower bits with 0 carry in. The rest two rca adders will be used to calculate the higher 16 bits with 1 carry in and 0 carry in seperately. The carry out of the first rca adder will act as input for the 17 two-to-one muxes. The first 16 muxes will select the sum result according to the input. The last mux will be used to select overflow between the two high 16 rca adders.  

Finally, I used 32-bits csa moudle created previously to implement alu. Beside, 16 not gate was used to negate the bits inside operandB. 16 two-to-one muxes were used to decide whether we should use operand B or negate operand B as the final input B. The decision is made according to the least digit ctrl_ALUopcode. Then I use the final operandB and operandA as the data input of the 32-bits csa. As for the carry in of 32-bits csa, I just use the least digit of ctrl_ALUopcode. The sum returned by the 32-bits csa will be the final result of the alu. Also, the overflow returned by the 32-bits csa will be the overflow of alu.  

Above is the implement process of our alu.  
