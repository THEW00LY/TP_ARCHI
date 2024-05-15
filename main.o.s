	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	FLA_Clock
	.type	FLA_Clock, @function
FLA_Clock:
.LFB51:
	.cfi_startproc
	endbr64
	sub	rsp, 40
	.cfi_def_cfa_offset 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	mov	rsi, rsp
	mov	edi, 1
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR gtod_ref_time_sec[rip]
	jp	.L2
	jne	.L2
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR [rsp]
	movsd	QWORD PTR gtod_ref_time_sec[rip], xmm0
.L2:
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR [rsp]
	subsd	xmm0, QWORD PTR gtod_ref_time_sec[rip]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, QWORD PTR 8[rsp]
	mulsd	xmm1, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L7
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	FLA_Clock, .-FLA_Clock
	.globl	generate_random_persons
	.type	generate_random_persons, @function
generate_random_persons:
.LFB52:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	mov	ebp, edi
	movsx	rdi, edi
	sal	rdi, 5
	call	malloc@PLT
	mov	r12, rax
	mov	edi, 0
	call	srand@PLT
	lea	rbx, rands[rip]
	lea	r13, 536870912[rbx]
.L9:
	call	rand@PLT
	mov	DWORD PTR [rbx], eax
	add	rbx, 4
	cmp	rbx, r13
	jne	.L9
	test	ebp, ebp
	jle	.L8
	mov	rcx, r12
	mov	edi, 0
	lea	r10, rands[rip]
	lea	r9, first_names[rip]
	lea	r8, last_names[rip]
.L11:
	mov	edx, edi
	sar	edx, 31
	shr	edx, 5
	lea	eax, [rdi+rdx]
	and	eax, 134217727
	sub	eax, edx
	cdqe
	mov	edx, DWORD PTR [r10+rax*4]
	mov	esi, edx
	sar	esi, 31
	mov	r11d, esi
	shr	r11d, 30
	lea	eax, [rdx+r11]
	and	eax, 3
	sub	eax, r11d
	cdqe
	sal	rax, 4
	add	rax, r9
	mov	QWORD PTR [rcx], rax
	mov	eax, edx
	sar	eax, 10
	add	eax, r11d
	and	eax, 3
	sub	eax, r11d
	cdqe
	sal	rax, 4
	add	rax, r8
	mov	QWORD PTR 8[rcx], rax
	mov	eax, edx
	sar	eax, 20
	and	eax, 1
	mov	BYTE PTR 16[rcx], al
	test	dl, 7
	sete	BYTE PTR 17[rcx]
	mov	r11d, esi
	shr	r11d, 25
	lea	eax, [rdx+r11]
	and	eax, 127
	sub	eax, r11d
	mov	DWORD PTR 20[rcx], eax
	shr	esi, 22
	lea	eax, [rdx+rsi]
	and	eax, 1023
	sub	eax, esi
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	DWORD PTR 24[rcx], xmm0
	lea	eax, 1023[rdx]
	test	edx, edx
	cmovns	eax, edx
	mov	edx, eax
	sar	edx, 10
	sar	eax, 31
	shr	eax, 22
	add	edx, eax
	and	edx, 1023
	sub	edx, eax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, edx
	movss	DWORD PTR 28[rcx], xmm0
	add	edi, 1
	add	rcx, 32
	cmp	ebp, edi
	jne	.L11
.L8:
	mov	rax, r12
	add	rsp, 8
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	generate_random_persons, .-generate_random_persons
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"N = %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Common, ask for something bigger please..."
	.section	.rodata.str1.1
.LC4:
	.string	"Num elements: %lu\n"
.LC5:
	.string	"Size of Person: %lu bytes\n"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"More that 4GB requested... be reasonable please."
	.section	.rodata.str1.1
.LC7:
	.string	"Total data size: %lu Mo\n"
.LC8:
	.string	"Total data size: %lu Ko\n"
.LC13:
	.string	"sequential_lookups"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"%-30s: %10.4lf ms\t %6.2lf ns / op\n"
	.section	.rodata.str1.1
.LC15:
	.string	"random_lookups"
.LC16:
	.string	"count_male"
.LC17:
	.string	"max_age"
.LC18:
	.string	"oldest"
.LC19:
	.string	"closest"
.LC20:
	.string	"female_muggles"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Results of queries: (count_male: %d) (max-age: %d) (oldest: %ld) (closest: %ld) (female-muggles: %d)\n"
	.section	.rodata.str1.1
.LC22:
	.string	"Execution successful"
	.text
	.globl	main
	.type	main, @function
main:
.LFB53:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 88
	.cfi_def_cfa_offset 144
	mov	rdx, QWORD PTR fs:40
	mov	QWORD PTR 72[rsp], rdx
	xor	edx, edx
	cmp	edi, 1
	jg	.L52
	mov	edx, 24
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 16777216
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	lea	rsi, .LC5[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	QWORD PTR 16[rsp], 16777216
	mov	eax, 536870912
.L45:
	shr	rax, 20
	mov	rdx, rax
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.L21:
	mov	ebp, DWORD PTR 16[rsp]
	mov	edi, ebp
	call	generate_random_persons
	mov	rbx, rax
	mov	esi, ebp
	mov	rdi, rax
	call	db_init@PLT
	mov	rbp, rax
	mov	rdi, rbx
	call	free@PLT
	mov	r13d, 0
	pxor	xmm4, xmm4
	movsd	QWORD PTR [rsp], xmm4
	jmp	.L24
.L52:
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	rbx, rax
	mov	edx, eax
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	eax, 1
	mov	ecx, ebx
	sal	rax, cl
	mov	QWORD PTR 16[rsp], rax
	cmp	rax, 63
	ja	.L17
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L15
.L17:
	mov	rdx, QWORD PTR 16[rsp]
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 32
	lea	rsi, .LC5[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	eax, 32
	mov	ecx, ebx
	sal	rax, cl
	movabs	rdx, 4294967296
	cmp	rax, rdx
	ja	.L53
	cmp	rax, 1048576
	ja	.L45
	shr	rax, 10
	mov	rdx, rax
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L21
.L53:
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L15
.L23:
	add	r13d, 1
	cmp	r13d, 10
	je	.L54
.L24:
	mov	eax, 0
	call	FLA_Clock
	movq	r14, xmm0
	mov	ebx, 0
	mov	rax, QWORD PTR 16[rsp]
	lea	r12, -1[rax]
.L22:
	lea	rdi, 32[rsp]
	mov	rdx, r12
	and	rdx, rbx
	mov	rsi, rbp
	call	db_get@PLT
	add	rbx, 1
	cmp	rbx, 10485760
	jne	.L22
	mov	eax, 0
	call	FLA_Clock
	cmp	r13d, 2
	jle	.L23
	movq	xmm7, r14
	subsd	xmm0, xmm7
	divsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR [rsp]
	movsd	QWORD PTR [rsp], xmm0
	jmp	.L23
.L54:
	movsd	xmm2, QWORD PTR [rsp]
	movapd	xmm1, xmm2
	divsd	xmm1, QWORD PTR .LC10[rip]
	mulsd	xmm2, QWORD PTR .LC12[rip]
	movapd	xmm0, xmm2
	mulsd	xmm1, QWORD PTR .LC11[rip]
	lea	rdx, .LC13[rip]
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	r15d, 0
	pxor	xmm5, xmm5
	movsd	QWORD PTR 8[rsp], xmm5
	jmp	.L27
.L26:
	add	r15d, 1
	cmp	r15d, 10
	je	.L55
.L27:
	mov	eax, 0
	call	FLA_Clock
	movsd	QWORD PTR [rsp], xmm0
	lea	rbx, rands[rip]
	lea	r14, 41943040[rbx]
	lea	r13, 32[rsp]
.L25:
	movsx	rdx, DWORD PTR [rbx]
	and	rdx, r12
	mov	rsi, rbp
	mov	rdi, r13
	call	db_get@PLT
	add	rbx, 4
	cmp	rbx, r14
	jne	.L25
	mov	eax, 0
	call	FLA_Clock
	cmp	r15d, 2
	jle	.L26
	subsd	xmm0, QWORD PTR [rsp]
	divsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR 8[rsp]
	movsd	QWORD PTR 8[rsp], xmm0
	jmp	.L26
.L55:
	movsd	xmm3, QWORD PTR 8[rsp]
	movapd	xmm1, xmm3
	divsd	xmm1, QWORD PTR .LC10[rip]
	mulsd	xmm3, QWORD PTR .LC12[rip]
	movapd	xmm0, xmm3
	mulsd	xmm1, QWORD PTR .LC11[rip]
	lea	rdx, .LC15[rip]
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	eax, 0
	call	FLA_Clock
	mov	rdi, rbp
	call	db_count_male@PLT
	mov	DWORD PTR 28[rsp], eax
	mov	eax, 0
	call	FLA_Clock
	mov	ebx, 0
	pxor	xmm6, xmm6
	movsd	QWORD PTR [rsp], xmm6
.L28:
	add	ebx, 1
	cmp	ebx, 10
	je	.L56
	mov	eax, 0
	call	FLA_Clock
	movq	r12, xmm0
	mov	rdi, rbp
	call	db_count_male@PLT
	mov	DWORD PTR 28[rsp], eax
	mov	eax, 0
	call	FLA_Clock
	movq	xmm2, r12
	subsd	xmm0, xmm2
	cmp	ebx, 2
	jle	.L28
	divsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR [rsp]
	movsd	QWORD PTR [rsp], xmm0
	jmp	.L28
.L56:
	mov	rax, QWORD PTR 16[rsp]
	test	rax, rax
	js	.L31
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, rax
	movsd	QWORD PTR 16[rsp], xmm4
.L32:
	movsd	xmm4, QWORD PTR [rsp]
	movapd	xmm1, xmm4
	divsd	xmm1, QWORD PTR 16[rsp]
	mulsd	xmm4, QWORD PTR .LC12[rip]
	movapd	xmm0, xmm4
	mulsd	xmm1, QWORD PTR .LC11[rip]
	lea	rdx, .LC16[rip]
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	eax, 0
	call	FLA_Clock
	mov	rdi, rbp
	call	db_max_age@PLT
	mov	r12d, eax
	mov	eax, 0
	call	FLA_Clock
	mov	ebx, 0
	pxor	xmm6, xmm6
	movsd	QWORD PTR [rsp], xmm6
.L33:
	add	ebx, 1
	cmp	ebx, 10
	je	.L57
	mov	eax, 0
	call	FLA_Clock
	movq	r13, xmm0
	mov	rdi, rbp
	call	db_max_age@PLT
	mov	r12d, eax
	mov	eax, 0
	call	FLA_Clock
	movq	xmm3, r13
	subsd	xmm0, xmm3
	cmp	ebx, 2
	jle	.L33
	divsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR [rsp]
	movsd	QWORD PTR [rsp], xmm0
	jmp	.L33
.L31:
	mov	rcx, QWORD PTR 16[rsp]
	mov	rax, rcx
	shr	rax
	and	ecx, 1
	or	rax, rcx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	addsd	xmm0, xmm0
	movsd	QWORD PTR 16[rsp], xmm0
	jmp	.L32
.L57:
	movsd	xmm5, QWORD PTR [rsp]
	movapd	xmm1, xmm5
	divsd	xmm1, QWORD PTR 16[rsp]
	mulsd	xmm5, QWORD PTR .LC12[rip]
	movapd	xmm0, xmm5
	mulsd	xmm1, QWORD PTR .LC11[rip]
	lea	rdx, .LC17[rip]
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	eax, 0
	call	FLA_Clock
	mov	rdi, rbp
	call	db_oldest@PLT
	mov	r13, rax
	mov	eax, 0
	call	FLA_Clock
	mov	ebx, 0
	pxor	xmm5, xmm5
	movsd	QWORD PTR [rsp], xmm5
.L36:
	add	ebx, 1
	cmp	ebx, 10
	je	.L58
	mov	eax, 0
	call	FLA_Clock
	movq	r14, xmm0
	mov	rdi, rbp
	call	db_oldest@PLT
	mov	r13, rax
	mov	eax, 0
	call	FLA_Clock
	movq	xmm4, r14
	subsd	xmm0, xmm4
	cmp	ebx, 2
	jle	.L36
	divsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR [rsp]
	movsd	QWORD PTR [rsp], xmm0
	jmp	.L36
.L58:
	movsd	xmm6, QWORD PTR [rsp]
	movapd	xmm1, xmm6
	divsd	xmm1, QWORD PTR 16[rsp]
	mulsd	xmm6, QWORD PTR .LC12[rip]
	movapd	xmm0, xmm6
	mulsd	xmm1, QWORD PTR .LC11[rip]
	lea	rdx, .LC18[rip]
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	eax, 0
	call	FLA_Clock
	call	rand@PLT
	mov	ebx, eax
	call	rand@PLT
	mov	esi, eax
	mov	ecx, 1024
	mov	eax, ebx
	cdq
	idiv	ecx
	mov	edi, edx
	mov	eax, esi
	cdq
	idiv	ecx
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, edx
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, edi
	mov	rdi, rbp
	call	db_closest@PLT
	mov	r14, rax
	mov	eax, 0
	call	FLA_Clock
	mov	ebx, 0
	pxor	xmm6, xmm6
	movsd	QWORD PTR [rsp], xmm6
.L39:
	add	ebx, 1
	cmp	ebx, 10
	je	.L59
	mov	eax, 0
	call	FLA_Clock
	movq	r15, xmm0
	call	rand@PLT
	mov	r14d, eax
	call	rand@PLT
	mov	edx, r14d
	sar	edx, 31
	shr	edx, 22
	add	r14d, edx
	and	r14d, 1023
	sub	r14d, edx
	cdq
	shr	edx, 22
	add	eax, edx
	and	eax, 1023
	sub	eax, edx
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, r14d
	mov	rdi, rbp
	call	db_closest@PLT
	mov	r14, rax
	mov	eax, 0
	call	FLA_Clock
	movq	xmm5, r15
	subsd	xmm0, xmm5
	cmp	ebx, 2
	jle	.L39
	divsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR [rsp]
	movsd	QWORD PTR [rsp], xmm0
	jmp	.L39
.L59:
	movsd	xmm2, QWORD PTR [rsp]
	movapd	xmm1, xmm2
	divsd	xmm1, QWORD PTR 16[rsp]
	mulsd	xmm2, QWORD PTR .LC12[rip]
	movapd	xmm0, xmm2
	mulsd	xmm1, QWORD PTR .LC11[rip]
	lea	rdx, .LC19[rip]
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	mov	eax, 0
	call	FLA_Clock
	mov	rdi, rbp
	call	db_count_female_muggles@PLT
	mov	r15d, eax
	mov	eax, 0
	call	FLA_Clock
	mov	ebx, 0
	pxor	xmm2, xmm2
	movsd	QWORD PTR 8[rsp], xmm2
.L42:
	add	ebx, 1
	cmp	ebx, 10
	je	.L60
	mov	eax, 0
	call	FLA_Clock
	movsd	QWORD PTR [rsp], xmm0
	mov	rdi, rbp
	call	db_count_female_muggles@PLT
	mov	r15d, eax
	mov	eax, 0
	call	FLA_Clock
	subsd	xmm0, QWORD PTR [rsp]
	cmp	ebx, 2
	jle	.L42
	divsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, QWORD PTR 8[rsp]
	movsd	QWORD PTR 8[rsp], xmm0
	jmp	.L42
.L60:
	movsd	xmm3, QWORD PTR 8[rsp]
	movapd	xmm1, xmm3
	divsd	xmm1, QWORD PTR 16[rsp]
	mulsd	xmm3, QWORD PTR .LC12[rip]
	movapd	xmm0, xmm3
	mulsd	xmm1, QWORD PTR .LC11[rip]
	lea	rdx, .LC20[rip]
	lea	rsi, .LC14[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	sub	rsp, 8
	.cfi_def_cfa_offset 152
	push	r15
	.cfi_def_cfa_offset 160
	mov	r9, r14
	mov	r8, r13
	mov	ecx, r12d
	mov	edx, DWORD PTR 44[rsp]
	lea	rsi, .LC21[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rdi, .LC22[rip]
	call	puts@PLT
	add	rsp, 16
	.cfi_def_cfa_offset 144
	mov	eax, 0
.L15:
	mov	rdx, QWORD PTR 72[rsp]
	sub	rdx, QWORD PTR fs:40
	jne	.L61
	add	rsp, 88
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L61:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
	.size	main, .-main
	.globl	rands
	.bss
	.align 32
	.type	rands, @object
	.size	rands, 536870912
rands:
	.zero	536870912
	.globl	last_names
	.data
	.align 32
	.type	last_names, @object
	.size	last_names, 64
last_names:
	.string	"Bombadil"
	.zero	7
	.string	"Potter"
	.zero	9
	.string	"Jedusor"
	.zero	8
	.string	"Dumbledore"
	.zero	5
	.globl	first_names
	.align 32
	.type	first_names, @object
	.size	first_names, 64
first_names:
	.string	"Tom"
	.zero	12
	.string	"Arthur"
	.zero	9
	.string	"Harry"
	.zero	10
	.string	"Felix"
	.zero	10
	.globl	gtod_ref_time_sec
	.bss
	.align 8
	.type	gtod_ref_time_sec, @object
	.size	gtod_ref_time_sec, 8
gtod_ref_time_sec:
	.zero	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-400107883
	.long	1041313291
	.align 8
.LC9:
	.long	0
	.long	1075576832
	.align 8
.LC10:
	.long	0
	.long	1097072640
	.align 8
.LC11:
	.long	536870912
	.long	1107468383
	.align 8
.LC12:
	.long	0
	.long	1083129856
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
