;NAME-ARPAN SAHU
;REGD.NO.-2341019235
;COUNT NO. OF 0'S IN AN 8-BIT NUMBER

    MOV BX,2000H   ; Load the memory address 2000H into register BX
    MOV AL,[BX]    ; Load the 8-bit number stored at memory location 2000H into AL
    MOV CL,08H     ; Initialize CL with 8 (since we are working with an 8-bit number)
    MOV CH,00H     ; Initialize CH to 0, which will be used to count the number of 0's

L2: SHR AL,1H      ; Shift the bits of AL to the right by 1 position (LSB moves into Carry Flag)
    JC L1          ; If the Carry Flag is set (meaning LSB was 1), jump to L1
    INC CH         ; If the Carry Flag was not set (LSB was 0), increment CH (zero count)

L1: DEC CL         ; Decrease CL (loop counter)
    JNZ L2         ; If CL is not zero, repeat the loop
    INC BX         ; Move to the next memory location
    MOV [BX],CH    ; Store the final count of 0's at the next memory location
    HLT            ; Halt execution
    