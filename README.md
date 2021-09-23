# addsub-base

ZeLin Jin  (zj65)  
Qiangqiang Liu    (ql143)  

# Implementation of the full ALU

Firstly, we implemented AND, OR, SLL, SRA module.  
The AND OR modules are relative easy to implement. Just use 32 and gates and or gates to connect operandA and operandB together.  
As for the SLL module, I use five level muxes.  
First level mux --> move operandA 0 or 1 bits left,  specified by the least significant digit ctrl_shiftamt[0].   
		Bit at i position of operandA will be connnected to the i-1 position.  
		For positions that does not have i-1 position (the 0 position) will be connected to 0 directly.
Second level mux --> move the operandA move 0 or 2 bits, specified by the least significant digit ctrl_shiftamt[1].  
		Bit at i position of operandA will be connnected to the i-1 position.  
		For positions that does not have i-1 position (the 0 position) will be connected to 0 directly.
Third level -> move 0 or 4 bits, specified by the least significant digit ctrl_shiftamt[2].  
Forth level -> move 0 or 8 bits, specified by the least significant digit ctrl_shiftamt[3].  
Fifth level -> move 0 or 16 bits, specified by the least significant digit ctrl_shiftamt[4].  



For one input, we need to calculate its ADD, SUB, ADD, OR, SLL, SRA result.  

Finally, I am gonna to use a 3 bits mux to select the result we need



 
