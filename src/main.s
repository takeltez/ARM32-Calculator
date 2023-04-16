.include "calc.s"
.include "i_o.s"

.global main

.text
main:
	BL input

	LDR R0, =op1
	LDR R1, =op2
	LDR R2, =command
	LDR R3, =result
	LDR R0, [R0]
	LDR R1, [R1]
	LDRB R2, [R2]

_com_case1:
	CMP R2, #'+'
	BNE _com_case2
	BL add
	B _matched

_com_case2:
	CMP R2, #'-'
	BNE _com_case3
	BL sub
	B _matched

_com_case3:
	CMP R2, #'*'
	BNE _not_matched
	BL mul
	B _matched

_not_matched:
	LDR R0, =err_msg
	STR R0, [SP]

	BL output

	B _prog_exit

_matched:
	STR R0, [R3]

	LDR R0, =res_msg
	STR R0, [SP]

	BL output

_prog_exit:
	MOV R7, #1
	SWI 0
