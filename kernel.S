.syntax unified
.cpu cortex-m4
.thumb
#define A #224
#define B #46
#define C #4
// Global memory locations.
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
	.word __stack_start
	.word __kernel_reset__+1
	.size vtable_kernel, .-vtable_kernel
.section .rodata
	data: .asciz "kernel started!\n"
	final: .asciz "Value in register #3: "
.section .text
__kernel_reset__:
	ldr r0, =data
	bl dbgput_line
	// calculate
	
	mov r0, A 
	mov r1, B
    and r0, r1 //Step I: A + B
    ror r0, r0, #1	
	mov r1, C // Step III: C!
	mov r5, #1
	bl r1_factorial_result_to_r5

	add r0, r5 // Step IV: Half + Fact
	
	
	// mov r0, A
	mov r1, #0
	cmp r0, r1
	ITE GE
	movGE r3, r0
	movLT r2, r0
	

 	MOV r1, r3
 	ROR r1, r1, #2
 	MOV r3, r1
 	 
 	
	mov r0, r3	

	ldr r0, =final
	bl dbgput
	
	
	
	mov r0, r3
	
	bl dbgput_num
	
	end:
	b end
	
	
	
r1_factorial_result_to_r5:
    cmp r1, #1
    ITT GT
    mulGT r5, r1
    subGT r1, #1
	bgt r1_factorial_result_to_r5
	bx lr
