# Mismo programa que el ejercicio cuatro, pero imprimiendo la suma y el promedio de los números ingresados.
.data
prompt: .asciiz "Ingrese un numero: \n"
suma:    .asciiz "\nLa suma total es: \n"
prom:  .asciiz "\nEl promedio es: \n"

.text
.globl main
main:
  li      $s2, 0
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall
  move    $s0, $v0

loop:
  beq     $s0, $zero, exit
  add     $s1, $s1, $s0
  addi    $s2, $s2, 1
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall
  move    $s0, $v0  
  j       loop

exit:
  div     $s3, $s1, $s2
  li      $v0, 4
  la      $a0, suma
  syscall
  li      $v0, 1
  move    $a0, $s1
  syscall
  li      $v0, 4
  la      $a0, prom
  syscall
  li      $v0, 1
  move    $a0, $s3
  syscall
  li      $v0, 10
  syscall
