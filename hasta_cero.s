# Escribir un programa en MIPS que acepte números ingresados por el usuario hasta que el usuario ingrese el número cero. La salida del programa es la suma de todos los números ingresados.
.data
prompt: .asciiz "Ingrese un numero: \n"
msg:    .asciiz "\nLa suma total es: \n"

.text
.globl main
main:
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall
  move    $s0, $v0

loop:
  beq     $s0, $zero, exit
  add     $s1, $s1, $s0
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall
  move    $s0, $v0  
  j       loop

exit:
  li      $v0, 4
  la      $a0, msg
  syscall
  li      $v0, 1
  move    $a0, $s1
  syscall
  li      $v0, 10
  syscall
