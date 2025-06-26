extrn ExitProcess: PROC
.data

array db 4, 1, 5, 6, 7, 7, 4, 0

.code

computeAverage PROC

loopStart:
movzx r8, byte ptr [rcx + r11] ; current element
cmp r8, 0
je endLoop
test r8, 1 ; check if even
jnz odd
add rbx, r8
odd:
inc r11
jmp loopStart

endLoop:
mov rax, rbx
div r11
; rax / r11
; result returned in rax (fastcall convention)
ret
computeAverage ENDP

Start PROC

; 1. Iterate through the array
; 2. If element == 0, exit loop (do not increase counter)
; 3. If element is even, add it to sum register
; 4. Otherwise, skip and continue
; 5. After the loop, divide the sum by the counter

; rcx = array base address
; r11 = index
; r8 = current element
; rbx = sum register

xor rcx, rcx
xor r11, r11
xor r8, r8
xor rbx, rbx
xor rdx, rdx

lea rcx, array

call computeAverage

call ExitProcess
Start ENDP
end
