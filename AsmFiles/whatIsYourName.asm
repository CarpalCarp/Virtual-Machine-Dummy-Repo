
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
ADI SP -108
MOV R0 SP
CMP R0 SL
BLT R0 STACK_OVERFLOW_ERR
; FUNC END -------------------------

; MUL Performing: sizeof(pointer) * 10 -> t143 
 ADI R0 0 ; NO OP
LDR R2 false ; load 0 into R2
ADI R2 1 ; add size of pointer
LDR R3 N101; load what's in the address of N101 into R3
MUL R2 R3
MOV R3 FP; move copy of FP into R3 
ADI R3 -20 
STR R2 R3 ; store what's in R2 into the address of R3

; MUL END-------------------------

; NEW Performing: malloc(t143) -> t144
; Allocate space to put an array in memory
 MOV R6 SL
MOV R3 FP; move copy of FP into R3 
ADI R3 -20 
LDR R3 R3; load what's in the address of R3 into R3
ADD SL R3 ; Add size of array which is in R3 into SL
; Find address of t144
MOV R3 FP
ADI R3 -24
; Move the array pointer to the temporary(t144)
STR R6 R3
; NEW END -------------------------

; MOV Performing: char [ ] name = new char [ 10 ] ; 
 ADI R0 0; NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -24 
LDR R3 R3; load what's in the address of R3 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -16 
STR R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; MOV Performing: int cnt = 0 ; 
 ADI R0 0; NO OP
LDR R3 N104; load what's in the address of N104 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
STR R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; MOV Performing: int nameSize = 10 ; 
 ADI R0 0; NO OP
LDR R3 N101; load what's in the address of N101 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -28 
STR R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N104; load what's in the address of N104 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -40 
STR R4 R1 ; store the offset that's in R4 into the address of r148
; AEF END -------------------------

; MOV Performing: r148 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -40 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N107; load what's in the address of N107 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -44 
STR R4 R1 ; store the offset that's in R4 into the address of r149
; AEF END -------------------------

; MOV Performing: r149 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -44 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N108; load what's in the address of N108 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -48 
STR R4 R1 ; store the offset that's in R4 into the address of r150
; AEF END -------------------------

; MOV Performing: r150 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -48 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N109; load what's in the address of N109 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -52 
STR R4 R1 ; store the offset that's in R4 into the address of r151
; AEF END -------------------------

; MOV Performing: r151 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -52 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N110; load what's in the address of N110 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -56 
STR R4 R1 ; store the offset that's in R4 into the address of r152
; AEF END -------------------------

; MOV Performing: r152 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -56 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N111; load what's in the address of N111 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -60 
STR R4 R1 ; store the offset that's in R4 into the address of r153
; AEF END -------------------------

; MOV Performing: r153 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -60 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N112; load what's in the address of N112 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -64 
STR R4 R1 ; store the offset that's in R4 into the address of r154
; AEF END -------------------------

; MOV Performing: r154 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -64 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N113; load what's in the address of N113 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -68 
STR R4 R1 ; store the offset that's in R4 into the address of r155
; AEF END -------------------------

; MOV Performing: r155 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -68 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N114; load what's in the address of N114 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -72 
STR R4 R1 ; store the offset that's in R4 into the address of r156
; AEF END -------------------------

; MOV Performing: r156 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -72 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
LDR R2 N115; load what's in the address of N115 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -76 
STR R4 R1 ; store the offset that's in R4 into the address of r157
; AEF END -------------------------

; MOV Performing: r157 = H106  
 ADI R0 0; NO OP
LDB R3 H106; load what's in the address of H106 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -76 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; WRITE Performing: cout << 'W' ; 
 ADI R0 0 ; NO OP
LDB R3 H116; load what's in the address of H116 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'h' ; 
 ADI R0 0 ; NO OP
LDB R3 H117; load what's in the address of H117 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'a' ; 
 ADI R0 0 ; NO OP
LDB R3 H118; load what's in the address of H118 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 't' ; 
 ADI R0 0 ; NO OP
LDB R3 H119; load what's in the address of H119 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'i' ; 
 ADI R0 0 ; NO OP
LDB R3 H121; load what's in the address of H121 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 's' ; 
 ADI R0 0 ; NO OP
LDB R3 H122; load what's in the address of H122 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'y' ; 
 ADI R0 0 ; NO OP
LDB R3 H123; load what's in the address of H123 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'o' ; 
 ADI R0 0 ; NO OP
LDB R3 H124; load what's in the address of H124 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'u' ; 
 ADI R0 0 ; NO OP
LDB R3 H125; load what's in the address of H125 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'r' ; 
 ADI R0 0 ; NO OP
LDB R3 H126; load what's in the address of H126 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'n' ; 
 ADI R0 0 ; NO OP
LDB R3 H127; load what's in the address of H127 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'a' ; 
 ADI R0 0 ; NO OP
LDB R3 H118; load what's in the address of H118 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'm' ; 
 ADI R0 0 ; NO OP
LDB R3 H128; load what's in the address of H128 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '?' ; 
 ADI R0 0 ; NO OP
LDB R3 H130; load what's in the address of H130 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '\n' ; 
 ADI R0 0 ; NO OP
LDB R3 H131; load what's in the address of H131 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'E' ; 
 ADI R0 0 ; NO OP
LDB R3 H132; load what's in the address of H132 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'n' ; 
 ADI R0 0 ; NO OP
LDB R3 H127; load what's in the address of H127 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 't' ; 
 ADI R0 0 ; NO OP
LDB R3 H119; load what's in the address of H119 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'r' ; 
 ADI R0 0 ; NO OP
LDB R3 H126; load what's in the address of H126 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'n' ; 
 ADI R0 0 ; NO OP
LDB R3 H127; load what's in the address of H127 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'o' ; 
 ADI R0 0 ; NO OP
LDB R3 H124; load what's in the address of H124 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'm' ; 
 ADI R0 0 ; NO OP
LDB R3 H128; load what's in the address of H128 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'o' ; 
 ADI R0 0 ; NO OP
LDB R3 H124; load what's in the address of H124 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'r' ; 
 ADI R0 0 ; NO OP
LDB R3 H126; load what's in the address of H126 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 't' ; 
 ADI R0 0 ; NO OP
LDB R3 H119; load what's in the address of H119 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'h' ; 
 ADI R0 0 ; NO OP
LDB R3 H117; load what's in the address of H117 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'a' ; 
 ADI R0 0 ; NO OP
LDB R3 H118; load what's in the address of H118 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'n' ; 
 ADI R0 0 ; NO OP
LDB R3 H127; load what's in the address of H127 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '1' ; 
 ADI R0 0 ; NO OP
LDB R3 H133; load what's in the address of H133 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '0' ; 
 ADI R0 0 ; NO OP
LDB R3 H134; load what's in the address of H134 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'c' ; 
 ADI R0 0 ; NO OP
LDB R3 H135; load what's in the address of H135 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'h' ; 
 ADI R0 0 ; NO OP
LDB R3 H117; load what's in the address of H117 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'a' ; 
 ADI R0 0 ; NO OP
LDB R3 H118; load what's in the address of H118 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'r' ; 
 ADI R0 0 ; NO OP
LDB R3 H126; load what's in the address of H126 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'a' ; 
 ADI R0 0 ; NO OP
LDB R3 H118; load what's in the address of H118 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'c' ; 
 ADI R0 0 ; NO OP
LDB R3 H135; load what's in the address of H135 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 't' ; 
 ADI R0 0 ; NO OP
LDB R3 H119; load what's in the address of H119 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'r' ; 
 ADI R0 0 ; NO OP
LDB R3 H126; load what's in the address of H126 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 's' ; 
 ADI R0 0 ; NO OP
LDB R3 H122; load what's in the address of H122 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'a' ; 
 ADI R0 0 ; NO OP
LDB R3 H118; load what's in the address of H118 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'n' ; 
 ADI R0 0 ; NO OP
LDB R3 H127; load what's in the address of H127 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'd' ; 
 ADI R0 0 ; NO OP
LDB R3 H136; load what's in the address of H136 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 't' ; 
 ADI R0 0 ; NO OP
LDB R3 H119; load what's in the address of H119 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'y' ; 
 ADI R0 0 ; NO OP
LDB R3 H123; load what's in the address of H123 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'p' ; 
 ADI R0 0 ; NO OP
LDB R3 H137; load what's in the address of H137 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'a' ; 
 ADI R0 0 ; NO OP
LDB R3 H118; load what's in the address of H118 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '.' ; 
 ADI R0 0 ; NO OP
LDB R3 H106; load what's in the address of H106 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'w' ; 
 ADI R0 0 ; NO OP
LDB R3 H138; load what's in the address of H138 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'h' ; 
 ADI R0 0 ; NO OP
LDB R3 H117; load what's in the address of H117 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'n' ; 
 ADI R0 0 ; NO OP
LDB R3 H127; load what's in the address of H127 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'd' ; 
 ADI R0 0 ; NO OP
LDB R3 H136; load what's in the address of H136 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'o' ; 
 ADI R0 0 ; NO OP
LDB R3 H124; load what's in the address of H124 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'n' ; 
 ADI R0 0 ; NO OP
LDB R3 H127; load what's in the address of H127 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ':' ; 
 ADI R0 0 ; NO OP
LDB R3 H139; load what's in the address of H139 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << '\n' ; 
 ADI R0 0 ; NO OP
LDB R3 H131; load what's in the address of H131 into R3
TRP 3
; WRITE END------------------------- 

; READ Performing: cin >> c ;
 ADI R0 0; NO OP
TRP 4
MOV R2 FP; move copy of FP into R2 
ADI R2 -20 
STB R3 R2 ; store what's in R3 into the address of R2
; READ END ------------------------- 

; Performing: while ( ( cnt < nameSize ) and c != '.' ) {
BEGIN158 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
LDR R2 R2; load what's in the address of R2 into R2
MOV R3 FP; move copy of FP into R3 
ADI R3 -28 
LDR R3 R3; load what's in the address of R3 into R3
MOV R4 R2
CMP R4 R3
BLT R4 LT173 ; if L103 < L105 GOTO LT173
MOV R4 R0
JMP LT174
LT173 MOV R4 R1
LT174 ADI R0 0 ;NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -80 
STR R4 R3 ; store what's in R4 into the address of R3
;LT END -------------------------

; Performing: 
 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -20 
LDB R2 R2; load what's in the address of R2 into R2
LDB R3 H106; load what's in the address of H106 into R3
MOV R4 R2
CMP R4 R3
BNZ R4 NE175 ; if L102 != H106 GOTO NE175
MOV R4 R0
JMP NE176
NE175 MOV R4 R1
NE176 ADI R0 0 ;NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -84 
STR R4 R3 ; store what's in R4 into the address of R3
;NE END -------------------------

; Performing AND
 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -80 
LDR R2 R2; load what's in the address of R2 into R2
MOV R3 FP; move copy of FP into R3 
ADI R3 -84 
LDR R3 R3; load what's in the address of R3 into R3
MOV R4 R2 ; test if operand 1 is false
CMP R4 R0
BRZ R4 AND177; if A == false GOTO AND177 
BNZ R4 AND178; if A != false GOTO AND178 
AND177 MOV R4 R0
JMP AND179 
AND178 MOV R4 R3 ; test if operand 2 is false
CMP R4 R0
BRZ R4 AND180; if A == false GOTO AND180 
BNZ R4 AND181; if A != false GOTO AND181 
AND180 MOV R4 R0
JMP AND179 
AND181 MOV R4 R1
AND179 ADI R0 0; NOOP
MOV R3 FP; move copy of FP into R3 
ADI R3 -88 
STR R4 R3 ; store what's in R4 into the address of R3
; AND END -------------------------

; BranchFalse t161 ENDWHILE162
 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R3 FP; move copy of FP into R3 
ADI R3 -88 
LDR R3 R3; load what's in the address of R3 into R3
BRZ R3 ENDWHILE162; if R3 == 0 then branch to label

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
LDR R2 R2; load what's in the address of R2 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -92 
STR R4 R1 ; store the offset that's in R4 into the address of r163
; AEF END -------------------------

; MOV Performing: r163 = L102  
 ADI R0 0; NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -20 
LDB R3 R3; load what's in the address of R3 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -92 
LDR R2 R2
STB R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; READ Performing: cin >> c ;
 ADI R0 0; NO OP
TRP 4
MOV R2 FP; move copy of FP into R2 
ADI R2 -20 
STB R3 R2 ; store what's in R3 into the address of R2
; READ END ------------------------- 

; ADD Performing: t164 = L103 + N107 
 ADI R0 0 ; NO OP
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
LDR R2 R2; load what's in the address of R2 into R2
LDR R3 N107; load what's in the address of N107 into R3
ADD R2 R3
MOV R3 FP; move copy of FP into R3 
ADI R3 -96 
STR R2 R3 ; store what's in R2 into the address of R3

; ADD END-------------------------

; MOV Performing: cnt = cnt + 1 ; 
 ADI R0 0; NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -96 
LDR R3 R3; load what's in the address of R3 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
STR R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; JMP
 JMP BEGIN158 
; JMP END ------------------------- 

; MOV Performing: cnt = 0 ; 
ENDWHILE162 ADI R0 0; NO OP
LDR R3 N104; load what's in the address of N104 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
STR R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; WRITE Performing: cout << 'H' ; 
 ADI R0 0 ; NO OP
LDB R3 H140; load what's in the address of H140 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'e' ; 
 ADI R0 0 ; NO OP
LDB R3 H129; load what's in the address of H129 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'l' ; 
 ADI R0 0 ; NO OP
LDB R3 H141; load what's in the address of H141 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'l' ; 
 ADI R0 0 ; NO OP
LDB R3 H141; load what's in the address of H141 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << 'o' ; 
 ADI R0 0 ; NO OP
LDB R3 H124; load what's in the address of H124 into R3
TRP 3
; WRITE END------------------------- 

; WRITE Performing: cout << ' ' ; 
 ADI R0 0 ; NO OP
LDB R3 H120; load what's in the address of H120 into R3
TRP 3
; WRITE END------------------------- 

; Performing: while ( cnt < nameSize and name [ cnt ] != '.' ) {
BEGIN165 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
LDR R2 R2; load what's in the address of R2 into R2
MOV R3 FP; move copy of FP into R3 
ADI R3 -28 
LDR R3 R3; load what's in the address of R3 into R3
MOV R4 R2
CMP R4 R3
BLT R4 LT182 ; if L103 < L105 GOTO LT182
MOV R4 R0
JMP LT183
LT182 MOV R4 R1
LT183 ADI R0 0 ;NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -100 
STR R4 R3 ; store what's in R4 into the address of R3
;LT END -------------------------

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
LDR R2 R2; load what's in the address of R2 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -104 
STR R4 R1 ; store the offset that's in R4 into the address of r167
; AEF END -------------------------

; Performing: 
 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -104 
LDR R2 R2
LDB R2 R2; load what's in the address of R2 into R2
LDB R3 H106; load what's in the address of H106 into R3
MOV R4 R2
CMP R4 R3
BNZ R4 NE184 ; if r167 != H106 GOTO NE184
MOV R4 R0
JMP NE185
NE184 MOV R4 R1
NE185 ADI R0 0 ;NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -108 
STR R4 R3 ; store what's in R4 into the address of R3
;NE END -------------------------

; Performing AND
 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -100 
LDR R2 R2; load what's in the address of R2 into R2
MOV R3 FP; move copy of FP into R3 
ADI R3 -108 
LDR R3 R3; load what's in the address of R3 into R3
MOV R4 R2 ; test if operand 1 is false
CMP R4 R0
BRZ R4 AND186; if A == false GOTO AND186 
BNZ R4 AND187; if A != false GOTO AND187 
AND186 MOV R4 R0
JMP AND188 
AND187 MOV R4 R3 ; test if operand 2 is false
CMP R4 R0
BRZ R4 AND189; if A == false GOTO AND189 
BNZ R4 AND190; if A != false GOTO AND190 
AND189 MOV R4 R0
JMP AND188 
AND190 MOV R4 R1
AND188 ADI R0 0; NOOP
MOV R3 FP; move copy of FP into R3 
ADI R3 -112 
STR R4 R3 ; store what's in R4 into the address of R3
; AND END -------------------------

; BranchFalse t169 ENDWHILE170
 LDR R0 false; loading false which is 0 into R0
LDR R1 true ; loading true which is 1 into R1
MOV R3 FP; move copy of FP into R3 
ADI R3 -112 
LDR R3 R3; load what's in the address of R3 into R3
BRZ R3 ENDWHILE170; if R3 == 0 then branch to label

; Performing AEF
 ADI R0 0
MOV R1 FP; move copy of FP into R1 
ADI R1 -16 
LDR R1 R1; load what's in the address of R1 into R1
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
LDR R2 R2; load what's in the address of R2 into R2
LDR R0 false
ADI R0 1 ; loading size of array type which is 1
MUL R2 R0 ; Multiply offset by size of array type
MOV R4 R2
ADD R4 R1 ; add base address to R4 to get heap location
MOV R1 FP; move copy of FP into R1 
ADI R1 -116 
STR R4 R1 ; store the offset that's in R4 into the address of r171
; AEF END -------------------------

; WRITE Performing:  
 ADI R0 0 ; NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -116 
LDR R3 R3
LDB R3 R3; load what's in the address of R3 into R3
TRP 3
; WRITE END------------------------- 

; ADD Performing: t172 = L103 + N107 
 ADI R0 0 ; NO OP
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
LDR R2 R2; load what's in the address of R2 into R2
LDR R3 N107; load what's in the address of N107 into R3
ADD R2 R3
MOV R3 FP; move copy of FP into R3 
ADI R3 -120 
STR R2 R3 ; store what's in R2 into the address of R3

; ADD END-------------------------

; MOV Performing: cnt = cnt + 1 ; 
 ADI R0 0; NO OP
MOV R3 FP; move copy of FP into R3 
ADI R3 -120 
LDR R3 R3; load what's in the address of R3 into R3
MOV R2 FP; move copy of FP into R2 
ADI R2 -24 
STR R3 R2 ; store what's in R3 into the address of R2
; MOV END ------------------------- 

; JMP
 JMP BEGIN165 
; JMP END ------------------------- 

; WRITE Performing: cout << '\n' ; 
ENDWHILE170 ADI R0 0 ; NO OP
LDB R3 H131; load what's in the address of H131 into R3
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
N101 .INT 10
N104 .INT 0
H106 .BYT 46
N107 .INT 1
N108 .INT 2
N109 .INT 3
N110 .INT 4
N111 .INT 5
N112 .INT 6
N113 .INT 7
N114 .INT 8
N115 .INT 9
H116 .BYT 87
H117 .BYT 104
H118 .BYT 97
H119 .BYT 116
H120 .BYT 32
H121 .BYT 105
H122 .BYT 115
H123 .BYT 121
H124 .BYT 111
H125 .BYT 117
H126 .BYT 114
H127 .BYT 110
H128 .BYT 109
H129 .BYT 101
H130 .BYT 63
H131 .BYT 10
H132 .BYT 69
H133 .BYT 49
H134 .BYT 48
H135 .BYT 99
H136 .BYT 100
H137 .BYT 112
H138 .BYT 119
H139 .BYT 58
H140 .BYT 72
H141 .BYT 108
