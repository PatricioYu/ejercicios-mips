# Reescribir el ejercicio 1 del apunte anterior como una función. La función debe recibir un año como argumento y devolver 1 si es bisiesto o 0 si no lo es.
.data
prompt: .asciiz "Ingrese el año: \n"
nl:     .asciiz "\n"

.text
.globl main
main:
  li      $v0, 4
  la      $a0, prompt
  syscall
  li      $v0, 5
  syscall
  move    $t0, $v0
  li      $v0, 4
  la      $a0, nl
  syscall
  jal     bisiesto
  li      $v0, 1
  syscall
exit:     
  li      $v0, 10
  syscall

bisiesto:
  rem     $t0, $t0, 4
  beq     $t0, $zero, yes
  bne     $t0, $zero, no

yes:
  li      $a0, 1
  j       return
no: 
  li      $a0, 0
  j       return

return:
  jr      $ra