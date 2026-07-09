INCLUDE Irvine32.inc

.data
; Prompt for user mark input.
prompt BYTE "Enter mark (0-100): ", 0
; Label displayed before the grade letter.
gradeMsg BYTE "Grade: ", 0

.code
GetGrade PROC
    ; Input: EAX = mark (0..100)
    ; Output: AL = letter grade
    ; Compare from highest range to lowest range.
    cmp eax, 90
    jge GradeA
    cmp eax, 80
    jge GradeB
    cmp eax, 70
    jge GradeC
    cmp eax, 60
    jge GradeD
    mov al, 'F'
    ret

GradeA:
    ; Mark is from 90 to 100.
    mov al, 'A'
    ret
GradeB:
    ; Mark is from 80 to 89.
    mov al, 'B'
    ret
GradeC:
    ; Mark is from 70 to 79.
    mov al, 'C'
    ret
GradeD:
    ; Mark is from 60 to 69.
    mov al, 'D'
    ret
GetGrade ENDP

main PROC
    ; Read mark from user into EAX.
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt

    ; Call procedure and preserve returned grade character.
    call GetGrade
    mov bl, al

    ; Display the grade result.
    call Crlf
    mov edx, OFFSET gradeMsg
    call WriteString
    mov al, bl
    call WriteChar
    call Crlf

    exit
main ENDP

END main
