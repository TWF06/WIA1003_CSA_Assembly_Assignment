 INCLUDE Irvine32.inc

.data
; Word array arranged in non-decreasing order.
arr WORD 0, 2, 5, 9, 10
; Stores the final sum of all gaps between adjacent elements.
sum DWORD 0

.code
main PROC
    ; ESI points to the current array element.
    mov esi, OFFSET arr
    ; Number of gaps is one less than number of array elements.
    mov ecx, LENGTHOF arr
    dec ecx
    ; EAX is used as the total gap accumulator.
    xor eax, eax

L1:
    ; Load current element and next element using indexed addressing.
    movzx ebx, WORD PTR [esi]
    movzx edx, WORD PTR [esi + TYPE arr]
    ; Calculate current gap and add it to the total.
    sub edx, ebx
    add eax, edx
    ; Move to the next WORD element.
    add esi, TYPE arr
    loop L1

    ; Store result and display registers for checking.
    mov sum, eax
    call DumpRegs
    exit
main ENDP

END main
