#Escribir un programa en MIPS que decida si un número es par o no.
.data
prompt: .asciiz "Ingrese un numero: \n"
par:    .asciiz "Es par"
no_par: .asciiz "No es par"

.text
.globl main
main:
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall
  move    $t0, $v0
  rem     $t1, $t0, 2
  beq     $t1, $zero, es_par
  li      $v0, 4
  la      $a0, no_par
  syscall
  li      $v0, 10
  syscall

es_par: 
  li      $v0, 4
  la      $a0, par
  syscall
  li      $v0, 10
  syscall