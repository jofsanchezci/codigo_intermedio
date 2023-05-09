section .data
    number dd 0
    result dd 0

section .text
    global _start

_start:
    ; Lectura del número
    mov eax, 3             ; syscall number para read
    mov ebx, 0             ; file descriptor stdin
    mov ecx, number        ; dirección de memoria para almacenar el número
    mov edx, 4             ; tamaño del buffer
    int 0x80               ; llamada al sistema para leer

    ; Verificar si el número es mayor o igual a 0
    cmp dword [number], 0
    jl negative_factorial  ; saltar a etiqueta si es negativo

    ; Inicializar registros
    mov ebx, 1             ; contador (inicialmente 1)
    mov eax, 1             ; factorial (inicialmente 1)

    ; Bucle para calcular el factorial
factorial_loop:
    cmp ebx, dword [number]  ; comparar el contador con el número
    jg factorial_end       ; saltar al final si el contador es mayor
    imul eax, ebx          ; multiplicar eax por ebx
    inc ebx                ; incrementar el contador
    jmp factorial_loop     ; saltar al inicio del bucle

    ; Fin del cálculo del factorial
factorial_end:
    ; Guardar el resultado en memoria
    mov dword [result], eax

    ; Mostrar el resultado
    mov eax, 4             ; syscall number para write
    mov ebx, 1             ; file descriptor stdout
    mov ecx, result        ; dirección de memoria del resultado
    mov edx, 4             ; tamaño del mensaje (4 bytes)
    int 0x80               ; llamada al sistema para escribir

    ; Salir del programa
    mov eax, 1             ; syscall number para exit
    xor ebx, ebx           ; código de salida 0
    int 0x80               ; llamada al sistema para salir

negative_factorial:
    ; Mostrar mensaje de error para números negativos
    mov eax, 4             ; syscall number para write
    mov ebx, 1             ; file descriptor stdout
    mov ecx, negative_msg  ; dirección del mensaje
    mov edx, negative_len  ; tamaño del mensaje
    int 0x80               ; llamada al sistema para escribir

    ; Salir del programa
    mov eax, 1             ; syscall number para exit
    mov ebx, 1             ; código de salida 1
    int 0x80               ; llamada al sistema para salir

section .data
    negative_msg db "Factorial is not defined for negative numbers", 10
    negative_len equ $ - negative_msg