# Simple Assembly Programs (MASM64)

This repository contains a set of **simple assembly (MASM64)** programs that I created as part of my university coursework.

Each program demonstrates a specific algorithm or operation written in 64-bit x86 assembly.  
The focus is on core logic, low-level memory operations, and learning control flow at the assembly level.

Below, you’ll find a screenshot taken after running the program in Visual Studio, showing the state of registers or memory in the debugger.

---

## Recursive factorial

Computes the factorial of a number using recursion.

![screenshot](https://github.com/user-attachments/assets/6aed7c51-35da-4049-a968-935553b8a279)

8! = 8 × 7 × 6 × 5 × 4 × 3 × 2 × 1 = 40320

RAX = 0000000000009D80 (hex) = 40320 (dec)

## Fibonacci

Calculates the n-th Fibonacci number starting from `1, 1`.

![screenshot](https://github.com/user-attachments/assets/8027080a-a04e-4760-958a-bfa8ed51730f)

1, 1, 2, 3, 5, 8, 13, 21

F(8) = 21

RAX = 0000000000000015 (hex) = 21 (dec)

## Bubble Sort

Sorts an array using bubble sort and swaps values directly in memory.

![bubble](https://github.com/user-attachments/assets/8b305bb7-6ac7-489b-a79a-1ba6c27b53ec)

## Integral (Rectangle Method)

Approximates the integral of `2x²` using the rectangle method.

![screenshot](https://github.com/user-attachments/assets/f5a1844b-9202-4cf9-a2ba-2030084be910)

dx = (b - a) / n = (5 - 0) / 8 = 0.625

f(x) = 2x²

x values: 0.0 0.625 1.25 1.875 2.5 3.125 3.75 4.375

f(x): 0 0.78125 3.125 7.03125 12.5 19.53125 28.125 38.28125

f(x) * dx: 0 0.48828 1.95313 4.39453 7.8125 12.20703 17.57813 23.92578

Sum ≈ 68.35937

FLD result: ST(0) ≈ 68.359375

ST(0) = +6.8359375e+01 = 68.359375

## Sum of Column Averages

Given a matrix in memory, this program calculates the average of each column and returns their sum.

![screenshot](https://github.com/user-attachments/assets/a4457d14-41e8-4acd-85fd-e55663c758ae)

Matrix:

1 2

3 4

5 6

Columns:

Col 1: 1, 3, 5, so average = (1 + 3 + 5) / 3 = 3

Col 2: 2, 4, 6, so average = (2 + 4 + 6) / 3 = 4

Sum of column averages = 3 + 4 = 7

RAX = 0000000000000007 (hex) = 7 (dec)

## Frame Average

Calculates the average of values along the outer frame of a square matrix.

![screenshot](https://github.com/user-attachments/assets/100466d1-fccf-45d7-a4b4-93c121c647ae)


Frame elements:

1, 2, 3, 4, 8, 3, 7, 6, 5, 4, 9, 5

Sum = 1 + 2 + 3 + 4 + 8 + 3 + 7 + 6 + 5 + 4 + 9 + 5 = 57 

Count = 12  

Average = 57 / 12 = 4 with remainder 9

RAX = 0000000000000004 (hex) = 4 (dec)  

RDX = 0000000000000009 (hex) = 9 (dec)


## Find Maximum in Array

Scans an array terminated with `0` and finds the maximum element.

![screenshot](https://github.com/user-attachments/assets/4fc6a01b-55e1-4385-9237-e170c1b73abb)


## Sphere Volume

Calculates the volume of a sphere using the formula:  
&nbsp;&nbsp;&nbsp;&nbsp;`V = (4/3) * π * r³`

![screenshot](https://github.com/user-attachments/assets/38d5f52e-265d-4a22-bfa5-89ca3f5edffd)

For r = 4, the result is:  

V ≈ 268.08257

Final result stored in memory:  

268.08257310632899
