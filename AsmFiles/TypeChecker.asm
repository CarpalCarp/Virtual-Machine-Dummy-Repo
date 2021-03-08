; main args: (
MOV R1 FP;hello
MOV FP SP
ADI SP -8 ; 0 args -(0+2)*4
MOV R7 SP
MOV R0 SP
CMP R0 SL
BLT R0 OVERFLOW_ERR
;   <pfp>,
ADI R7 4
STR R1 R7
;   <return addr>,
ADI R7 4
LDB R3 ERR_CHAR
MOV R0 PC
ADI R0 36
STR R0 R7
; )
JMP MAIN

TRP 0

; Convert char j to an integer if possible.
; If the flag is not set use the sign indicator s
; and the tenths indicator to compute the actual
; value of j. Add the value to the accumulator opdv.
; void opd(char s INT k char j)
OPD ADI R0 0
    ; r0 = s r1 = k r2 = j
    MOV R6 SP
    ADI R6 4
    LDR R0 R6 ; s
    ADI R6 4
    LDR R1 R6 ; k
    ADI R6 4
    LDR R2 R6 ; j

    ; INT t = 0;
    LDR R3 ZERO

    LDB R4 CHAR_0
    CMP R4 R2
    BNZ R4 OPD__ELSE_IF1_1
        ADI R3 0
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_1 ADI r0 0
    LDB R4 CHAR_1
    CMP R4 r2
    BNZ R4 OPD__ELSE_IF1_2
        ADI r3 1
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_2 ADI r0 0
    LDB r4 CHAR_2
    CMP r4 r2
    BNZ r4 OPD__ELSE_IF1_3
        ADI r3 2
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_3 ADI r0 0
    LDB r4 CHAR_3
    CMP r4 r2
    BNZ r4 OPD__ELSE_IF1_4
        ADI r3 3
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_4 ADI r0 0
    LDB r4 CHAR_4
    CMP r4 r2
    BNZ r4 OPD__ELSE_IF1_5
        ADI r3 4
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_5 ADI r0 0
    LDB r4 CHAR_5
    CMP r4 r2
    BNZ r4 OPD__ELSE_IF1_6
        ADI r3 5
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_6 ADI r0 0
    LDB r4 CHAR_6
    CMP r4 r2
    BNZ r4 OPD__ELSE_IF1_7
        ADI r3 6
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_7 ADI r0 0
    LDB r4 CHAR_7
    CMP r4 r2
    BNZ r4 OPD__ELSE_IF1_8
        ADI r3 7
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_8 ADI r0 0
    LDB r4 CHAR_8
    CMP r4 r2
    BNZ r4 OPD__ELSE_IF1_9
        ADI r3 8
        JMP OPD__ENDIF1
    OPD__ELSE_IF1_9 ADI r0 0
    LDB r4 CHAR_9
    CMP r4 r2
    BNZ r4 OPD__ELSE1
        ADI r3 9
        JMP OPD__ENDIF1
    OPD__ELSE1 ADI r0 0
        ; printf("%c is not a number\n", j);
        MOV r3 r2
        TRP 3
        LDA r0 STR_NOT_A_NUM
        MOV r7 PC
        JMP PRINT_STR

        ; flag = 1;
        LDR r3 ONE
        STR r1 FLAG
    OPD__ENDIF1 ADI r0 0

    ; if (!flag)
    LDR r4 FLAG
    BGT r4 OPD__ENDIF2
    
        ; if (s == '+')
        LDB r4 CHAR_PLUS
        CMP r4 r0
        BNZ r4 OPD__ELSE_IF3
            ; t *= k;
            MUL r3 r1

            JMP OPD__ENDIF3
        OPD__ELSE_IF3 ADI r0 0
            ; t *= -k;
            MUL r3 r1
            LDR r4 NEG_ONE
            MUL r3 r4

        OPD__ENDIF3 ADI r0 0

        ; opdv += t;
        LDR r4 OPDV
        ADD r4 r3
        STR r4 OPDV

    OPD__ENDIF2 ADI r0 0

    ; Return
    MOV r7 PC
    JMP PREP_RETURN
    LDR r7 SP
    JMR r7

; Discard keyboard input until a newline ‘\n’ is
; Encountered.
; void flush()
FLUSH ADI r0 0
    ; data = 0;
    LDR r0 ZERO
    STR r0 DATA
    
    ; r4 = *c r5 = '\n'
    LDA r4 C
    LDB r5 NEW_LINE

    ; c[0] = getchar();
    TRP 4
    STR r3 r4

    ; while (c[0] != '\n')
    FLUSH__LOOP ADI r0 0
    CMP r3 r5
    BRZ r3 FLUSH__END_LOOP

        ; c[0] = getchar();
        TRP 4
        STR r3 r4

        JMP FLUSH__LOOP
    FLUSH__END_LOOP ADI r0 0

    ; Return
    MOV r7 PC
    JMP PREP_RETURN
    LDR r7 SP
    JMR r7


; Read one char at a time from the keyboard after a
; newline ‘\n’ has been entered. If there is room
; place the char in the array c
; otherwise indicate the number is too big and
; flush the keyboard input.
GET_DATA ADI r0 0
    LDR r1 CNT
    LDR r2 SIZE
    CMP r1 r2
    BLT r1 GET_DATA__IF
    JMP GET_DATA__ELSE
    GET_DATA__IF ADI r0 0
    ; if (cnt < SIZE) { // Get data if there is room
        ; c[cnt] = getchar();
        LDA r5 C
        LDR r1 CNT
        ADD r5 r1
        TRP 4
        STR r3 r5

        ; cnt++;
        ADI r1 1
        STR r1 CNT

        JMP GET_DATA__ENDIF
    GET_DATA__ELSE ADI r0 0
        ; printf("Number too Big\n");
        LDA r0 STR_NUM_TOO_BIG
        MOV r7 PC
        JMP PRINT_STR

        ; flush args: (
        MOV r1 FP
        MOV FP SP
        ADI SP -8 ; 0 args -(0+2)*4
        MOV r7 SP
        MOV r0 SP
        CMP r0 SL
        BLT r0 OVERFLOW_ERR
        ;   <pfp>,
        ADI r7 4
        STR r1 r7
        ;   <return addr>,
        ADI r7 4
        MOV r0 PC
        ADI r0 36
        STR r0 r7
        ; )
        JMP FLUSH

    GET_DATA__ENDIF ADI r0 0

    ; Return
    MOV r7 PC
    JMP PREP_RETURN
    LDR r7 SP
    JMR r7


; Reset c to all 0’s
; Assign values to data opdv cnt and flag.
; void reset(INT w INT x INT y INT z)
RESET ADI r0 0
    ; r0 = w r1 = x r2 = y r3 = z
    MOV R6 SP
    ADI R6 4
    LDR R0 r6 ; w
    ADI R6 4
    LDR R1 r6 ; x
    ADI R6 4
    LDR R2 r6 ; y
    ADI R6 4
    LDR R3 r6 ; z

    STR R0 DATA
    STR R1 OPDV
    STR R2 CNT
    STR R3 FLAG

    LDR r3 ZERO ; constant
    LDR r4 SIZE
    LDR r5 ZERO ; index in array (k)
    LDA r6 C
    ; for (k= 0; k < SIZE;)
    RESET__LOOP ADI r0 0
    MOV r0 r4
    CMP r0 r5
    BLT r0 RESET__END_LOOP

        ; c[k] = 0;
        MOV r0 r6
        ADD r0 r5
        STR r3 r0

        ADI r5 1 ; k++
        JMP RESET__LOOP
    RESET__END_LOOP ADI r0 0
    ; Return
    MOV r7 PC
    JMP PREP_RETURN
    LDR r7 SP
    JMR r7


MAIN ADI r0 0
    ; reset args: (
    MOV r1 FP
    MOV FP SP
    ADI SP -24 ; 4 args -(4+2)*4
    MOV r7 SP
    MOV r0 SP
    CMP r0 SL
    BLT r0 OVERFLOW_ERR
    ;   1
    ADI r7 4
    LDR R0 ONE
    STR r0 r7
    ;   0
    ADI r7 4
    LDR r0 ZERO
    STR r0 r7
    ;   0
    ADI r7 4
    LDR r0 ZERO
    STR r0 r7
    ;   0
    ADI r7 4
    LDR r0 ZERO
    STR r0 r7
    ;   <pfp>,
    ADI r7 4
    STR r1 r7
    ;   <return addr>,
    ADI r7 4
    MOV r0 PC
    ADI r0 36
    STR r0 r7
    ; )
    JMP RESET
    ; get_data args: (
    MOV r1 FP
    MOV FP SP
    ADI SP -8 ; 0 args -(0+2)*4
    MOV r7 SP
    MOV r0 SP
    CMP r0 SL
    BLT r0 OVERFLOW_ERR
    ;   <pfp>,
    ADI r7 4
    STR r1 r7
    ;   <return addr>,
    ADI r7 4
    MOV r0 PC
    ADI r0 36
    STR r0 r7
    ; )
    JMP GET_DATA
    ; while (c[0] != '@') { // Check for stop symbol '@'
    MAIN__LOOP ADI r0 0
    LDB r0 C
    LDB r1 CHAR_AT
    CMP r1 r0
    BRZ r1 MAIN__END_LOOP

        ; if (c[0] == '+' || c[0] == '-') { // Determine sign
        LDB r1 CHAR_PLUS
        CMP r1 r0
        BRZ r1 MAIN__IF
        LDB r1 CHAR_MINUS
        CMP r1 r0
        BRZ r1 MAIN__IF
        JMP MAIN__ELSE
        MAIN__IF ADI r0 0

            ; get_data args: (
            MOV r1 FP
            MOV FP SP
            ADI SP -8 ; 0 args -(0+2)*4
            MOV r7 SP
            MOV r0 SP
            CMP r0 SL
            BLT r0 OVERFLOW_ERR
            ;   <pfp>,
            ADI r7 4
            STR r1 r7
            ;   <return addr>,
            ADI r7 4
            MOV r0 PC
            ADI r0 36
            STR r0 r7
            ; )
            JMP GET_DATA
            JMP MAIN__ENDIF

        MAIN__ELSE ADI r0 0 ; Default sign is '+'
            ; c[1] = c[0]; // Make room for the sign
            LDB r0 C
            LDA r1 C
            ADI r1 1
            STB r0 r1
            ; c[0] = '+';
            LDB r0 CHAR_PLUS
            STB r0 C
            ; cnt++;
            LDR r0 CNT
            ADI r0 1
            STR r0 CNT

        MAIN__ENDIF ADI r0 0

        ; while(data) { // Loop while there is data to process
        MAIN__LOOP2 ADI r0 0
        LDR r0 DATA
        BRZ r0 MAIN__END_LOOP2
            ; if (c[cnt-1] == '\n') { // Process data now
            LDA r0 C
            LDR r1 CNT
            ADD r0 r1
            ADI r0 -1
            LDB r0 r0
            LDB r1 NEW_LINE
            CMP r0 r1
            BNZ r0 MAIN__ELSE2

                ; data = 0;
                LDR r0 ZERO
                STR r0 DATA
                ; tenth = 1;
                LDR r0 ONE
                STR r0 TENTH
                ; cnt = cnt - 2;
                LDR r0 CNT
                ADI r0 -2
                STR r0 CNT

                ; while (!flag && cnt != 0) { // Compute a number
                MAIN__LOOP3 ADI r0 0
                LDR r0 FLAG
                BNZ r0 MAIN__END_LOOP3
                LDR r0 CNT
                BRZ r0 MAIN__END_LOOP3

                    ; r2 = c[cnt]
                    LDA r2 C
                    LDR r3 CNT
                    ADD r2 r3
                    LDB r2 r2

                    ; opd args: (
                    MOV r1 FP
                    MOV FP SP
                    ADI SP -20 ; 3 args -(3+2)*4
                    MOV r7 SP
                    MOV r0 SP
                    CMP r0 SL
                    BLT r0 OVERFLOW_ERR
                    ;   c[0],
                    ADI r7 4
                    LDB r0 C
                    STR r0 r7
                    ;   tenth
                    ADI r7 4
                    LDR r0 TENTH
                    STR r0 r7
                    ;   r2
                    ADI r7 4
                    STR r2 r7
                    ;   <pfp>,
                    ADI r7 4
                    STR r1 r7
                    ;   <return addr>,
                    ADI r7 4
                    MOV r0 PC
                    ADI r0 36
                    STR r0 r7
                    ; )
                    JMP OPD

                    ; cnt--;
                    LDR r0 CNT
                    ADI r0 -1
                    STR r0 CNT
                    ; tenth *= 10;
                    LDR r0 TENTH
                    LDR r1 TEN
                    MUL r0 r1
                    STR r0 TENTH

                    JMP MAIN__LOOP3
                MAIN__END_LOOP3 ADI r0 0

                ; if (!flag) // Good number entered
                LDB r0 FLAG
                BNZ r0 MAIN__ENDIF3

                    ; printf("Operand is %d\n", opdv);
                    LDA r0 STR_OPERAND_IS
                    MOV r7 PC
                    JMP PRINT_STR

                    LDR r3 OPDV
                    TRP 1
                    LDB r3 NEW_LINE
                    TRP 3

                MAIN__ENDIF3 ADI r0 0

                JMP MAIN__ENDIF2

            MAIN__ELSE2 ADI r0 0

                ; get_data args: (
                MOV r1 FP
                MOV FP SP
                ADI SP -8 ; 0 args -(0+2)*4
                MOV r7 SP
                MOV r0 SP
                CMP r0 SL
                BLT r0 OVERFLOW_ERR
                ;   <pfp>,
                ADI r7 4
                STR r1 r7
                ;   <return addr>,
                ADI r7 4
                MOV r0 PC
                ADI r0 36
                STR r0 r7
                ; )
                JMP GET_DATA

            MAIN__ENDIF2 ADI r0 0

            JMP MAIN__LOOP2
        MAIN__END_LOOP2 ADI r0 0

        ; reset args: (
        MOV r1 FP
        MOV FP SP
        ADI SP -24 ; 4 args -(4+2)*4
        MOV r7 SP
        MOV r0 SP
        CMP r0 SL
        BLT r0 OVERFLOW_ERR
        ;   1
        ADI r7 4
        LDR r0 ONE
        STR r0 r7
        ;   0
        ADI r7 4
        LDR r0 ZERO
        STR r0 r7
        ;   0
        ADI r7 4
        LDR r0 ZERO
        STR r0 r7
        ;   0
        ADI r7 4
        LDR r0 ZERO
        STR r0 r7
        ;   <pfp>,
        ADI r7 4
        STR r1 r7
        ;   <return addr>,
        ADI r7 4
        MOV r0 PC
        ADI r0 36
        STR r0 r7
        ; )
        JMP RESET

        ; get_data args: (
        MOV r1 FP
        MOV FP SP
        ADI SP -8 ; 0 args -(0+2)*4
        MOV r7 SP
        MOV r0 SP
        CMP r0 SL
        BLT r0 OVERFLOW_ERR
        ;   <pfp>,
        ADI r7 4
        STR r1 r7
        ;   <return addr>,
        ADI r7 4
        MOV r0 PC
        ADI r0 36
        STR r0 r7
        ; )
        JMP GET_DATA

        JMP MAIN__LOOP
    MAIN__END_LOOP ADI r0 0

    ; Return
    MOV r7 PC
    JMP PREP_RETURN
    LDR r7 SP
    JMR r7

; Prints a string in r0. Returns to r7+4
; (modified r0)
PRINT_STR ADI r0 0
    STR r1 PRINT_STR__r3

    PRINT_STR__LOOP ADI r0 0
        LDB r3 r0
        BRZ r3 PRINT_STR__END_LOOP
        TRP 3
        ADI r0 1
        JMP PRINT_STR__LOOP
    PRINT_STR__END_LOOP ADI r0 0

    ADI r7 12
    LDR r1 PRINT_STR__r3
    JMR r7

; Modifies stack registers in preparation for returning from a function
; To return a value modify the place where SP points to after calling this subroutine
PREP_RETURN ADI r0 0
    STR r0 PREP_RETURN__R0

    MOV r0 FP
    CMP r0 SB
    BGT r0 UNDERFLOW_ERR

    MOV r0 FP
    ADI r0 -4
    LDR r0 r0
    MOV SP FP
    MOV FP r0

    LDR r0 PREP_RETURN__R0
	ADI r7 12
    JMR r7

OVERFLOW_ERR ADI r0 0
    LDR r0 ZERO
    ADI r0 101
    JMP DISP_ERR

UNDERFLOW_ERR ADI r0 0
    LDR r0 ZERO
    ADI r0 102
    JMP DISP_ERR

DISP_ERR ADI r0 0
    LDB r3 ERR_CHAR
    TRP 3
    MOV r3 r0
    TRP 1
    LDR r3 NEW_LINE
    TRP 3
    TRP 0

SIZE .INT 7

C .BYT 0
.BYT 0
.BYT 0
.BYT 0
.BYT 0
.BYT 0
.BYT 0

CNT .INT 0
TENTH .INT 0
DATA .INT 0
FLAG .INT 0
OPDV .INT 0

ZERO .INT 0
ONE .INT 1
NEG_ONE .INT -1
TEN .INT 10

ERR_CHAR .BYT 69 ;'E'
CHAR_AT .BYT 64 ;'@'
CHAR_PLUS .BYT 43 ;'+'
CHAR_MINUS .BYT 45 ;'-'
NEW_LINE .BYT 10; '\n'

CHAR_0 .BYT 48 ;'0'
CHAR_1 .BYT 49 ;'1'
CHAR_2 .BYT 50 ;'2'
CHAR_3 .BYT 51 ;'3'
CHAR_4 .BYT 52 ;'4'
CHAR_5 .BYT 53 ;'5'
CHAR_6 .BYT 54 ;'6'
CHAR_7 .BYT 55 ;'7'
CHAR_8 .BYT 56 ;'8'
CHAR_9 .BYT 57 ;'9'

PRINT_STR__r3 .INT 0
PREP_RETURN__R0 .INT 0

STR_NUM_TOO_BIG .BYT 78 ;'N'
.BYT 117 ;'u'
.BYT 109 ;'m'
.BYT 98 ;'b'
.BYT 101 ;'e'
.BYT 114 ;'r'
.BYT 32 ;' '
.BYT 116 ;'t'
.BYT 111 ;'o'
.BYT 111 ;'o'
.BYT 32 ;' '
.BYT 66 ;'B'
.BYT 105 ;'i'
.BYT 103 ;'g'
.BYT 10 ;'\n'
.BYT 0 ;'\0'

STR_NOT_A_NUM .BYT 32 ;' '
.BYT 105 ;'i'
.BYT 115 ;'s'
.BYT 32 ;' '
.BYT 110 ;'n'
.BYT 111 ;'o'
.BYT 116 ;'t'
.BYT 32 ;' '
.BYT 97 ;'a'
.BYT 32 ;' '
.BYT 110 ;'n'
.BYT 117 ;'u'
.BYT 109 ;'m'
.BYT 98 ;'b'
.BYT 101 ;'e'
.BYT 114 ;'r'
.BYT 10 ;'\n'
.BYT 0 ;'\0'

STR_OPERAND_IS .BYT 79 ;'O'
.BYT 112 ;'p'
.BYT 101 ;'e'
.BYT 114 ;'r'
.BYT 97 ;'a'
.BYT 110 ;'n'
.BYT 100 ;'d'
.BYT 32 ;' '
.BYT 105 ;'i'
.BYT 115 ;'s'
.BYT 32 ;' '
.BYT 0 ;'\0'