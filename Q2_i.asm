;NAME-ARPAN SAHU
;REGD.NO.-2341019235
;SWAPPING OF TWO NIBBLE OF 8 DIGIT NUMBER       

MOV AL,[5000H]
MOV BL,AL
SHR AL,04H
SHL BL,04H
OR AL,BL
MOV [5001H],AL
HLT