; sequence.asm
; Jiacheng Zhang
; ECE2031 L07

ORG 0

Loop:
    LOAD    StoreValue  
    AND     Bit0
	JPOS    Odd
	JZERO   Even

Odd:
    LOAD    StoreValue
	SHIFT   -1
	ADD     One
	STORE   StoreValue
	JUMP    Loop

Even:
    LOAD    StoreValue
	ADD     Nine
	STORE   StoreValue
	JUMP    Loop
	
ORG &H100

; Useful values
StoreValue:  DW  0
One:         DW  1
Nine:        DW  9
Bit0:        DW  &B0001