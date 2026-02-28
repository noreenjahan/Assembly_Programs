.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "ENTER THREE INITIALS: $"
    CRLF DB 0DH, 0AH, "$"

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ;--------------------------
    ; Display Prompt Message
    ;--------------------------
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    ;--------------------------
    ; Read First Initial
    ;--------------------------
    MOV AH, 01H
    INT 21H
    MOV BL, AL        ; Store First Initial in BL

    ;--------------------------
    ; Read Middle Initial
    ;--------------------------
    MOV AH, 01H
    INT 21H
    MOV BH, AL        ; Store Middle Initial in BH

    ;--------------------------
    ; Read Last Initial
    ;--------------------------
    MOV AH, 01H
    INT 21H
    MOV CH, AL        ; Store Last Initial in CH

    ;--------------------------
    ; Print Newline
    ;--------------------------
    MOV AH, 09H
    LEA DX, CRLF
    INT 21H

    ;--------------------------
    ; Print First Initial
    ;--------------------------
    MOV AH, 02H
    MOV DL, BL        ; First Initial
    INT 21H

    ; New Line
    MOV AH, 09H
    LEA DX, CRLF
    INT 21H

    ;--------------------------
    ; Print Middle Initial
    ;--------------------------
    MOV AH, 02H
    MOV DL, BH        ; Middle Initial
    INT 21H

    ; New Line
    MOV AH, 09H
    LEA DX, CRLF
    INT 21H

    ;--------------------------
    ; Print Last Initial
    ;--------------------------
    MOV AH, 02H
    MOV DL, CH        ; Last Initial from CH
    INT 21H

    ; New Line
    MOV AH, 09H
    LEA DX, CRLF
    INT 21H

    ;--------------------------
    ; Exit Program
    ;--------------------------
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN