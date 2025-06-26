extrn ExitProcess: PROC
.data

array dq 5, 2, 7, 1, 8, 0

.code
Start PROC

; clear registers

xor rax, rax
xor rcx, rcx
xor rbx, rbx

; store array address in rbx
lea rbx, array

; 1. assume first element is the maximum
; 2. compare it iteratively with the next
; 3. if the next is greater, max = next
; 4. repeat until the next equals 0

; [rbx] = element
; rcx = element offset
; r8 = max
; r9 = next

mov rcx, 1
mov r8, [rbx]
loopStart:
mov r9, [rbx + 8 * rcx]
cmp r9, 0
je endLabel
cmp r8, r9
jg skip
mov r8, r9
skip:
inc rcx
jmp loopStart

endLabel:
mov rax, r8

call ExitProcess
Start ENDP
end
