;NAME-ARPAN SAHU
;REGD.NO.-2341019235
;MULTIPLICATION OF 2 16-BIT NUMBERS WITHOUT USING MUL INSTRUCTION

    MOV BX,[1000H]       ; Load the first 16-bit number from memory address 1000H into BX register
    MOV CX,[1002H]       ; Load the second 16-bit number from memory address 1002H into CX register
    MOV DX,0000H         ; Initialize DX register to 0 (upper 16 bits of the result)
    MOV AX,0000H         ; Initialize AX register to 0 (lower 16 bits of the result)

L2: ADD AX,BX           ; Add the value in BX (the first number) to AX (the result)
    JNC L1               ; Jump to L1 if no carry (if the addition did not result in overflow)
    INC DX               ; If there was a carry, increment DX (this will handle the overflow part of the multiplication)

L1: DEC CX               ; Decrement the count in CX (this represents how many times we need to add BX)
    JNZ L2               ; If CX is not zero, repeat the process (loop until CX becomes 0)
    MOV [1004H],AX       ; Store the lower 16 bits of the result (AX) to memory address 1004H
    MOV [1006H],DX       ; Store the upper 16 bits of the result (DX) to memory address 1006H
    HLT                  ; Halt the program (end of execution)
