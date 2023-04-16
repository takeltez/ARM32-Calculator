.text
input:
	PUSH {LR}

	LDR R0, =start_msg

	BL printf

	LDR R0, =scanf_input
	LDR R1, =op1
	LDR R2, =command
	LDR R3, =op2

	BL scanf

	LDR R0, =expr_msg
	LDR R1, =op1
	LDR R2, =command
	LDR R3, =op2

	LDR R1, [R1]
	LDR R2, [R2]
	LDR R3, [R3]

	BL printf

	POP {LR}

	BX LR

output:
	PUSH {LR}

	LDR R0, [SP, #4]

	LDR R1, =res_msg
	LDR R2, =err_msg

_print_case1:
	CMP R0, R1
	BNE _print_case2
	B _print_res

_print_case2:
	CMP R0, R2
	BNE _print_exit
	B _print_err

_print_err:
	BL printf
	B _print_exit

_print_res:
	SUB SP, SP, #4

	LDR R0, [R3]
	STR R0, [SP]

	LDR R0, =res_msg
	LDR R1, =op1
	LDR R2, =command
	LDR R3, =op2

	LDR R1, [R1]
	LDR R2, [R2]
	LDR R3, [R3]

	BL printf

	ADD SP, SP, #4

_print_exit:
	POP {LR}

	BX LR

.data
op1:
	.word 0
op2:
	.word 0
result:
	.word 0
command:
	.byte ''
scanf_input:
	.asciz "%d %c %d"
start_msg:
	.asciz "Enter expression: "
expr_msg:
	.asciz "Your expression: %d %c %d\n"
res_msg:
	.asciz "\nResult: %d %c %d = %d\n"
err_msg:
	.asciz "\nUnknown operation\n"
