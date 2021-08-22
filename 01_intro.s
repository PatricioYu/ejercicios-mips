#¿Cuál es el código en MIPS para el siguiente enunciado de C? f = g + (h - 5);
.data
prompt_h: .asciiz "Ingrese el valor de h: \n"
prompt_g: .asciiz "Ingrese el valor de g: \n"
msg:      .asciiz "f = "
.text
.globl main
main:
  li      $v0, 4
  la      $a0, prompt_h
  syscall
  li      $v0, 5
  syscall
  move    $t0, $v0
  li      $v0, 4
  la      $a0, prompt_g
  syscall
  li      $v0, 5
  syscall
  move    $t1, $v0
  addi    $t3, $t0, -5
  add     $t1, $t1, $t3
  li      $v0, 4
  la      $a0, msg
  syscall
  li      $v0, 1
  move    $a0, $t1
  syscall
  li      $v0, 10
  syscall