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
R8 which is the Program Counter is incremented by 12 which is the size of an instruction and is used to keep track of the next instruction to run in memory. The program will run until a TRP 0 is read and then terminates.
