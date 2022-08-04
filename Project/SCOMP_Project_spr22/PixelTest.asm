; Simple test for the NeoPixel peripheral

ORG 0
	LOAD Color16
	OUT PXL_M
	
	LOADI 3
	OUT PXL_A
	
	LOAD RED
	OUT PXL_D
	
	LOADI 3
	OUT PXL_A
	
	IN PXL_D
	OUT Hex0
	OUT LEDs
	
	
Loop: 
	JUMP Loop

	
	
   
	


; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
PXL_A:     EQU &H0B0
PXL_D:     EQU &H0B1
PXL_M:     EQU &H0B2
Color16: EQU &B0
Color24: EQU &B1
ColorAll: EQU &B10
RED: DW &B1111111111111111
