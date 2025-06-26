extrn ExitProcess: PROC
.data

a dq 0.0
b dq 5.0
n dq 8.0

two dq 2.0

deltaX dq ?
functionValue dq ?
sum dq 0.0
x dq ?

.code

integrate PROC

fsub st(0), st(1)

fdiv st(0), st(2)
fstp qword ptr [deltaX]
fstp st(0)
fstp st(0)

fld qword ptr [a]
fstp qword ptr [x]

xor rcx, rcx ; <- loop counter

loopStart:

fld qword ptr [two]

fld qword ptr [x]

fmul st(0), st(0) ; <- x^2

fmul st(0), st(1) ; <- 2x^2

fstp qword ptr [functionValue]
fstp st(0)
; stack is now empty

fld qword ptr [deltaX]
fld qword ptr [functionValue]
fmul st(0), st(1)

fld qword ptr [sum]

fadd st(0), st(1)

fstp qword ptr [sum]

fstp st(0)

fld qword ptr [x]

fadd st(0), st(1)

fstp qword ptr [x]
fstp st(0)

inc rcx
cmp rcx, 7
jle loopStart

fld qword ptr [sum]
ret
integrate ENDP

Start PROC

; function = 2x^2

; 1. calculate dx = (b - a) / n
; 2. sum = 0, x = a
; 3. loop from 0 to n - 1
    ; compute f(x)
    ; sum += f(x) * dx
    ; x += dx
; 4. return result

finit

; 1
fld qword ptr [n]
fld qword ptr [a]
fld qword ptr [b]

call integrate

call ExitProcess
Start ENDP
end
