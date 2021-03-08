
; FRAME for main -------------------------
 MOV R5 FP
MOV FP SP
ADI SP -12 ; make room for RTN address, PFP and 'this'
MOV R7 SP
MOV R0 SP
CMP R0 SL
BLT R0 STACK_OVERFLOW_ERR
ADI R7 4 ; 'this'
LDR R2 null; load what's in the address of null into R2
STR R2 R7
ADI R7 4 ; PFP
STR R5 R7
; FRAME END ------------------------- 

;CALL -------------------------
ADI R7 4 ; RTN address
MOV R0 PC
ADI R0 36
STR R0 R7
 JMP main; jump to function main 
;CALL END -------------------------

PROGRAM_END TRP 0 ; Program stops here
; ------------------------- 

; FUNC main Performing: void kxi2020 main ( ) { 
main ADI R0 0; NO OP
ADI SP -0
MOV R0 SP
CMP R0 SL
BLT R0 STACK_OVERFLOW_ERR
; FUNC END -------------------------

; WRITE Performing: cout << 'H' ; 
 ADI R0 0 ; NO OP
LDB R3 H100; load what's in the address of H100 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H101; load what's in the address of H101 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'l' ; 
 ADI R0 0 ; NO OP
LDB R3 H102; load what's in the address of H102 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'l' ; 
 ADI R0 0 ; NO OP
LDB R3 H102; load what's in the address of H102 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'o' ; 
 ADI R0 0 ; NO OP
LDB R3 H103; load what's in the address of H103 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H104; load what's in the address of H104 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'W' ; 
 ADI R0 0 ; NO OP
LDB R3 H105; load what's in the address of H105 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'o' ; 
 ADI R0 0 ; NO OP
LDB R3 H103; load what's in the address of H103 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'r' ; 
 ADI R0 0 ; NO OP
LDB R3 H106; load what's in the address of H106 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'l' ; 
 ADI R0 0 ; NO OP
LDB R3 H102; load what's in the address of H102 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'd' ; 
 ADI R0 0 ; NO OP
LDB R3 H107; load what's in the address of H107 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '!' ; 
 ADI R0 0 ; NO OP
LDB R3 H108; load what's in the address of H108 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '\n' ; 
 ADI R0 0 ; NO OP
LDB R3 H109; load what's in the address of H109 into R3
TRP 3
; WRITE END------------------------- 

; RTN --------------------------------- 
 ADI R0 0
MOV SP FP
MOV R6 FP
CMP R6 SB
BGT R6 STACK_UNDERFLOW_ERR
LDR R6 FP ; rtn address
MOV R5 FP
ADI R5 -4
LDR FP R5 ; PFP -> FP
JMR R6 ; GOTO rtn addr
; RTN END------------------------- 
STACK_OVERFLOW_ERR ADI R0 0
LDR R0 null
ADI R0 404
JMP DISPLAY_ERR

STACK_UNDERFLOW_ERR ADI R0 0
LDR R0 null
ADI R0 303
JMP DISPLAY_ERR

DISPLAY_ERR ADI R0 0
MOV R3 R0
TRP 1
JMP PROGRAM_END


; Global Data Segment
true .INT 1
false .INT 0
null .INT 0
H100 .BYT 72
H101 .BYT 101
H102 .BYT 108
H103 .BYT 111
H104 .BYT 32
H105 .BYT 87
H106 .BYT 114
H107 .BYT 100
H108 .BYT 33
H109 .BYT 10
