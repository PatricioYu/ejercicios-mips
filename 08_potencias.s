# Escribir un programa que imprima las primeras n potencias de dos, siendo n un número ingresado por el usuario. Al finalizar el programa debe imprimir la suma de las potencias calculadas.
# En vez de hacer solo potencia de base 2, tomo la base que ingrese el usuario y la potencio la cantidad de veces que desee el usuario.
.data
base:     .asciiz "Ingrese un número: \n"
potencia: .asciiz "Ingrese las veces que desea elevarlo: \n"
msg:      .asciiz "\nEl resultado es: \n"
suma:     .asciiz "\nLa suma de todas las potencias es: \n"

.text
.globl main
main:
  li      $s0, 1                # inicializo contador

  li      $v0, 4
  la      $a0, base
  syscall                       # leo mensaje de base
  li      $v0, 5                
  syscall                       # guardo el valor ingresado por el usuario
  move    $t0 ,$v0              # muevo ese valor desde $v0 a $t0

  li      $v0, 4
  la      $a0, potencia
  syscall                       # leo mensaje de potencia
  li      $v0, 5
  syscall                       # guardo el valor ingresado por el usuario
  move    $t1, $v0              # muevo ese valor desde $v0 a $t1

  li      $t2, 0                # inicializo acumulador
  add     $t2, $t2, $t0

  li      $t3, 0                # inicializo suma
  add     $t3, $t3, $t0


loop:
  beq     $s0, $t1, exit
  addi    $s0, $s0, 1           # contador
  mul     $t2, $t2, $t0         # acumulador
  add     $t3, $t3, $t2         # suma
  j       loop


exit:
  li      $v0, 4
  la      $a0, msg
  syscall                       # printeo msg
  li      $v0, 1
  move    $a0, $t2
  syscall                       # printeo el resultado de la potencia

  li      $v0, 4
  la      $a0, suma
  syscall                       # printeo el mensaje de suma
  li      $v0, 1
  move    $a0, $t3
  syscall                       # printeo la suma de las potencias

  li      $v0, 10
  syscall                       # cierro mi programa
