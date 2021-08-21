  
.data
prompt: .asciiz "Ingrese un numero: \n"
msg: .asciiz "El valor absoluto es: \n "

.text
.globl main
main:
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall
  move    $t0, $v0           
  blt     $t0, $zero, negativo
  j       exit

negativo:
  mul     $t0, $t0, -1      

exit:
  li      $v0, 4
  la      $a0, msg
  syscall
  li      $v0, 1
  move    $a0, $t0
  syscall
  li      $v0, 10
  syscall
