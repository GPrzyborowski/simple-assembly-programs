extrn ExitProcess: PROC
.data

n db 8

.code

Start PROC

; 1. declare previous = 1
; 2. declare current = 1
; 3. check base cases
; 4. set iterator to 3 if base cases are not met
; 5. compute previous + current = result
; 6. previous = current, current = result
; 7. increment iterator
; 8. if iterator <= n -> repeat from step 5

; rcx = n
; r8 = previous
; r9 = current
; r10 = result
; r11 = iterator

xor rcx, rcx
xor r10, r10
xor r11, r11
mov r8, 1
mov r9, 1

movzx rcx, byte ptr [n]

cmp rcx, 3 
jl baseCases
mov r11, 3
loopStart:
mov r10, r8
add r10, r9

mov r8, r9
mov r9, r10

inc r11
cmp r11, rcx
jle loopStart
mov rax, r10
jmp endLabel

baseCases:
mov rax, 1

endLabel:

call ExitProcess
Start ENDP
end
