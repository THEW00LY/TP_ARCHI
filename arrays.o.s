	.file	"arrays.c"
	.intel_syntax noprefix
	.text
	.globl	malloc_aligned
	.type	malloc_aligned, @function
malloc_aligned:
.LFB51:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	and	rdi, -32
	lea	rsi, 32[rdi]
	mov	edi, 32
	call	aligned_alloc@PLT
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	malloc_aligned, .-malloc_aligned
	.globl	db_init
	.type	db_init, @function
db_init:
.LFB52:
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
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	QWORD PTR 24[rsp], rdi
	mov	ebx, esi
	mov	edi, 64
	call	malloc@PLT
	mov	r15, rax
	mov	DWORD PTR 20[rsp], ebx
	movsx	r14, ebx
	lea	rbp, 0[0+r14*8]
	mov	rdi, rbp
	call	malloc_aligned
	mov	rbx, rax
	mov	QWORD PTR [r15], rax
	mov	rdi, rbp
	call	malloc_aligned
	mov	rbp, rax
	mov	QWORD PTR 8[r15], rax
	lea	rax, 0[0+r14*4]
	mov	QWORD PTR 8[rsp], rax
	mov	rdi, rax
	call	malloc_aligned
	mov	r12, rax
	mov	QWORD PTR 16[r15], rax
	mov	rdi, r14
	call	malloc_aligned
	mov	r13, rax
	mov	QWORD PTR 24[r15], rax
	mov	rdi, r14
	call	malloc_aligned
	mov	r14, rax
	mov	QWORD PTR [rsp], r15
	mov	QWORD PTR 32[r15], rax
	mov	rdi, QWORD PTR 8[rsp]
	call	malloc_aligned
	mov	r15, rax
	mov	rdx, QWORD PTR [rsp]
	mov	QWORD PTR 40[rdx], rax
	mov	rdi, QWORD PTR 8[rsp]
	call	malloc_aligned
	mov	rdx, QWORD PTR [rsp]
	mov	QWORD PTR 48[rdx], rax
	mov	esi, DWORD PTR 20[rsp]
	mov	DWORD PTR 56[rdx], esi
	test	esi, esi
	jle	.L3
	mov	rcx, QWORD PTR 24[rsp]
	mov	edi, esi
	mov	edx, 0
.L5:
	mov	rsi, QWORD PTR [rcx]
	mov	QWORD PTR [rbx+rdx*8], rsi
	mov	rsi, QWORD PTR 8[rcx]
	mov	QWORD PTR 0[rbp+rdx*8], rsi
	mov	esi, DWORD PTR 20[rcx]
	mov	DWORD PTR [r12+rdx*4], esi
	movzx	esi, BYTE PTR 16[rcx]
	mov	BYTE PTR 0[r13+rdx], sil
	movzx	esi, BYTE PTR 17[rcx]
	mov	BYTE PTR [r14+rdx], sil
	movss	xmm0, DWORD PTR 24[rcx]
	movss	DWORD PTR [r15+rdx*4], xmm0
	movss	xmm0, DWORD PTR 28[rcx]
	movss	DWORD PTR [rax+rdx*4], xmm0
	add	rdx, 1
	add	rcx, 32
	cmp	rdx, rdi
	jne	.L5
.L3:
	mov	rax, QWORD PTR [rsp]
	add	rsp, 40
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
	.cfi_endproc
.LFE52:
	.size	db_init, .-db_init
	.globl	db_free
	.type	db_free, @function
db_free:
.LFB53:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	mov	rdi, QWORD PTR [rdi]
	call	free@PLT
	mov	rdi, QWORD PTR 8[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 16[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 24[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 32[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 40[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 48[rbx]
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.size	db_free, .-db_free
	.globl	db_get
	.type	db_get, @function
db_get:
.LFB54:
	.cfi_startproc
	endbr64
	mov	rax, rdi
	mov	rcx, rsi
	mov	rsi, QWORD PTR 8[rsi]
	mov	r9, QWORD PTR [rsi+rdx*8]
	mov	rsi, QWORD PTR 24[rcx]
	movzx	r8d, BYTE PTR [rsi+rdx]
	mov	rsi, QWORD PTR 32[rcx]
	movzx	edi, BYTE PTR [rsi+rdx]
	mov	rsi, QWORD PTR 16[rcx]
	mov	esi, DWORD PTR [rsi+rdx*4]
	mov	r10, QWORD PTR 40[rcx]
	movss	xmm1, DWORD PTR [r10+rdx*4]
	mov	r10, QWORD PTR 48[rcx]
	movss	xmm0, DWORD PTR [r10+rdx*4]
	mov	rcx, QWORD PTR [rcx]
	mov	rdx, QWORD PTR [rcx+rdx*8]
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR 8[rax], r9
	mov	BYTE PTR 16[rax], r8b
	mov	BYTE PTR 17[rax], dil
	mov	DWORD PTR 20[rax], esi
	movss	DWORD PTR 24[rax], xmm1
	movss	DWORD PTR 28[rax], xmm0
	ret
	.cfi_endproc
.LFE54:
	.size	db_get, .-db_get
	.globl	db_count_male
	.type	db_count_male, @function
db_count_male:
.LFB55:
	.cfi_startproc
	endbr64
	mov	eax, -1
	ret
	.cfi_endproc
.LFE55:
	.size	db_count_male, .-db_count_male
	.globl	db_max_age
	.type	db_max_age, @function
db_max_age:
.LFB56:
	.cfi_startproc
	endbr64
	mov	eax, 0
	ret
	.cfi_endproc
.LFE56:
	.size	db_max_age, .-db_max_age
	.globl	db_oldest
	.type	db_oldest, @function
db_oldest:
.LFB57:
	.cfi_startproc
	endbr64
	mov	rax, -1
	ret
	.cfi_endproc
.LFE57:
	.size	db_oldest, .-db_oldest
	.globl	db_closest
	.type	db_closest, @function
db_closest:
.LFB58:
	.cfi_startproc
	endbr64
	mov	rax, -1
	ret
	.cfi_endproc
.LFE58:
	.size	db_closest, .-db_closest
	.globl	db_count_female_muggles
	.type	db_count_female_muggles, @function
db_count_female_muggles:
.LFB59:
	.cfi_startproc
	endbr64
	mov	eax, 0
	ret
	.cfi_endproc
.LFE59:
	.size	db_count_female_muggles, .-db_count_female_muggles
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
