INCLUDE Irvine32.inc

.data
; Maximum value used to generate the sequence.
n DWORD 8

.code
main PROC
    ; EBX stores the starting number for each row.
    mov ebx, 1

OuterRow:
    ; EDX stores the current number being printed in this row.
    mov edx, ebx
    ; ECX stores how many numbers remain in the current row.
    mov ecx, n
    sub ecx, ebx
    inc ecx

InnerCol:
    ; Save loop counter because Irvine32 output calls may change registers.
    push ecx
    ; WriteDec prints the number in EAX.
    mov eax, edx
    call WriteDec
    ; Print a space after each number.
    mov al, ' '
    call WriteChar
    ; Move to the next number in the row.
    inc edx
    pop ecx
    loop InnerCol

    ; Start a new line and move to the next row.
    call Crlf
    inc ebx
    ; Continue until starting number is greater than n.
    cmp ebx, n
    jle OuterRow

    exit
main ENDP

END main
