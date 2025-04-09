;NAME-ARPAN SAHU
;REGD.NO.-2341019235
;ARRANGE THE ELEMENTS (8-BIT NO.) OF A GIVEN ARRAY SIZE N IN ASCENDING OR DESCENDING ORDER

.DATA
COUNT DB 04H                  ; Number of elements in the array
ARR DB 32H,45H,0FH,05H        ; The array to be sorted

.CODE
MAIN PROC
     MOV AX,DATA              ; Load the address of the data segment into AX
     MOV DS,AX                ; Move it into DS to access data variables

     LEA DI,COUNT             ; Load address of COUNT into DI
     MOV CH,[DI]              ; Load COUNT value into CH
     DEC CH                   ; Decrease CH by 1 for (n-1) passes (bubble sort outer loop)

UP2: MOV CL,CH                ; Set CL for inner loop iterations
     LEA SI,ARR               ; Load address of ARR into SI (start of the array)

UP1: MOV AL,[SI]              ; Load current element in AL
     CMP AL,[SI+1]            ; Compare AL with the previous element (this line is buggy but left as is)
     JC DOWN                  ; If AL < [SI-1], no swap needed, jump to DOWN

     MOV DL,[SI+1]            ; Move [SI-1] into DL (for swapping)
     XCHG [SI],DL             ; Swap [SI] with DL (so [SI] gets [SI-1])
     MOV [SI+1],DL            ; Move DL (old [SI]) into [SI+1], completing the swap

DOWN: INC SI                  ; Move to next element in the array
      DEC CL                  ; Decrease inner loop counter
      JNZ UP1                 ; If more comparisons, repeat inner loop

      DEC CH                  ; Decrease outer loop counter
      JNZ UP2                 ; If more passes, repeat outer loop

END MAIN                      ; End of program (entry point)

                 

    