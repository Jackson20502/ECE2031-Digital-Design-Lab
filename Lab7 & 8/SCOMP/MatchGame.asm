; MatchGame.asm
; Jiacheng Zhang
; ECE2031 L07

ORG 0
	Load   		TotalScore			; Initialize TotalScore
	AND    		Zero
	STORE  		TotalScore
	Load   		LEDDisplayNum		; Initialize LEDDisplayNum
	AND    		Zero
	STORE  		LEDDisplayNum
	Load   		TimeCounter			; Initialize TimeCounter
	AND    		Zero
	STORE  		TimeCounter
CheckDown:
    IN			Switches
	JZERO		IncrementAC			; When all switches are down, increment the value in AC
	JUMP		CheckDown			; If not, continue checking
IncrementAC:
    Load		LEDDisplayNum
	ADDI		1
	STORE		LEDDisplayNum
	ADDI		-1023
	JZERO		ResetAC				; If hit the bound, reset LEDDisplayNum to 0
	LOAD		LEDDisplayNum
	OUT			LEDs
	IN			Switches			; If one of the switches is up,
	JPOS		CountTime			; freeze LEDDisplayNum and start counting time
	JZERO		IncrementAC
ResetAC:
    Load		LEDDisplayNum
	AND			Zero
	STORE		LEDDisplayNum
	JUMP		IncrementAC
CountTime:
	IN			Switches
	SUB			LEDDisplayNum
	JZERO		SwitchMatch
	CALL		Delay				; Increment TimeCounter ten times per second
    Load		TimeCounter
	ADDI		-1
	STORE		TimeCounter
	JUMP		CountTime
SwitchMatch:
    LOAD		TimeCounter
	ADD			Fifty
	STORE		NewScore
	LOAD		TotalScore
	ADD			NewScore
	STORE		TotalScore
	JNEG		TotalScore0
DisplayTotalScore:
	LOAD		TotalScore
	OUT			Hex0				; Output on 7-segment display
	LOAD		TimeCounter			; If match, reset the TimeCounter
	AND			Zero
	STORE		TimeCounter
	JUMP		CheckDown
TotalScore0:
	LOAD		TotalScore
	AND			Zero
	STORE		TotalScore
	JUMP		DisplayTotalScore
Delay:
	OUT    Timer
WaitingLoop:
	IN     Timer
	ADDI   -1
	JNEG   WaitingLoop
	RETURN

; Variables
LEDDisplayNum:	DW 0
TimeCounter:	DW 0
NewScore:		DW 0
TotalScore:		DW 0

; Useful values
Zero:			DW &B0000000000
Fifty:			DW 50

; IO address constants
Switches:		EQU 000
LEDs:			EQU 001
Timer:			EQU 002
Hex0:			EQU 004