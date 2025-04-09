;NAME-ARPAN SAHU
;REGD.NO.-2341019235
;FIND THE LARGEST/SMALLEST NO.(8-BIT) FORM GIVEN ARRAY OF SIZE N

.DATA
COUNT DB 04H                 ; Total number of elements in the array
VALUE DB 09H,10H,05H,03H     ; The array of values to find the maximum from
RES DB ?                     ; Variable to store the maximum value

.CODE
MAIN PROC
     MOV AX,DATA             ; Load address of DATA segment into AX
     MOV DS,AX               ; Set DS (Data Segment register) to point to DATA

     MOV CL,COUNT            ; Load COUNT value into CL (loop counter)
     DEC CL                  ; Decrement CL by 1 (since first value already loaded into AL)

     LEA SI,VALUE            ; Load the address of VALUE array into SI
     MOV AL,[SI]             ; Load the first element of the array into AL (initial maximum)

UP:  INC SI                  ; Move to the next element in the array
     CMP AL,[SI]             ; Compare current maximum (AL) with next element [SI]
     JC NXT                 ; If AL >= [SI], no update needed, jump to NXT
     MOV AL,[SI]             ; Else, update AL with new maximum value

NXT: DEC CL                  ; Decrement loop counter
     JNZ UP                  ; If CL ? 0, repeat the loop

     LEA DI,RES              ; Load address of RES into DI
     MOV [DI],AL             ; Store the maximum value from AL into RES

END MAIN                     ; End of the program and set MAIN as entry point
                 

    