#Escribir un programa en MIPS que decida si un año es bisiesto o no.
.data
prompt: .asciiz "Ingrese el año: \n"
yes:    .asciiz "Es bisiesto"
no:     .asciiz "No es bisiesto"

.text
.globl main
main:
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall

  move    $t0, $v0
  rem     $t0, $t0, 4

  beq     $t0, $zero, bisiesto
  li      $v0, 4
  la      $a0, no
  syscall
  li      $v0, 10
  syscall

bisiesto:
  li      $v0, 4
  la      $a0, yes
  syscall
  li      $v0, 10
  syscall
  