# addsub-base

ZeLin Jin  (zj65)  
Qiangqiang Liu    (ql143)  

# Implementation of the full ALU

The overall process is that I firstly built up five modules: the SUM_SUB, AND, OR, SLL and SRA modules. Then all these
five modules were used to calculate the output based on the input. Different moudle output is stored in different wire
sets. Then I use a 3 selection bits mux to select between the output.  
The implementation of AND, OR, SLL ,SRA moudules and the isLessThan, notEqual are specified below:

## AND, OR
AND and OR are created useing 32 and gates and 32 or gates to connect between operandA and operandB.  

## SLL
In SLL module, I use five level of muxes. Each level will have 32 muxes.
>First level mux --> move operandA 0 or 1 bits left,  specified by the least significant digit ctrl_shiftamt[0].  
Bit at i position of operandA will be connnected to the i-1 position.  
For positions that does not have i-1 position (the 0 position) will be connected to 0 directly.  
This will produce a first level result stored in wire[31:0].  

>Second level mux --> move the operandA move 0 or 2 bits, specified by the least significant digit ctrl_shiftamt[1].  
Bit at i position of  will be connnected to the i-2 position.  
For positions that does not have i-2 position (the 0,1 pos) will be connected to 0 directly.
		
>Third level -> move 0 or 4 bits, specified by the least significant digit ctrl_shiftamt[2].  
Bit at i position of operandA will be connnected to the i-4 position.  
For positions that does not have i-4 position (the 0,1,2,3 pos) will be connected to 0 directly.
		
>Forth level -> move 0 or 8 bits, specified by the least significant digit ctrl_shiftamt[3].  
Bit at i position of operandA will be connnected to the i-8 position.  
For positions that does not have i-8 position (the 0,1...,7 pos) will be connected to 0 directly.
		
>Fifth level -> move 0 or 16 bits, specified by the least significant digit ctrl_shiftamt[4].  
Bit at i position of operandA will be connnected to the i-16 position.  
For positions that does not have i-8 position (the 0,1...,15 pos) will be connected to 0 directly.


For one input, we need to calculate its ADD, SUB, ADD, OR, SLL, SRA result.  

Finally, I am gonna to use a 3 bits mux to select the result we need



 
