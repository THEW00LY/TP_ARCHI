	.file	"base.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"address_first: %lu offset: %d \n"
	.align 8
.LC1:
	.string	"address_second: %lu offset: %d \n"
	.text
	.globl	db_init
	.type	db_init, @function
db_init:
.LFB51:
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
	mov	rbx, rdi
	mov	r13d, esi
	mov	edi, 16
	call	malloc@PLT
	mov	r12, rax
	mov	DWORD PTR 8[rax], r13d
	movsx	rdi, r13d
	add	rdi, 1
	sal	rdi, 5
	call	malloc@PLT
	and	rax, -32
	lea	rbp, 32[rax]
	mov	QWORD PTR [r12], rbp
	test	r13d, r13d
	jle	.L2
	lea	edx, -1[r13]
	sal	rdx, 5
	lea	rsi, 64[rax+rdx]
	mov	rdx, rbp
	sub	rbx, rax
	mov	rcx, rbx
.L3:
	movdqu	xmm0, XMMWORD PTR -32[rcx+rdx]
	movaps	XMMWORD PTR [rdx], xmm0
	movdqu	xmm1, XMMWORD PTR -16[rcx+rdx]
	movaps	XMMWORD PTR 16[rdx], xmm1
	add	rdx, 32
	cmp	rdx, rsi
	jne	.L3
.L2:
	mov	ecx, ebp
	and	ecx, 63
	mov	rdx, rbp
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rcx, 32[rbp]
	and	ecx, 63
	mov	rdx, rbp
	lea	rsi, .LC1[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
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
.LFE51:
	.size	db_init, .-db_init
	.globl	db_get
	.type	db_get, @function
db_get:
.LFB52:
	.cfi_startproc
	endbr64
	mov	rax, rdi
	sal	rdx, 5
	add	rdx, QWORD PTR [rsi]
	movdqu	xmm0, XMMWORD PTR [rdx]
	movups	XMMWORD PTR [rdi], xmm0
	movdqu	xmm1, XMMWORD PTR 16[rdx]
	movups	XMMWORD PTR 16[rdi], xmm1
	ret
	.cfi_endproc
.LFE52:
	.size	db_get, .-db_get
	.globl	db_count_male
	.type	db_count_male, @function
db_count_male:
.LFB53:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR [rdi]
	mov	edx, DWORD PTR 8[rdi]
	test	edx, edx
	jle	.L11
	lea	rax, 16[rcx]
	lea	edx, -1[rdx]
	sal	rdx, 5
	lea	rsi, 48[rcx+rdx]
	mov	edx, 0
.L10:
	cmp	BYTE PTR [rax], 1
	sete	cl
	movzx	ecx, cl
	add	edx, ecx
	add	rax, 32
	cmp	rax, rsi
	jne	.L10
.L7:
	mov	eax, edx
	ret
.L11:
	mov	edx, 0
	jmp	.L7
	.cfi_endproc
.LFE53:
	.size	db_count_male, .-db_count_male
	.globl	db_free
	.type	db_free, @function
db_free:
.LFB54:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	mov	rdi, QWORD PTR [rdi]
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE54:
	.size	db_free, .-db_free
	.globl	db_max_age
	.type	db_max_age, @function
db_max_age:
.LFB55:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR [rdi]
	mov	edx, DWORD PTR 8[rdi]
	test	edx, edx
	jle	.L18
	lea	rax, 20[rcx]
	lea	edx, -1[rdx]
	sal	rdx, 5
	lea	rsi, 52[rcx+rdx]
	mov	edx, 0
.L17:
	mov	ecx, DWORD PTR [rax]
	cmp	edx, ecx
	cmovb	edx, ecx
	add	rax, 32
	cmp	rax, rsi
	jne	.L17
.L15:
	mov	eax, edx
	ret
.L18:
	mov	edx, 0
	jmp	.L15
	.cfi_endproc
.LFE55:
	.size	db_max_age, .-db_max_age
	.globl	db_oldest
	.type	db_oldest, @function
db_oldest:
.LFB56:
	.cfi_startproc
	endbr64
	mov	r8, QWORD PTR [rdi]
	mov	esi, DWORD PTR 8[rdi]
	test	esi, esi
	jle	.L24
	mov	esi, esi
	mov	eax, 0
	mov	rdi, -1
	mov	ecx, 0
	jmp	.L23
.L22:
	add	rax, 1
	cmp	rax, rsi
	je	.L20
.L23:
	mov	rdx, rax
	sal	rdx, 5
	mov	edx, DWORD PTR 20[r8+rdx]
	cmp	edx, ecx
	jb	.L22
	mov	rdi, rax
	mov	ecx, edx
	jmp	.L22
.L24:
	mov	rdi, -1
.L20:
	mov	rax, rdi
	ret
	.cfi_endproc
.LFE56:
	.size	db_oldest, .-db_oldest
	.globl	db_closest
	.type	db_closest, @function
db_closest:
.LFB57:
	.cfi_startproc
	endbr64
	movss	xmm4, DWORD PTR .LC2[rip]
	divss	xmm4, DWORD PTR .LC3[rip]
	mov	esi, DWORD PTR 8[rdi]
	test	esi, esi
	jle	.L31
	mov	rdx, QWORD PTR [rdi]
	add	rdx, 24
	mov	ecx, 0
	mov	eax, -1
.L30:
	movaps	xmm2, xmm0
	subss	xmm2, DWORD PTR [rdx]
	movaps	xmm3, xmm1
	subss	xmm3, DWORD PTR 4[rdx]
	mulss	xmm2, xmm2
	mulss	xmm3, xmm3
	addss	xmm2, xmm3
	comiss	xmm4, xmm2
	cmova	eax, ecx
	minss	xmm2, xmm4
	movaps	xmm4, xmm2
	add	ecx, 1
	add	rdx, 32
	cmp	esi, ecx
	jne	.L30
.L27:
	cdqe
	ret
.L31:
	mov	eax, -1
	jmp	.L27
	.cfi_endproc
.LFE57:
	.size	db_closest, .-db_closest
	.globl	db_count_female_muggles
	.type	db_count_female_muggles, @function
db_count_female_muggles:
.LFB58:
	.cfi_startproc
	endbr64
	mov	edx, DWORD PTR 8[rdi]
	mov	rcx, QWORD PTR [rdi]
	test	edx, edx
	jle	.L38
	lea	rax, 16[rcx]
	lea	edx, -1[rdx]
	sal	rdx, 5
	lea	rcx, 48[rcx+rdx]
	mov	edx, 0
	jmp	.L37
.L36:
	add	rax, 32
	cmp	rax, rcx
	je	.L34
.L37:
	cmp	BYTE PTR 1[rax], 1
	je	.L36
	cmp	BYTE PTR [rax], 1
	adc	edx, 0
	jmp	.L36
.L38:
	mov	edx, 0
.L34:
	mov	eax, edx
	ret
	.cfi_endproc
.LFE58:
	.size	db_count_female_muggles, .-db_count_female_muggles
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	0
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
