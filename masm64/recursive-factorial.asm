extrn ExitProcess: PROC
.data

n db 8

.code

factorial PROC

cmp rcx, 2
jl baseCase

push rcx
dec rcx
call factorial

pop rcx

mul rcx

jmp endLabel

baseCase:
mov rax, 1

endLabel:

ret
factorial ENDP

Start PROC

; 1. declare previous = 1
; 2. declare current = 1
; 3. check base cases
; 4. if not base case, set iterator = 3
; 5. compute previous + current = result
; 6. previous = current, current = result
; 7. increment iterator
; 8. if iterator <= n then repeat from step 5

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

xor rax, rax

call factorial

call ExitProcess
Start ENDP
end
