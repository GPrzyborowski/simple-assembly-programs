extrn ExitProcess: PROC
.data

a dq 4

tab1 dq 1, 2, 3, 4
tab2 dq 5, 6, 7, 8
tab3 dq 9, 1, 2, 3
tab4 dq 4, 5, 6, 7

.code

frameAverage PROC
    ; rcx = base address of the array
    ; rdx = size (a)

    ; r8  = row index
    ; r9  = column index
    ; r10 = running sum
    ; r11 = element counter
    ; rax, rbx = temp registers

    ; rcx = base address
    mov rcx, rdx              
    ; rdx = a
    mov rdx, qword ptr [a]    

    xor r8, r8
    xor r10, r10
    xor r11, r11

rowLoop:
    xor r9, r9

colLoop:

    ; check if element is part of the outer frame
    cmp r8, 0
    je inFrame

    mov rax, rdx
    dec rax
    cmp r8, rax
    je inFrame

    cmp r9, 0
    je inFrame

    mov rax, rdx
    dec rax
    cmp r9, rax
    je inFrame

    ; not part of the frame -> skip to next column
    jmp nextCol

inFrame:
    mov rax, r8
    push rdx
    mul rdx
    pop rdx
    add rax, r9
    shl rax, 3

    mov rbx, [rcx + rax]
    add r10, rbx
    inc r11

nextCol:
    inc r9
    cmp r9, rdx
    jl colLoop

    inc r8
    cmp r8, rdx
    jl rowLoop

    ; average = sum / count
    mov rax, r10
    xor rdx, rdx
    div r11

    ret
frameAverage ENDP

Start PROC

    ; Set up params
    ; base address
    lea rdx, tab1

    call frameAverage

    ; result in rax
    call ExitProcess
Start ENDP
end
