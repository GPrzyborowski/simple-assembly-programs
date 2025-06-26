extrn ExitProcess: PROC
.data

radius dq 4.0
three dq 3.0
four dq 4.0
radiusPow3 dq ?
ratio dq ?
result dq ?

.code

Start PROC

; 1. load 3 onto the stack
; 2. load 4 onto the stack
; 3. divide st0 by st1
; 4. push pi onto the stack
; 5. multiply 4/3 * pi
; 6. push r onto the stack
; 7. multiply r * r
; 8. repeat step 6 and 7 to get r^3
; 9. multiply everything together

fld qword ptr [three]
fld qword ptr [four]
fdiv st(0), st(1)
fstp qword ptr [ratio]
fstp st(0)
; stack is empty, 4/3 stored in ratio

fld qword ptr [radius]
fmul st(0), st(0)
fld qword ptr [radius]
fmul st(0), st(1)
fstp qword ptr [radiusPow3]
fstp st(0)

; stack is empty, r^3 stored in radiusPow3

; push pi onto stack
fldpi

fld qword ptr [radiusPow3]
fld qword ptr [ratio]

; st(0) = ratio, st(1) = radiusPow3, st(2) = pi

fmul st(0), st(1)
fmul st(0), st(2)

fstp qword ptr [result]

fstp st(0)
fstp st(0)

; stack is empty, final result in [result]

call ExitProcess
Start ENDP
end
