# Calculator for 32-bit ARM platform
## About
#### Supported data types
*signed/unsigned integers*
#### Supported operations
*addition, subtruction, multiplication*
#### Expressions format
*operand1 command operand2*
## Build
#### Prerequirements
- ARM platform *(32-bit)*
- GNU/Linux
- GCC Compiler
#### From root directory
	make/make all - build calculator with bin/build directories
	make dir - creare bin/build direcroties
	make rdir - remove bin/build directories
	make clean - clean bin/build directories
## Usage
#### From root directory
	./bin/calc
	Enter expression: 2 + 3
	Your expression: 2 + 3

	Result: 2 + 3 = 5
