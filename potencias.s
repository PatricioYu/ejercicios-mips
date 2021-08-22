# Escribir un programa que imprima las primeras n potencias de dos, siendo n un número ingresado por el usuario. Al finalizar el programa debe imprimir la suma de las potencias calculadas.
.data
n:        .asciiz "Ingrese un número: \n"
potencia: .asciiz "Ingrese las veces que desea elevarlo: \n"
msg:      .asciiz "\nEl resultado es: \n"
suma:     .asciiz "\nLa suma de todas las potencias es: \n"

.text
.globl main
main:
  li      $s0, 1

  li      $v0, 4
  la      $a0, n
  syscall
  li      $v0, 5
  syscall
  move    $t0 ,$v0 

  li      $v0, 4
  la      $a0, potencia
  syscall
  li      $v0, 5
  syscall
  move    $t1, $v0

  li      $t2 0
  add     $t2, $t2, $t0

  li      $t3, 0
  add     $t3, $t3, $t0


loop:
  beq     $s0, $t1, exit
  addi    $s0, $s0, 1
  mul     $t2, $t2, $t0
  add     $t3, $t3, $t2
  j       loop


exit:
  li      $v0, 4
  la      $a0, msg
  syscall
  li      $v0, 1
  move    $a0, $t2
  syscall

  li      $v0, 4
  la      $a0, suma
  syscall
  li      $v0, 1
  move    $a0, $t3
  syscall

  li      $v0, 10
  syscall

