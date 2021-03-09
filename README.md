# Virtual-Machine-Dummy-Repo
Dummy repo that describes the actual project that is private.

This is a virtual machine environment for writing and executing assembly code. It supports two data types which are integers and characters. Memory is represented as an array of bytes where ints take up four bytes and chars one byte. The steps to the virtual machine are:

## Read file line by line and tokenize input
An assembly file is read where the contents are either a line of assembly instruction or a directive (data segment). Comments start with ; and are ignored.

## Create symbol table
The symbol table holds the name of a label with it's corresponding location in memory which is an offset.

## Create byte code in the memory array
Do a second pass read of the file and place the corresponding bytes in memory. Each assembly instruction is placed by a number. JMP is 1 for example. Operand one and two are placed in memory as well. Labels are not placed in memory since you have the symbol table for a lookup of the offset to memory. Directive are placed in memory as well with chars taking up one byte and integers taking up 4. Since integers take up 4 that means the VM will not support numbers that are too big.

## Execute the bytes in memory
The VM uses an array of size 12 for registers. R0-R7 are used as space for the assembly operations. R8-R12 are used as special pointer arrays.
R8 which is the Program Counter is incremented by 12 which is the size of an instruction and is used to keep track of the next instruction to run in memory. The program will run until a TRP 0 is read and then terminates.<br />
R9 is a pointer to the stack limit. SP is a stack pointer. FP is a frame pointer and SB is a pointer to the base or end of memory. These pointers are used for functions in the stack area of memory.

## Supported assembly instructions
An assembly instruction is written in the form of:<br />
<optional label> <instruction> <operand one> <operand two><br />

Directives which are written as data segment are written as:<br />
<label> <.INT or .BYT> <ascii number><br />
Note: in the Browser VM I made, it supports both ascii numbers and characters to initialize labels<br />

Legend:<br />
RS = Source Register<br />
RD = Destination Register<br />
RG = Register location<br />
IMM = Immediate value<br />

Instructions:<br />
(Jump instructions)<br />
JMP - Branch to label<br />
JMR - Branch to address in source register<br />
BNZ - Branch to label if source register is not zero	RS, Label<br />
BGT - Branch to label if source register is greater than zero	RS, Label<br />
BLT - Branch to label if source register is less than zero		RS, Label<br />
BRZ - Branch to label if source register is zero		RS, Label<br />

(Addressing instructions)<br />
LDA - Load the Address of the label into the RD register.		RD, Label<br />
STR - Store data into Mem from source register		RS, Label<br />
STR indirect - STR Store data at register location from source register		RS, RG<br />
STB - Store byte into Mem from source register		RS, Label<br />
STB indirect - Store byte at register location from source register		RS, RG<br />
LDR - Load destination register with data from Mem	RD, Label<br />
LDR indirect - Load destination register with data at register location		RD, RG<br />
LDB - Load destination register with byte from Mem	RD, Label<br />
LDB indirect - Load destination register with byte at register location		RD, RG<br />

MOV - Move data from source register to destination register	RD, RS<br />
ADI - Add immediate data to destination register		RD, IMM<br />
ADD - Add source register to destination register, result in destination register		RD, RS<br />
SUB - Subtract source register from destination register, result in destination register		RD, RS<br />
MUL - Multiply source register by destination register, result in destination register		RD, RS<br />
DIV - Divide destination register by source register, result in destination register		RD, RS<br />
CMP - Set destination register to zero if destination is equal to source		RD, RS<br />
	  Set destination register to greater than zero if destination is greater than source;<br />
	  Set destination register to less than zero if destination is less than source<br />

Logical Instructions OR and AND are not supported<br />

TRP 0 - Terminate program<br />
TRP 1 - Write an int to console<br />
TRP 2 - Read an int from console<br />
TRP 3 - Write a byte (in this case characters) to console<br />
TRP 4 - Read a byte from console<br />
TRP 99 - Used as a break point for debugging.<br />

## Directives
.INT value Allocate space for an integer.<br />
		Example:<br />
			MONTH .INT 12<br />
			DAY .INT 9<br />
			YEAR .INT 2005<br />
			STUFF .INT 9<br />
			.INT 17<br />
			.INT 42<br />
			.INT 53<br />

.BYT value Allocate space for one byte.<br />
		Example:<br />
			N .BYT 78 # Use the ascii code<br />
			A .BYT 65<br />
			M .BYT 77<br />
			E .BYT 69<br />
			LETTER_A .BYT ‘A’ # Or use the character. My Browser VM only supports this since it will accept either ascii code or the character<br />
			SCHOOL .BYT ‘U’<br />
			.BYT ‘V’<br />
			.BYT ‘U’<br />

.ALN is not supported<br />

## Registers supported
R[0…7] General purpose integer registers named R0 through R7 0, 1, 2, 3, 4, 5, 6, 7<br />
R8 = PC Program Counter, can't move a value into this register from a MOV instruction but you can copy its value to another register.<br />
R9 is a pointer to the stack limit or SL.<br />
R10 = SP is a stack pointer.<br />
R11 = FP is a frame pointer.<br />
R12 = SB is a pointer to the base or end of memory.<br />
