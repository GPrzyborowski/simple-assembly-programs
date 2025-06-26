extrn ExitProcess: PROC
.data

array dq 5, 2, 7, 1, 8

.code
Start PROC

; r10 = true / false
; 1. initially set r10 to false
; 2. outer loop runs until no more swaps are made (r10 == 0)
; 3. inner loop iterates over elements
; 4. inside: compare current with next then swap if current > next

; rbx = base address of array
; r10 = wasChanged flag
; r11 = offset for next element
; rcx = inner loop index
; r12 = temp
; r13 = current element
; r14 = next element

; zero out
xor rcx, rcx
xor rbx, rcx
xor rax, rax
xor r10, r10
xor r11, r11
xor r12, r12
xor r13, r13
xor r14, r14

; load base address
lea rbx, array
; set wasChanged to false
mov r10, 0

outerLoop:
mov r10, 0
xor r11, r11
xor rcx, rcx

innerLoop:
; current element
mov r13, [rbx + 8 * rcx]
inc r11
; next element
mov r14, [rbx + 8 * r11]
cmp r13, r14
jl skipSwap

; swap
mov r12, r13 ; temp = current
mov r13, r14 ; current = next
mov r14, r12 ; next = temp

; write swapped values to memory
mov [rbx + 8 * rcx], r13
mov [rbx + 8 * r11], r14
mov r10, 1

skipSwap:
inc rcx
cmp rcx, 4
jl innerLoop

; if any element was swapped then repeat outer loop
cmp r10, 1
je outerLoop

call ExitProcess
Start ENDP
end
