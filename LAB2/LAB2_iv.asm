;NAME-ARPAN SAHU
;REGD.NO.-2341019235
;MOV A BLOCK OF 16-BIT DATA FORM ONE LOCATION TOANOTHER

    MOV AX,2000H   ; Load the segment address 2000H into AX
    MOV DS,AX      ; Set DS (Data Segment) to 2000H to access memory
    MOV SI,3000H   ; Set SI (Source Index) to point to the source block at 3000H
    MOV DI,5000H   ; Set DI (Destination Index) to point to the destination block at 5000H
    MOV CL,05H     ; Set CL to 5, indicating that 5 words (16-bit data) need to be moved

L1: MOV BX,[SI]    ; Load the 16-bit value from the source memory location (SI) into BX
    MOV [DI],BX    ; Store the 16-bit value from BX into the destination memory location (DI)
    
    INC SI         ; Move SI to the next byte
    INC SI         ; Move SI again to complete the jump to the next 16-bit value
    
    INC DI         ; Move DI to the next byte
    INC DI         ; Move DI again to complete the jump to the next 16-bit value
    
    DEC CL         ; Decrease CL (loop counter) by 1
    JNZ L1         ; If CL is not zero, repeat the loop (process next 16-bit value)
    
    HLT            ; Halt execution
   