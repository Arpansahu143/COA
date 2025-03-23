;NAME-ARPAN SAHU
;REGD.NO.-2341019235
;FIND THE SUM AND AVERAGE OF N 16-BIT NUMBER

    MOV SI,2000H    ; Load the memory address 2000H into register SI
    MOV CL,[SI]     ; Load the number of 16-bit values (N) from memory into CL
    MOV CH,00H      ; Clear CH to make CX hold the count of numbers
    MOV BX,CX       ; Copy the count (N) to BX for later use in division
    MOV AX,0000H    ; Initialize AX to 0, which will hold the sum

L2: INC SI          ; Move to the next memory location (first byte of the next 16-bit number)
    INC SI          ; Move to the second byte of the next 16-bit number

    ADD AX,[SI]     ; Add the 16-bit number at memory location SI to AX
    JNC L1          ; If there is no carry, jump to L1 (continue summing)
    INC CH          ; If there was a carry, increment CH (to handle overflow)

L1: DEC CL          ; Decrement CL (loop counter)
    JNZ L2          ; If CL is not zero, repeat the loop (process next number)

    INC SI          ; Move to the next memory location (storing the sum's carry)
    INC SI          ; Move to the next memory location

    MOV [SI],CH     ; Store the carry value at the next memory location

    DIV BX          ; Divide AX (sum) by BX (count) to compute the average

    INC SI          ; Move to the next memory location (storing the average quotient)
    INC SI          ; Move to the next memory location
    MOV [SI],AX     ; Store the quotient (average) in memory

    INC SI          ; Move to the next memory location (storing the remainder)
    INC SI          ; Move to the next memory location
    MOV [SI],DX     ; Store the remainder of the division in memory
    HLT             ; Halt execution