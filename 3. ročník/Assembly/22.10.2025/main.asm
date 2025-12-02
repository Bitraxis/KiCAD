; musime definovat globalnu _start, ktoru neskor pouzijeme
global _start

; nas uz realny kod ide pod toto nemusi byt odsadeny 
section .text

; ten nas start tu zije nas program
; vsimnite si ze kazdy operacny system mal by mat ine funkcie pod niakym cislom
; tu sa pouzivaju funkcie ktore su velko plosne dostupne ale pamatajte si ze kazdy operacny system
; si moze spravit hocico vlastne s nimi ale moderne assemblery si s tym vedia dat rady
; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
_start:
  mov rax, 1        ; write(
  mov rdi, 1        ;   STDOUT_FILENO,
  mov rsi, msg      ;   "Hello, world!\n",
  mov rdx, msglen   ;   sizeof("Hello, world!\n")
  syscall           ; );

  mov rax, 60       ; exit(
  mov rdi, 0        ;   EXIT_SUCCESS
  syscall           ; );

; data nasej spravi
section .rodata
  msg: db "Hello, world!", 10 
  msglen: equ $ - msg
