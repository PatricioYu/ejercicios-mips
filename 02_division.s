# Escribir un programa que acepte dos números enteros del usuario y calcule el cociente y resto de la división entera. El resultado tiene que verse así en la consola:
.data
prompt_dividendo:  .asciiz "Ingrese el dividendo: \n"
prompt_divisor:    .asciiz "Ingrese el divisor: \n"
new_line:          .asciiz "\n(dividendo = cociente . divisor - resto) \n"
igual:             .asciiz " = "
por:               .asciiz " . "
menos:             .asciiz " - "

.text
.globl main
main:
  li      $v0, 4
  la      $a0, prompt_dividendo
  syscall
  li      $v0, 5
  syscall
  move    $t0, $v0

  li      $v0, 4
  la      $a0, prompt_divisor
  syscall
  li      $v0, 5
  syscall
  move    $t1, $v0

  div     $t3, $t0, $t1
  rem     $t4, $t0, $t1

  li      $v0, 4
  la      $a0, new_line
  syscall

  li      $v0, 1
  move    $a0, $t0
  syscall
  li      $v0, 4
  la      $a0, igual
  syscall
  li      $v0, 1
  move    $a0, $t3
  syscall
  li      $v0, 4
  la      $a0, por
  syscall
  li      $v0, 1
  move    $a0, $t1
  syscall
  li      $v0, 4
  la      $a0, menos
  syscall
  li      $v0, 1
  move    $a0, $t4
  syscall

  li      $v0, 10
  syscall