extrn ExitProcess: PROC
.data

m db 3
n db 2

tab1 dq 1, 2
tab2 dq 3, 4
tab3 dq 5, 6

.code

sumOfAverages PROC

mainLoop:

lea rdi, [r8 + 8 * r13] ; update base address of the column to be summed
xor r9, r9 ; reset column sum
xor r12, r12

startColumnSum:

; calculate address offset

; save rdx to temp
mov r15, rdx
; clear rdx
xor rdx, rdx
mov rax, 8
; 8 * n
mul r15
; base + 8 * n * innerIndex
mul r12
; full address in rbx
mov rbx, rax
add rbx, rdi
; restore rdx
mov rdx, r15

mov r11, [rbx] ; load current element into r11
add r9, r11 ; add element to column sum

inc r12
cmp r12, rcx ; r12 < m ?
jl startColumnSum

; r9 now holds the sum of the column
mov rax, r9

; save rdx to temp (r15)
mov r15, rdx
xor rdx, rdx

; calculate average of column
div rcx

; restore rdx
mov rdx, r15

; add column average to total average sum
add r10, rax

inc r13
cmp r13, rdx
jl mainLoop

mov rax, r10 ; return result in rax

ret
sumOfAverages ENDP

Start PROC

; 1. Load base address
; 2. Add element to column sum
; 3. Increase address by n
; 4. Repeat 2–3 for m times
; 5. Divide column sum by m
; 6. Add result to total average sum
; 7. Increase base address by 8 bytes
; 8. Repeat n times

; rcx = m
; rdx = n
; r8  = base address
; the above registers are passed as parameters
; r9  = column sum
; r10 = total average sum
; r11 = current element
; r12 = inner loop counter (row index, r12 < m)
; r13 = outer loop counter (column index, r13 < n)
; r14 = offset (8 * n * r12)
; r15 = temp
; rbx = full element address with offset

xor rdi, rdi

xor r10, r10
xor r12, r12
xor r13, r13
xor r14, r14

movzx rcx, byte ptr [m] ; <- m
movzx rdx, byte ptr [n] ; <- n
lea r8, tab1 ; <- base address

call sumOfAverages

call ExitProcess
Start ENDP
end
