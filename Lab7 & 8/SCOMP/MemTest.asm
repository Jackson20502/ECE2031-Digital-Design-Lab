; MemTest.asm
; Does a simple test on the new memory peripheral

ORG 0
    LOADI   0         ; Start at 0
    STORE   Temp

Loop1:
    LOAD    Temp
    OUT     EXT_A     ; Tell peripheral "address is __"
    SHIFT   1         ; Shift that value left one place
    OUT     EXT_D     ; Tell peripheral "data is __"
    LOAD    Temp
    ADDI    1         ; Increment the counter
    STORE   Temp
    JZERO   Loop2     ; If counter has rolled over, end loop
    JUMP    Loop1     ; Otherwise, loop

Loop2:
    IN      SWITCHES  ; Get value from switches
    OUT     EXT_A     ; Tell peripheral that's the address
    IN      EXT_D     ; Get the data at that address
    OUT     LEDS      ; Display it
    JUMP    Loop2     ; Repeat forever

Temp: DW 0

; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
EXT_A:     EQU &H0A2
EXT_D:     EQU &H0A3