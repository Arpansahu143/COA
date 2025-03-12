; NAME - ARPAN SAHU
; REGD.NO. - 2341019235
; FIND GRAY CODE OF 8-BIT NUMBER

MOV AL, [5000H]    ; Load binary number
MOV CL, AL          ; Copy to CL
SHR CL, 01H         ; Right shift CL by 1
XOR AL, CL          ; XOR AL with shifted value
MOV [5001H], AL     ; Store Gray code
HLT                 ; Stop program
