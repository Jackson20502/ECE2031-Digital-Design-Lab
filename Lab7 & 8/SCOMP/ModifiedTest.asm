; Tests the new address auto-increment capability
; by writing and reading several values.

ORG 0
    ; Write a few test values
    LOADI  0
    OUT    EXT_A        ; Start at address 0
    ; Starting with 3, write incrementing values
    ; to increasing addresses
    LOADI  3
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D

    ; Write a few different values to confirm correct
    ; behavior
    LOADI  5
    OUT    EXT_A        ; Start at address 5
    ; Starting with 0xA, write incrementing values
    ; to increasing addresses
    LOADI  &HA
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D
    ADDI   1
    OUT    EXT_D

    ; Check if address 4 contains 7,
    ; address 5 contains A, and
    ; address 7 contains C.
    LOADI  4
    OUT    EXT_A
    IN     EXT_D
    OUT    LEDs
    IN     EXT_D
    OUT    Hex0
    IN     EXT_D
    IN     EXT_D
    OUT    Hex1

; Infinite loop
Die:
    JUMP   Die

; IO address constants
Switches:  EQU 000
LEDs:      EQU 001
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
EXT_A:     EQU &H0A2
EXT_D:     EQU &H0A3