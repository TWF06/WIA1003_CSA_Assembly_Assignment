INCLUDE Irvine32.inc

.data
; Message shown before each integer input.
prompt BYTE "Enter 32-bit integer: ", 0
; Message shown before displaying the sum.
resultMsg BYTE "The sum of 32-bit integers is : ", 0
; Array to store three signed 32-bit integers.
values SDWORD 3 DUP(?)
; Stores the calculated sum.
sum SDWORD 0

.code
main PROC
    ; ESI points to the first array location.
    mov esi, OFFSET values
    ; ECX controls the input loop for three values.
    mov ecx, LENGTHOF values

ReadLoop:
    ; Prompt user and read one 32-bit signed integer into EAX.
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    ; Store input value in the current array position.
    mov [esi], eax
    ; Move to next SDWORD element.
    add esi, TYPE values
    loop ReadLoop

    ; Reset array pointer and counter before summing.
    mov esi, OFFSET values
    mov ecx, LENGTHOF values
    ; EAX is used as the sum accumulator.
    xor eax, eax

SumLoop:
    ; Add current array value to the accumulator.
    add eax, [esi]
    add esi, TYPE values
    loop SumLoop

    ; Store and display the final sum.
    mov sum, eax
    call Crlf
    mov edx, OFFSET resultMsg
    call WriteString
    mov eax, sum
    call WriteInt
    call Crlf

    exit
main ENDP

END main
