.text
add:
	ADD R0, R0, R1

	BX LR

sub:
	SUB R0, R0, R1

	BX LR

mul:
	MUL R4, R0, R1
	MOV R0, R4

	BX LR
