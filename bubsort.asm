j main
j Interrupt
j Exception
swap:
addi $sp,$sp,-20 #压栈
sw $ra,0($sp) #存上一级调用下一步指令地址
sw $s0,4($sp) #存上一级调用函数的$s0
sw $s1,8($sp) #存上一级调用函数的$s1
sw $t0,12($sp) #存上一级调用函数的$t0
sw $t1,16($sp) #存上一级调用函数的$t1
move $s0, $a0 #用$s0存v[]
move $s1, $a1 #用$s1存k
sll $t0,$s1,2
addi $t1,$t0,4
add $t0,$s0,$t0
add $t1,$s0,$t1
lw $t2,($t0) #temp = v[k]
lw $t3,($t1)
sw $t3,($t0) #v[k] = v[k+1]
sw $t2,($t1) #v[k+1] = temp
move $v0,$zero #return 0
lw $ra,($sp)
lw $s0,4($sp) #恢复上一级调用函数的$s0
lw $s1,8($sp) #恢复存上一级调用函数的$s1
lw $t0,12($sp) #存上一级调用函数的$t0
lw $t1,16($sp) #存上一级调用函数的$t1
addi $sp, $sp,20
jr $ra #返回上一级调用函数

bubsort:
addi $sp,$sp,-12 #压栈
sw $ra,0($sp) #存上一级调用下一步指令地址
sw $s0,4($sp) #存上一级调用函数的$s0
sw $s1,8($sp) #存上一级调用函数的$s1
move $s0, $a0 #用$s0存v[]
move $s1, $a1 #用$s1存n
li $t0,0 #用$t0存i
bubsort_loop:
bge $t0,$s1,bubsort_exit
addi $t1,$t0,-1 #j=i-1
bubsort_loop_loop:
slt $at,$t1,$zero
li $t4,1
beq $at,$t4,bubsort_loop_exit #j<0跳出循环
sll $t2,$t1,2
addi $t3,$t2,4
add $t2,$s0,$t2
add $t3,$s0,$t3
lw $t2,($t2)
lw $t3,($t3)
ble $t2,$t3,bubsort_loop_exit #v[j] <= v[j+1]跳出循环
move $a0,$s0
move $a1,$t1
jal swap
addi $t1,$t1,-1 #j--
j bubsort_loop_loop
bubsort_loop_exit:
addi $t0,$t0,1 #i++
j bubsort_loop
bubsort_exit:
move $v0,$zero #return 0
lw $ra,($sp)
lw $s0,4($sp) #恢复上一级调用函数的$s0
lw $s1,8($sp) #恢复存上一级调用函数的$s1
addi $sp, $sp,12
jr $ra #返回上一级调用函数

main:
#addi $gp,$gp,-20
li $t0,4
sw $t0,0($zero)
li $t0,4
sw $t0,4($zero)
li $t0,3
sw $t0,8($zero)
li $t0,2
sw $t0,12($zero)
li $t0,1
sw $t0,16($zero)
move $s0,$zero
lw $s1,($s0)  #N = buffer[0]
addi $s0,$s0,4 #用$s0存&(buffer[1])
move $a0,$s0
move $a1,$s1
jal bubsort
lui $t5,0x4000
lw $t7,0x14($t5)
li $s4,0xe00
li $t6,-100
sw $t6,($t5)
sw $t6,0x04($t5)
li $t6,3
sw $t6,0x08($t5)

loop:
beq $zero,$zero,loop

Interrupt:
li $t6,0
sw $t6,0x08($t5)
jal ans
jal zero
jal one
jal two
jal three
jal four
jal five
jal six
jal seven
jal eight
jal nine
jal a
jal b
jal c
jal d
jal e
jal f
add $s7,$s7,$t8
sw $s7,0x10($t5)
li $t6,3
sw $t6,0x08($t5)
jr $k0

Exception:
jr $k0

ans:
li $s5,0xe00
beq $s4,$s5,case1
li $s5,0xd00
beq $s4,$s5,case2
li $s5,0xb00
beq $s4,$s5,case3
li $s6,0xf000
and $s7,$t7,$s6
srl $s7,$s7,12
move $t8,$s4
li $s4,0xe00
jr $ra
case1:
li $s6,0x000f
and $s7,$t7,$s6
move $t8,$s4
li $s4,0xd00
jr $ra
case2:
li $s6,0x00f0
and $s7,$t7,$s6
srl $s7,$s7,4
move $t8,$s4
li $s4,0xb00
jr $ra
case3:
li $s6,0x0f00
and $s7,$t7,$s6
srl $s7,$s7,8
move $t8,$s4
li $s4,0x700
jr $ra

zero:
beq $s7,$zero,zero1
jr $ra
zero1:
li $s7,0x40
jr $ra

one:
li $t9,1
beq $s7,$t9,one1
jr $ra
one1:
li $s7,0x79
jr $ra

two:
li $t9,2
beq $s7,$t9,two1
jr $ra
two1:
li $s7,0x24
jr $ra

three:
li $t9,3
beq $s7,$t9,three1
jr $ra
three1:
li $s7,0x30
jr $ra

four:
li $t9,4
beq $s7,$t9,four1
jr $ra
four1:
li $s7,0x19
jr $ra

five:
li $t9,5
beq $s7,$t9,five1
jr $ra
five1:
li $s7,0x12
jr $ra

six:
li $t9,6
beq $s7,$t9,six1
jr $ra
six1:
li $s7,0x02
jr $ra

seven:
li $t9,7
beq $s7,$t9,seven1
jr $ra
seven1:
li $s7,0x78
jr $ra

eight:
li $t9,8
beq $s7,$t9,eight1
jr $ra
eight1:
li $s7,0x00
jr $ra

nine:
li $t9,9
beq $s7,$t9,nine1
jr $ra
nine1:
li $s7,0x10
jr $ra

a:
li $t9,0xa
beq $s7,$t9,a1
jr $ra
a1:
li $s7,0x20
jr $ra

b:
li $t9,0xb
beq $s7,$t9,b1
jr $ra
b1:
li $s7,0x03
jr $ra

c:
li $t9,0xc
beq $s7,$t9,c1
jr $ra
c1:
li $s7,0x46
jr $ra

d:
li $t9,0xd
beq $s7,$t9,d1
jr $ra
d1:
li $s7,0x21
jr $ra

e:
li $t9,0xe
beq $s7,$t9,e1
jr $ra
e1:
li $s7,0x06
jr $ra

f:
li $t9,0xf
beq $s7,$t9,f1
jr $ra
f1:
li $s7,0x0e
jr $ra