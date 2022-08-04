; IODemo.asm
; Jiacheng Zhang
; ECE2031 L07
; Produces a "bouncing" animation on the LEDs.
; The LED pattern is initialized with the switch state.

ORG 0
	; Get and store the switch values
	IN     Switches
	OUT    LEDs
	STORE  Pattern
Left:
	; Slow down the loop so humans can watch it.
	CALL   Delay
	; Check if the left place is 1 and if so, switch direction
	LOAD   Pattern
	AND    Bit9         ; bit mask	
	JPOS   SetLeft
	LOAD   Pattern
	SHIFT  1
	STORE  Pattern
	OUT    LEDs
	JUMP   Left
SetLeft:				; Set the leftmost bit to zero
	LOAD   Pattern
	AND    BitL
	STORE  Pattern
	OUT    LEDs
	JUMP   Right
Right:
	; Slow down the loop so humans can watch it.
	CALL   Delay
	; Check if the right place is 1 and if so, switch direction
	LOAD   Pattern
	AND    Bit0         ; bit mask
	JPOS   SetRight
	LOAD   Pattern
	SHIFT  -1
	STORE  Pattern
	OUT    LEDs
	JUMP   Right
SetRight:				; Set the rightmost bit to zero
	LOAD   Pattern
	AND    BitR
	STORE  Pattern
	OUT    LEDs
	JUMP   Left

; To make things happen on a human timescale, the timer is
; used to delay for half a second.
Delay:
	OUT    Timer
WaitingLoop:
	IN     Timer
	;ADDI   -5
	ADDI   -2
	JNEG   WaitingLoop
	RETURN

; Variables
Pattern:   DW 0

; Useful values
Bit0:      DW &B0000000001
Bit9:      DW &B1000000000
BitL:      DW &B0111111111
BitR:      DW &B1111111110

; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
