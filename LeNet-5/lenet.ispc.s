	.text
	.def	 @feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"lenet.ispc"
	.def	 __do_print;
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90                         # -- Begin function __do_print
__do_print:                             # @__do_print
.seh_proc __do_print
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	movl	$8304, %eax                     # imm = 0x2070
	callq	__chkstk
	subq	%rax, %rsp
	.seh_stackalloc 8304
	.seh_endprologue
	movq	$0, 72(%rsp)
	movq	%r8, 64(%rsp)
	movl	$16, 44(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	64(%rsp), %r9
	movl	44(%rsp), %r8d
	movq	72(%rsp), %rdx
	leaq	80(%rsp), %rcx
	callq	"??0ArgWriter@@QEAA@PEBQEBXH_K@Z"
	movq	56(%rsp), %r8
	movq	48(%rsp), %rdx
	leaq	104(%rsp), %rcx
	leaq	80(%rsp), %r9
	callq	"??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z"
	movl	$1, %ecx
	callq	__acrt_iob_func
	movq	%rax, %rsi
	leaq	104(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movq	%rsi, %rdx
	callq	fputs
	movl	$1, %ecx
	callq	__acrt_iob_func
	movq	%rax, %rcx
	callq	fflush
	nop
	addq	$8304, %rsp                     # imm = 0x2070
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??0ArgWriter@@QEAA@PEBQEBXH_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0ArgWriter@@QEAA@PEBQEBXH_K@Z"
	.globl	"??0ArgWriter@@QEAA@PEBQEBXH_K@Z" # -- Begin function ??0ArgWriter@@QEAA@PEBQEBXH_K@Z
	.p2align	4, 0x90
"??0ArgWriter@@QEAA@PEBQEBXH_K@Z":      # @"??0ArgWriter@@QEAA@PEBQEBXH_K@Z"
.seh_proc "??0ArgWriter@@QEAA@PEBQEBXH_K@Z"
# %bb.0:
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%r9, 24(%rsp)
	movl	%r8d, 4(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, (%rax)
	movl	$0, 8(%rax)
	movl	4(%rsp), %ecx
	movl	%ecx, 12(%rax)
	movq	24(%rsp), %rcx
	movq	%rcx, 16(%rax)
	addq	$32, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z"
	.globl	"??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z" # -- Begin function ??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z
	.p2align	4, 0x90
"??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z": # @"??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z"
.seh_proc "??$GetFormatedStr@VArgWriter@@@@YA?AU?$array@D$0CAAE@@notstd@@PEBD0AEAVArgWriter@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1120, %rsp                     # imm = 0x460
	.seh_stackalloc 1120
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rsi, 88(%rsp)
	movq	%r9, 80(%rsp)
	movq	%r8, 72(%rsp)
	movq	%rdx, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	$8195, 52(%rsp)                 # imm = 0x2003
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %r9d
	movl	56(%rsp), %r8d
	movq	64(%rsp), %rcx
	movq	%rsi, %rdx
	callq	"??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z"
	movl	%eax, 60(%rsp)
	movl	60(%rsp), %eax
	movq	64(%rsp), %rcx
	cltq
	addq	%rax, %rcx
	movq	%rcx, 64(%rsp)
	movl	60(%rsp), %eax
	addl	56(%rsp), %eax
	movl	%eax, 56(%rsp)
	movl	60(%rsp), %eax
	movl	52(%rsp), %ecx
	subl	%eax, %ecx
	movl	%ecx, 52(%rsp)
	cmpl	$0, 52(%rsp)
	je	.LBB2_3
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	64(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$0, %eax
	jne	.LBB2_4
.LBB2_3:
	jmp	.LBB2_6
.LBB2_4:                                #   in Loop: Header=BB2_1 Depth=1
	movq	80(%rsp), %r8
	movq	72(%rsp), %rax
	movb	(%rax), %dl
	leaq	96(%rsp), %rcx
	callq	"??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z"
	movl	52(%rsp), %eax
	movl	56(%rsp), %r9d
	leaq	96(%rsp), %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	movl	%eax, 32(%rsp)
	callq	"??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z"
	movl	%eax, 60(%rsp)
	movl	60(%rsp), %eax
	addl	56(%rsp), %eax
	movl	%eax, 56(%rsp)
	movl	60(%rsp), %eax
	movl	52(%rsp), %ecx
	subl	%eax, %ecx
	movl	%ecx, 52(%rsp)
# %bb.5:                                #   in Loop: Header=BB2_1 Depth=1
	movq	64(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 64(%rsp)
	movq	72(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 72(%rsp)
	jmp	.LBB2_1
.LBB2_6:
	movl	56(%rsp), %edx
	movq	%rsi, %rcx
	callq	"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	movq	%rsi, %rax
	addq	$1120, %rsp                     # imm = 0x460
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z"
	.globl	"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z" # -- Begin function ??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z
	.p2align	4, 0x90
"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z": # @"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z"
.seh_proc "??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movl	%edx, 4(%rsp)
	movq	%rcx, 8(%rsp)
	movq	8(%rsp), %rax
	movslq	4(%rsp), %rcx
	addq	%rcx, %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z"
	.globl	"??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z" # -- Begin function ??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z
	.p2align	4, 0x90
"??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z": # @"??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z"
.seh_proc "??$CopyPlainText@$0CAAE@@@YAHQEBDAEAU?$array@D$0CAAE@@notstd@@HH@Z"
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	%r9d, 52(%rsp)
	movl	%r8d, 48(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rcx, 56(%rsp)
	movl	52(%rsp), %eax
	movl	48(%rsp), %r9d
	movq	64(%rsp), %r8
	movq	56(%rsp), %rcx
	xorl	%edx, %edx
	movl	%eax, 32(%rsp)
	callq	"??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z"
	nop
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z"
	.globl	"??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z" # -- Begin function ??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z
	.p2align	4, 0x90
"??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z": # @"??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z"
.seh_proc "??$Arg2Str@VArgWriter@@@details@@YA?AU?$array@D$0EAA@@notstd@@DAEAVArgWriter@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$64, %rsp
	.seh_stackalloc 64
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%r8, 48(%rsp)
	movb	%dl, 47(%rsp)
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	testb	$1, %al
	jne	.LBB5_8
# %bb.1:
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	testb	$1, %al
	jne	.LBB5_8
# %bb.2:
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	testb	$1, %al
	jne	.LBB5_8
# %bb.3:
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	testb	$1, %al
	jne	.LBB5_8
# %bb.4:
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	testb	$1, %al
	jne	.LBB5_8
# %bb.5:
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	testb	$1, %al
	jne	.LBB5_8
# %bb.6:
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	testb	$1, %al
	jne	.LBB5_8
# %bb.7:
	movq	48(%rsp), %rdx
	movb	47(%rsp), %cl
	movq	%rsi, %r8
	callq	"??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB5_8:
	movq	%rsi, %rax
	addq	$64, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z"
	.globl	"??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z" # -- Begin function ??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z
	.p2align	4, 0x90
"??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z": # @"??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z"
.seh_proc "??$CopyFullText@$0EAA@$0CAAE@@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@1@HH@Z"
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	112(%rsp), %eax
	movl	%r9d, 52(%rsp)
	movq	%r8, 64(%rsp)
	movl	%edx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movl	112(%rsp), %eax
	movl	52(%rsp), %r9d
	movq	64(%rsp), %r8
	movl	48(%rsp), %edx
	movq	56(%rsp), %rcx
	movl	%eax, 32(%rsp)
	callq	"??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z"
	nop
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z"
	.globl	"??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z" # -- Begin function ??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z
	.p2align	4, 0x90
"??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z": # @"??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z"
.seh_proc "??$CopyTillSep@$0A@$0EAA@$0CAAE@@details@@YAHAEAU?$array@D$0EAA@@notstd@@HAEAU?$array@D$0CAAE@@2@HH@Z"
# %bb.0:
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$64, %rsp
	.seh_stackalloc 64
	.seh_endprologue
	movl	112(%rsp), %eax
	movl	%r9d, 36(%rsp)
	movq	%r8, 56(%rsp)
	movl	%edx, 40(%rsp)
	movq	%rcx, 48(%rsp)
	movl	36(%rsp), %eax
	movl	%eax, 44(%rsp)
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
	movq	48(%rsp), %rcx
	movl	40(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movsbl	(%rax), %ecx
	xorl	%eax, %eax
	cmpl	$0, %ecx
	je	.LBB7_3
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	cmpl	$0, 112(%rsp)
	setne	%al
.LBB7_3:                                #   in Loop: Header=BB7_1 Depth=1
	testb	$1, %al
	jne	.LBB7_4
	jmp	.LBB7_5
.LBB7_4:                                #   in Loop: Header=BB7_1 Depth=1
	movq	48(%rsp), %rcx
	movl	40(%rsp), %edx
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, 40(%rsp)
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	(%rax), %bl
	movq	56(%rsp), %rcx
	movl	36(%rsp), %edx
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, 36(%rsp)
	callq	"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	112(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 112(%rsp)
	jmp	.LBB7_1
.LBB7_5:
	movl	36(%rsp), %eax
	subl	44(%rsp), %eax
	addq	$64, %rsp
	popq	%rbx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	.globl	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z" # -- Begin function ??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z
	.p2align	4, 0x90
"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z": # @"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
.seh_proc "??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movl	%edx, 4(%rsp)
	movq	%rcx, 8(%rsp)
	movq	8(%rsp), %rax
	movslq	4(%rsp), %rcx
	addq	%rcx, %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB9_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB9_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB10_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB10_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB11_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB11_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB12_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB12_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB13_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB13_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB14_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB14_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB15_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB15_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$Arg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movb	%cl, 39(%rsp)
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	movb	%al, %cl
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB16_2
# %bb.1:
	movq	48(%rsp), %r8
	movq	40(%rsp), %rdx
	movb	39(%rsp), %cl
	callq	"??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.LBB16_2:
	andb	$1, %al
	movzbl	%al, %eax
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB17_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB17_3
.LBB17_2:
	movb	$0, 46(%rsp)
.LBB17_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@PEAXVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB18_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB18_3
.LBB18_2:
	movb	$0, 46(%rsp)
.LBB18_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$16, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	.seh_endprologue
	movq	%rdx, %r14
	movq	%r14, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	72(%rsp), %rdi
	callq	"??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ"
	movq	%rax, 64(%rsp)
	leaq	88(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 48(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 56(%rsp)
	movl	$0, 52(%rsp)
.LBB20_1:                               # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB20_9
# %bb.2:                                #   in Loop: Header=BB20_1 Depth=1
	movq	16(%rdi), %rax
	movl	52(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB20_4
# %bb.3:                                #   in Loop: Header=BB20_1 Depth=1
	movq	56(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	52(%rsp), %rcx
	movq	(%rax,%rcx,8), %rcx
	callq	"??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z"
	movq	%rax, %rbx
	movq	64(%rsp), %rsi
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movq	%rbx, %r9
	callq	snprintf
	addl	48(%rsp), %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB20_5
.LBB20_4:                               #   in Loop: Header=BB20_1 Depth=1
	movl	52(%rsp), %eax
	movq	56(%rsp), %r9
	movl	48(%rsp), %r8d
	leaq	88(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 48(%rsp)
.LBB20_5:                               #   in Loop: Header=BB20_1 Depth=1
	movl	52(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB20_7
# %bb.6:                                #   in Loop: Header=BB20_1 Depth=1
	movb	$44, %bl
.LBB20_7:                               #   in Loop: Header=BB20_1 Depth=1
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
# %bb.8:                                #   in Loop: Header=BB20_1 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB20_1
.LBB20_9:
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	88(%rsp), %rdx
	movq	%r14, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%r14, %rax
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_02BBAHNLBA@?$CFp?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "?getArg@ArgWriter@@AEAAPEBXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?getArg@ArgWriter@@AEAAPEBXXZ"
	.globl	"?getArg@ArgWriter@@AEAAPEBXXZ" # -- Begin function ?getArg@ArgWriter@@AEAAPEBXXZ
	.p2align	4, 0x90
"?getArg@ArgWriter@@AEAAPEBXXZ":        # @"?getArg@ArgWriter@@AEAAPEBXXZ"
.seh_proc "?getArg@ArgWriter@@AEAAPEBXXZ"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movq	%rcx, (%rsp)
	movq	(%rsp), %rax
	movq	(%rax), %r8
	movl	8(%rax), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, 8(%rax)
	movslq	%ecx, %rax
	movq	(%r8,%rax,8), %rax
	popq	%rcx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z"
	.globl	"??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z" # -- Begin function ??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z
	.p2align	4, 0x90
"??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z": # @"??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z"
.seh_proc "??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	callq	"??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 snprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,snprintf
	.globl	snprintf                        # -- Begin function snprintf
	.p2align	4, 0x90
snprintf:                               # @snprintf
.seh_proc snprintf
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movq	%r9, 104(%rsp)
	movq	%r8, 64(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	104(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	40(%rsp), %r9
	movq	64(%rsp), %r8
	movq	56(%rsp), %rdx
	movq	48(%rsp), %rcx
	callq	vsnprintf
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@PEAX@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	128(%rsp), %eax
	movq	%r9, 64(%rsp)
	movl	%r8d, 36(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 56(%rsp)
	movq	56(%rsp), %rsi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	callq	"??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ"
	movq	%rax, 48(%rsp)
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	callq	"??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	128(%rsp), %rcx
	movq	(%rax,%rcx,8), %rcx
	callq	"??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z"
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rdi, %r8
	movq	%rsi, %r9
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 vsnprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,vsnprintf
	.globl	vsnprintf                       # -- Begin function vsnprintf
	.p2align	4, 0x90
vsnprintf:                              # @vsnprintf
.seh_proc vsnprintf
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$88, %rsp
	.seh_stackalloc 88
	.seh_endprologue
	movq	%r9, 80(%rsp)
	movq	%r8, 72(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rcx, 56(%rsp)
	movq	80(%rsp), %r14
	movq	72(%rsp), %rsi
	movq	64(%rsp), %rdi
	movq	56(%rsp), %rbx
	callq	__local_stdio_printf_options
	movq	(%rax), %rcx
	orq	$2, %rcx
	movq	%rbx, %rdx
	movq	%rdi, %r8
	movq	%rsi, %r9
	movq	$0, 32(%rsp)
	movq	%r14, 40(%rsp)
	callq	__stdio_common_vsprintf
	movl	%eax, 52(%rsp)
	cmpl	$0, 52(%rsp)
	jge	.LBB27_2
# %bb.1:
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	jmp	.LBB27_3
.LBB27_2:
	movl	52(%rsp), %eax
.LBB27_3:
	addq	$88, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	 __local_stdio_printf_options;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,__local_stdio_printf_options
	.globl	__local_stdio_printf_options    # -- Begin function __local_stdio_printf_options
	.p2align	4, 0x90
__local_stdio_printf_options:           # @__local_stdio_printf_options
# %bb.0:
	leaq	"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z"
	.globl	"??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z" # -- Begin function ??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z
	.p2align	4, 0x90
"??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z": # @"??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z"
.seh_proc "??$ValueAdapterImpl@PEAX@details@@YAPEAXPEAX@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movq	%rcx, (%rsp)
	movq	(%rsp), %rax
	popq	%rcx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@PEAX@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$8, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@PEAX@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@PEAX@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@PEAX@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movq	(%rax), %rcx
	callq	"??$ValueAdapter@PEAX@@YA?A?<auto>@@PEAX@Z"
	movq	%rax, %rdi
	movq	40(%rsp), %rbx
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movq	%rdi, %r9
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@N@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB32_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB32_3
.LBB32_2:
	movb	$0, 46(%rsp)
.LBB32_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@N@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB33_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB33_3
.LBB33_2:
	movb	$0, 46(%rsp)
.LBB33_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@N@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@N@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@N@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@N@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@N@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@N@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$15, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1120, %rsp                     # imm = 0x460
	.seh_stackalloc 1120
	movaps	%xmm6, 1104(%rsp)               # 16-byte Spill
	.seh_savexmm %xmm6, 1104
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 72(%rsp)
	movq	%rcx, 64(%rsp)
	movq	64(%rsp), %rdi
	callq	"??$type2Specifier@N@PrintInfo@@YAPEBDXZ"
	movq	%rax, 56(%rsp)
	leaq	80(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 48(%rsp)
	movl	$0, 44(%rsp)
.LBB35_1:                               # =>This Inner Loop Header: Depth=1
	movl	44(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB35_9
# %bb.2:                                #   in Loop: Header=BB35_1 Depth=1
	movq	16(%rdi), %rax
	movl	44(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB35_4
# %bb.3:                                #   in Loop: Header=BB35_1 Depth=1
	movq	48(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	44(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	callq	"??$ValueAdapter@N@@YA?A?<auto>@@N@Z"
	movaps	%xmm0, %xmm6
	movq	56(%rsp), %rbx
	movl	40(%rsp), %edx
	leaq	80(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movaps	%xmm6, %xmm3
	movq	%xmm6, %r9
	callq	snprintf
	addl	40(%rsp), %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB35_5
.LBB35_4:                               #   in Loop: Header=BB35_1 Depth=1
	movl	44(%rsp), %eax
	movq	48(%rsp), %r9
	movl	40(%rsp), %r8d
	leaq	80(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 40(%rsp)
.LBB35_5:                               #   in Loop: Header=BB35_1 Depth=1
	movl	44(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB35_7
# %bb.6:                                #   in Loop: Header=BB35_1 Depth=1
	movb	$44, %bl
.LBB35_7:                               #   in Loop: Header=BB35_1 Depth=1
	movl	40(%rsp), %edx
	leaq	80(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	40(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 40(%rsp)
# %bb.8:                                #   in Loop: Header=BB35_1 Depth=1
	movl	44(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB35_1
.LBB35_9:
	movl	40(%rsp), %edx
	leaq	80(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	80(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	movaps	1104(%rsp), %xmm6               # 16-byte Reload
	addq	$1120, %rsp                     # imm = 0x460
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@N@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@N@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@N@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@N@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@N@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@N@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_02NJPGOMH@?$CFf?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@N@@YA?A?<auto>@@N@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@N@@YA?A?<auto>@@N@Z"
	.globl	"??$ValueAdapter@N@@YA?A?<auto>@@N@Z" # -- Begin function ??$ValueAdapter@N@@YA?A?<auto>@@N@Z
	.p2align	4, 0x90
"??$ValueAdapter@N@@YA?A?<auto>@@N@Z":  # @"??$ValueAdapter@N@@YA?A?<auto>@@N@Z"
.seh_proc "??$ValueAdapter@N@@YA?A?<auto>@@N@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movsd	%xmm0, 32(%rsp)
	movsd	32(%rsp), %xmm0                 # xmm0 = mem[0],zero
	callq	"??$ValueAdapterImpl@N@details@@YANN@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$96, %rsp
	.seh_stackalloc 96
	movaps	%xmm6, 80(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 80
	.seh_endprologue
	movl	144(%rsp), %eax
	movq	%r9, 72(%rsp)
	movl	%r8d, 44(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 64(%rsp)
	movq	64(%rsp), %rsi
	movq	48(%rsp), %rcx
	movl	44(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	44(%rsp), %eax
	movl	%eax, 44(%rsp)
	callq	"??$type2Specifier@N@PrintInfo@@YAPEBDXZ"
	movq	%rax, 56(%rsp)
	movq	72(%rsp), %rdx
	movq	%rsi, %rcx
	callq	"??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	144(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	callq	"??$ValueAdapter@N@@YA?A?<auto>@@N@Z"
	movaps	%xmm0, %xmm6
	movq	56(%rsp), %rsi
	movq	48(%rsp), %rcx
	movl	44(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movaps	%xmm6, %xmm3
	movq	%xmm6, %r9
	callq	snprintf
	addl	44(%rsp), %eax
	movl	%eax, 44(%rsp)
	movq	48(%rsp), %rcx
	movl	44(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	44(%rsp), %eax
	movl	%eax, 44(%rsp)
	movl	44(%rsp), %eax
	movaps	80(%rsp), %xmm6                 # 16-byte Reload
	addq	$96, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapterImpl@N@details@@YANN@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapterImpl@N@details@@YANN@Z"
	.globl	"??$ValueAdapterImpl@N@details@@YANN@Z" # -- Begin function ??$ValueAdapterImpl@N@details@@YANN@Z
	.p2align	4, 0x90
"??$ValueAdapterImpl@N@details@@YANN@Z": # @"??$ValueAdapterImpl@N@details@@YANN@Z"
.seh_proc "??$ValueAdapterImpl@N@details@@YANN@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movsd	%xmm0, (%rsp)
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	popq	%rax
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@N@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@N@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@N@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@N@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@N@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@N@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$7, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@N@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	movaps	%xmm6, 1088(%rsp)               # 16-byte Spill
	.seh_savexmm %xmm6, 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@N@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movsd	(%rax), %xmm0                   # xmm0 = mem[0],zero
	callq	"??$ValueAdapter@N@@YA?A?<auto>@@N@Z"
	movaps	%xmm0, %xmm6
	movq	40(%rsp), %rdi
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rdi, %r8
	movaps	%xmm6, %xmm3
	movq	%xmm6, %r9
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	movaps	1088(%rsp), %xmm6               # 16-byte Reload
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@_K@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB43_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB43_3
.LBB43_2:
	movb	$0, 46(%rsp)
.LBB43_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@_KVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@_K@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB44_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB44_3
.LBB44_2:
	movb	$0, 46(%rsp)
.LBB44_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@_K@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@_K@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@_K@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@_K@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@_K@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@_K@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$14, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	.seh_endprologue
	movq	%rdx, %r14
	movq	%r14, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	72(%rsp), %rdi
	callq	"??$type2Specifier@_K@PrintInfo@@YAPEBDXZ"
	movq	%rax, 64(%rsp)
	leaq	88(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 48(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 56(%rsp)
	movl	$0, 52(%rsp)
.LBB46_1:                               # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB46_9
# %bb.2:                                #   in Loop: Header=BB46_1 Depth=1
	movq	16(%rdi), %rax
	movl	52(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB46_4
# %bb.3:                                #   in Loop: Header=BB46_1 Depth=1
	movq	56(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	52(%rsp), %rcx
	movq	(%rax,%rcx,8), %rcx
	callq	"??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z"
	movq	%rax, %rbx
	movq	64(%rsp), %rsi
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movq	%rbx, %r9
	callq	snprintf
	addl	48(%rsp), %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB46_5
.LBB46_4:                               #   in Loop: Header=BB46_1 Depth=1
	movl	52(%rsp), %eax
	movq	56(%rsp), %r9
	movl	48(%rsp), %r8d
	leaq	88(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 48(%rsp)
.LBB46_5:                               #   in Loop: Header=BB46_1 Depth=1
	movl	52(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB46_7
# %bb.6:                                #   in Loop: Header=BB46_1 Depth=1
	movb	$44, %bl
.LBB46_7:                               #   in Loop: Header=BB46_1 Depth=1
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
# %bb.8:                                #   in Loop: Header=BB46_1 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB46_1
.LBB46_9:
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	88(%rsp), %rdx
	movq	%r14, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%r14, %rax
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@_K@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@_K@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@_K@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@_K@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@_K@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@_K@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_04FCIJFPNK@?$CFllu?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z"
	.globl	"??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z" # -- Begin function ??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z
	.p2align	4, 0x90
"??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z": # @"??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z"
.seh_proc "??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	callq	"??$ValueAdapterImpl@_K@details@@YA_K_K@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@_K@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	128(%rsp), %eax
	movq	%r9, 64(%rsp)
	movl	%r8d, 36(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 56(%rsp)
	movq	56(%rsp), %rsi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	callq	"??$type2Specifier@_K@PrintInfo@@YAPEBDXZ"
	movq	%rax, 48(%rsp)
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	callq	"??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	128(%rsp), %rcx
	movq	(%rax,%rcx,8), %rcx
	callq	"??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z"
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rdi, %r8
	movq	%rsi, %r9
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapterImpl@_K@details@@YA_K_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapterImpl@_K@details@@YA_K_K@Z"
	.globl	"??$ValueAdapterImpl@_K@details@@YA_K_K@Z" # -- Begin function ??$ValueAdapterImpl@_K@details@@YA_K_K@Z
	.p2align	4, 0x90
"??$ValueAdapterImpl@_K@details@@YA_K_K@Z": # @"??$ValueAdapterImpl@_K@details@@YA_K_K@Z"
.seh_proc "??$ValueAdapterImpl@_K@details@@YA_K_K@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movq	%rcx, (%rsp)
	movq	(%rsp), %rax
	popq	%rcx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@_K@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@_K@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@_K@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@_K@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@_K@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@_K@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$6, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@_K@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@_K@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@_K@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movq	(%rax), %rcx
	callq	"??$ValueAdapter@_K@@YA?A?<auto>@@_K@Z"
	movq	%rax, %rdi
	movq	40(%rsp), %rbx
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movq	%rdi, %r9
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@_J@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB54_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB54_3
.LBB54_2:
	movb	$0, 46(%rsp)
.LBB54_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@_JVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@_J@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB55_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB55_3
.LBB55_2:
	movb	$0, 46(%rsp)
.LBB55_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@_J@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@_J@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@_J@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@_J@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@_J@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@_J@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$13, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	.seh_endprologue
	movq	%rdx, %r14
	movq	%r14, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	72(%rsp), %rdi
	callq	"??$type2Specifier@_J@PrintInfo@@YAPEBDXZ"
	movq	%rax, 64(%rsp)
	leaq	88(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 48(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 56(%rsp)
	movl	$0, 52(%rsp)
.LBB57_1:                               # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB57_9
# %bb.2:                                #   in Loop: Header=BB57_1 Depth=1
	movq	16(%rdi), %rax
	movl	52(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB57_4
# %bb.3:                                #   in Loop: Header=BB57_1 Depth=1
	movq	56(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	52(%rsp), %rcx
	movq	(%rax,%rcx,8), %rcx
	callq	"??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z"
	movq	%rax, %rbx
	movq	64(%rsp), %rsi
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movq	%rbx, %r9
	callq	snprintf
	addl	48(%rsp), %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB57_5
.LBB57_4:                               #   in Loop: Header=BB57_1 Depth=1
	movl	52(%rsp), %eax
	movq	56(%rsp), %r9
	movl	48(%rsp), %r8d
	leaq	88(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 48(%rsp)
.LBB57_5:                               #   in Loop: Header=BB57_1 Depth=1
	movl	52(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB57_7
# %bb.6:                                #   in Loop: Header=BB57_1 Depth=1
	movb	$44, %bl
.LBB57_7:                               #   in Loop: Header=BB57_1 Depth=1
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
# %bb.8:                                #   in Loop: Header=BB57_1 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB57_1
.LBB57_9:
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	88(%rsp), %rdx
	movq	%r14, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%r14, %rax
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@_J@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@_J@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@_J@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@_J@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@_J@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@_J@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_04BFAHMMK@?$CFlld?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z"
	.globl	"??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z" # -- Begin function ??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z
	.p2align	4, 0x90
"??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z": # @"??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z"
.seh_proc "??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	callq	"??$ValueAdapterImpl@_J@details@@YA_J_J@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@_J@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	128(%rsp), %eax
	movq	%r9, 64(%rsp)
	movl	%r8d, 36(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 56(%rsp)
	movq	56(%rsp), %rsi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	callq	"??$type2Specifier@_J@PrintInfo@@YAPEBDXZ"
	movq	%rax, 48(%rsp)
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	callq	"??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	128(%rsp), %rcx
	movq	(%rax,%rcx,8), %rcx
	callq	"??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z"
	movq	%rax, %rsi
	movq	48(%rsp), %rdi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rdi, %r8
	movq	%rsi, %r9
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapterImpl@_J@details@@YA_J_J@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapterImpl@_J@details@@YA_J_J@Z"
	.globl	"??$ValueAdapterImpl@_J@details@@YA_J_J@Z" # -- Begin function ??$ValueAdapterImpl@_J@details@@YA_J_J@Z
	.p2align	4, 0x90
"??$ValueAdapterImpl@_J@details@@YA_J_J@Z": # @"??$ValueAdapterImpl@_J@details@@YA_J_J@Z"
.seh_proc "??$ValueAdapterImpl@_J@details@@YA_J_J@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movq	%rcx, (%rsp)
	movq	(%rsp), %rax
	popq	%rcx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@_J@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@_J@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@_J@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@_J@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@_J@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@_J@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$5, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@_J@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@_J@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@_J@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movq	(%rax), %rcx
	callq	"??$ValueAdapter@_J@@YA?A?<auto>@@_J@Z"
	movq	%rax, %rdi
	movq	40(%rsp), %rbx
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movq	%rdi, %r9
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@M@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB65_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB65_3
.LBB65_2:
	movb	$0, 46(%rsp)
.LBB65_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@MVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@M@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB66_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB66_3
.LBB66_2:
	movb	$0, 46(%rsp)
.LBB66_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@M@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@M@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@M@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@M@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@M@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@M@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$12, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1120, %rsp                     # imm = 0x460
	.seh_stackalloc 1120
	movaps	%xmm6, 1104(%rsp)               # 16-byte Spill
	.seh_savexmm %xmm6, 1104
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 72(%rsp)
	movq	%rcx, 64(%rsp)
	movq	64(%rsp), %rdi
	callq	"??$type2Specifier@M@PrintInfo@@YAPEBDXZ"
	movq	%rax, 56(%rsp)
	leaq	80(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 48(%rsp)
	movl	$0, 44(%rsp)
.LBB68_1:                               # =>This Inner Loop Header: Depth=1
	movl	44(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB68_9
# %bb.2:                                #   in Loop: Header=BB68_1 Depth=1
	movq	16(%rdi), %rax
	movl	44(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB68_4
# %bb.3:                                #   in Loop: Header=BB68_1 Depth=1
	movq	48(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	44(%rsp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	callq	"??$ValueAdapter@M@@YA?A?<auto>@@M@Z"
	cvtss2sd	%xmm0, %xmm6
	movq	56(%rsp), %rbx
	movl	40(%rsp), %edx
	leaq	80(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movaps	%xmm6, %xmm3
	movq	%xmm6, %r9
	callq	snprintf
	addl	40(%rsp), %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB68_5
.LBB68_4:                               #   in Loop: Header=BB68_1 Depth=1
	movl	44(%rsp), %eax
	movq	48(%rsp), %r9
	movl	40(%rsp), %r8d
	leaq	80(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 40(%rsp)
.LBB68_5:                               #   in Loop: Header=BB68_1 Depth=1
	movl	44(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB68_7
# %bb.6:                                #   in Loop: Header=BB68_1 Depth=1
	movb	$44, %bl
.LBB68_7:                               #   in Loop: Header=BB68_1 Depth=1
	movl	40(%rsp), %edx
	leaq	80(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	40(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 40(%rsp)
# %bb.8:                                #   in Loop: Header=BB68_1 Depth=1
	movl	44(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB68_1
.LBB68_9:
	movl	40(%rsp), %edx
	leaq	80(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	80(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	movaps	1104(%rsp), %xmm6               # 16-byte Reload
	addq	$1120, %rsp                     # imm = 0x460
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@M@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@M@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@M@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@M@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@M@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@M@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_02NJPGOMH@?$CFf?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@M@@YA?A?<auto>@@M@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@M@@YA?A?<auto>@@M@Z"
	.globl	"??$ValueAdapter@M@@YA?A?<auto>@@M@Z" # -- Begin function ??$ValueAdapter@M@@YA?A?<auto>@@M@Z
	.p2align	4, 0x90
"??$ValueAdapter@M@@YA?A?<auto>@@M@Z":  # @"??$ValueAdapter@M@@YA?A?<auto>@@M@Z"
.seh_proc "??$ValueAdapter@M@@YA?A?<auto>@@M@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movss	%xmm0, 36(%rsp)
	movss	36(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	callq	"??$ValueAdapterImpl@M@details@@YAMM@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@M@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$96, %rsp
	.seh_stackalloc 96
	movaps	%xmm6, 80(%rsp)                 # 16-byte Spill
	.seh_savexmm %xmm6, 80
	.seh_endprologue
	movl	144(%rsp), %eax
	movq	%r9, 72(%rsp)
	movl	%r8d, 44(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 64(%rsp)
	movq	64(%rsp), %rsi
	movq	48(%rsp), %rcx
	movl	44(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	44(%rsp), %eax
	movl	%eax, 44(%rsp)
	callq	"??$type2Specifier@M@PrintInfo@@YAPEBDXZ"
	movq	%rax, 56(%rsp)
	movq	72(%rsp), %rdx
	movq	%rsi, %rcx
	callq	"??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	144(%rsp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	callq	"??$ValueAdapter@M@@YA?A?<auto>@@M@Z"
	cvtss2sd	%xmm0, %xmm6
	movq	56(%rsp), %rsi
	movq	48(%rsp), %rcx
	movl	44(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movaps	%xmm6, %xmm3
	movq	%xmm6, %r9
	callq	snprintf
	addl	44(%rsp), %eax
	movl	%eax, 44(%rsp)
	movq	48(%rsp), %rcx
	movl	44(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	44(%rsp), %eax
	movl	%eax, 44(%rsp)
	movl	44(%rsp), %eax
	movaps	80(%rsp), %xmm6                 # 16-byte Reload
	addq	$96, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapterImpl@M@details@@YAMM@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapterImpl@M@details@@YAMM@Z"
	.globl	"??$ValueAdapterImpl@M@details@@YAMM@Z" # -- Begin function ??$ValueAdapterImpl@M@details@@YAMM@Z
	.p2align	4, 0x90
"??$ValueAdapterImpl@M@details@@YAMM@Z": # @"??$ValueAdapterImpl@M@details@@YAMM@Z"
.seh_proc "??$ValueAdapterImpl@M@details@@YAMM@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movss	%xmm0, 4(%rsp)
	movss	4(%rsp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	popq	%rax
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@M@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@M@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@M@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@M@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@M@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@M@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$4, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@M@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	movaps	%xmm6, 1088(%rsp)               # 16-byte Spill
	.seh_savexmm %xmm6, 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@M@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@M@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movss	(%rax), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	callq	"??$ValueAdapter@M@@YA?A?<auto>@@M@Z"
	cvtss2sd	%xmm0, %xmm6
	movq	40(%rsp), %rdi
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rdi, %r8
	movaps	%xmm6, %xmm3
	movq	%xmm6, %r9
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	movaps	1088(%rsp), %xmm6               # 16-byte Reload
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@I@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB76_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB76_3
.LBB76_2:
	movb	$0, 46(%rsp)
.LBB76_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@IVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@I@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB77_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB77_3
.LBB77_2:
	movb	$0, 46(%rsp)
.LBB77_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@I@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@I@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@I@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@I@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@I@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@I@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$11, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	.seh_endprologue
	movq	%rdx, %r14
	movq	%r14, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	72(%rsp), %rdi
	callq	"??$type2Specifier@I@PrintInfo@@YAPEBDXZ"
	movq	%rax, 64(%rsp)
	leaq	88(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 48(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 56(%rsp)
	movl	$0, 52(%rsp)
.LBB79_1:                               # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB79_9
# %bb.2:                                #   in Loop: Header=BB79_1 Depth=1
	movq	16(%rdi), %rax
	movl	52(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB79_4
# %bb.3:                                #   in Loop: Header=BB79_1 Depth=1
	movq	56(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	52(%rsp), %rcx
	movl	(%rax,%rcx,4), %ecx
	callq	"??$ValueAdapter@I@@YA?A?<auto>@@I@Z"
	movl	%eax, %ebx
	movq	64(%rsp), %rsi
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movl	%ebx, %r9d
	callq	snprintf
	addl	48(%rsp), %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB79_5
.LBB79_4:                               #   in Loop: Header=BB79_1 Depth=1
	movl	52(%rsp), %eax
	movq	56(%rsp), %r9
	movl	48(%rsp), %r8d
	leaq	88(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 48(%rsp)
.LBB79_5:                               #   in Loop: Header=BB79_1 Depth=1
	movl	52(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB79_7
# %bb.6:                                #   in Loop: Header=BB79_1 Depth=1
	movb	$44, %bl
.LBB79_7:                               #   in Loop: Header=BB79_1 Depth=1
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
# %bb.8:                                #   in Loop: Header=BB79_1 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB79_1
.LBB79_9:
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	88(%rsp), %rdx
	movq	%r14, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%r14, %rax
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@I@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@I@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@I@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@I@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@I@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@I@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_02GMHACPFF@?$CFu?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@I@@YA?A?<auto>@@I@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@I@@YA?A?<auto>@@I@Z"
	.globl	"??$ValueAdapter@I@@YA?A?<auto>@@I@Z" # -- Begin function ??$ValueAdapter@I@@YA?A?<auto>@@I@Z
	.p2align	4, 0x90
"??$ValueAdapter@I@@YA?A?<auto>@@I@Z":  # @"??$ValueAdapter@I@@YA?A?<auto>@@I@Z"
.seh_proc "??$ValueAdapter@I@@YA?A?<auto>@@I@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	%ecx, 36(%rsp)
	movl	36(%rsp), %ecx
	callq	"??$ValueAdapterImpl@I@details@@YAII@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@I@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	128(%rsp), %eax
	movq	%r9, 64(%rsp)
	movl	%r8d, 36(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 56(%rsp)
	movq	56(%rsp), %rsi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	callq	"??$type2Specifier@I@PrintInfo@@YAPEBDXZ"
	movq	%rax, 48(%rsp)
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	callq	"??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	128(%rsp), %rcx
	movl	(%rax,%rcx,4), %ecx
	callq	"??$ValueAdapter@I@@YA?A?<auto>@@I@Z"
	movl	%eax, %esi
	movq	48(%rsp), %rdi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rdi, %r8
	movl	%esi, %r9d
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapterImpl@I@details@@YAII@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapterImpl@I@details@@YAII@Z"
	.globl	"??$ValueAdapterImpl@I@details@@YAII@Z" # -- Begin function ??$ValueAdapterImpl@I@details@@YAII@Z
	.p2align	4, 0x90
"??$ValueAdapterImpl@I@details@@YAII@Z": # @"??$ValueAdapterImpl@I@details@@YAII@Z"
.seh_proc "??$ValueAdapterImpl@I@details@@YAII@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movl	%ecx, 4(%rsp)
	movl	4(%rsp), %eax
	popq	%rcx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@I@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@I@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@I@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@I@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@I@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@I@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$3, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@I@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@I@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@I@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movl	(%rax), %ecx
	callq	"??$ValueAdapter@I@@YA?A?<auto>@@I@Z"
	movl	%eax, %edi
	movq	40(%rsp), %rbx
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movl	%edi, %r9d
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@H@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB87_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB87_3
.LBB87_2:
	movb	$0, 46(%rsp)
.LBB87_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@HVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@H@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB88_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB88_3
.LBB88_2:
	movb	$0, 46(%rsp)
.LBB88_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@H@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@H@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@H@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@H@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@H@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@H@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$10, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	.seh_endprologue
	movq	%rdx, %r14
	movq	%r14, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	72(%rsp), %rdi
	callq	"??$type2Specifier@H@PrintInfo@@YAPEBDXZ"
	movq	%rax, 64(%rsp)
	leaq	88(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 48(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 56(%rsp)
	movl	$0, 52(%rsp)
.LBB90_1:                               # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB90_9
# %bb.2:                                #   in Loop: Header=BB90_1 Depth=1
	movq	16(%rdi), %rax
	movl	52(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB90_4
# %bb.3:                                #   in Loop: Header=BB90_1 Depth=1
	movq	56(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	52(%rsp), %rcx
	movl	(%rax,%rcx,4), %ecx
	callq	"??$ValueAdapter@H@@YA?A?<auto>@@H@Z"
	movl	%eax, %ebx
	movq	64(%rsp), %rsi
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movl	%ebx, %r9d
	callq	snprintf
	addl	48(%rsp), %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB90_5
.LBB90_4:                               #   in Loop: Header=BB90_1 Depth=1
	movl	52(%rsp), %eax
	movq	56(%rsp), %r9
	movl	48(%rsp), %r8d
	leaq	88(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 48(%rsp)
.LBB90_5:                               #   in Loop: Header=BB90_1 Depth=1
	movl	52(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB90_7
# %bb.6:                                #   in Loop: Header=BB90_1 Depth=1
	movb	$44, %bl
.LBB90_7:                               #   in Loop: Header=BB90_1 Depth=1
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
# %bb.8:                                #   in Loop: Header=BB90_1 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB90_1
.LBB90_9:
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	88(%rsp), %rdx
	movq	%r14, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%r14, %rax
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@H@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@H@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@H@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@H@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@H@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@H@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_02DPKJAMEF@?$CFd?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@H@@YA?A?<auto>@@H@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@H@@YA?A?<auto>@@H@Z"
	.globl	"??$ValueAdapter@H@@YA?A?<auto>@@H@Z" # -- Begin function ??$ValueAdapter@H@@YA?A?<auto>@@H@Z
	.p2align	4, 0x90
"??$ValueAdapter@H@@YA?A?<auto>@@H@Z":  # @"??$ValueAdapter@H@@YA?A?<auto>@@H@Z"
.seh_proc "??$ValueAdapter@H@@YA?A?<auto>@@H@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	%ecx, 36(%rsp)
	movl	36(%rsp), %ecx
	callq	"??$ValueAdapterImpl@H@details@@YAHH@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@H@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	128(%rsp), %eax
	movq	%r9, 64(%rsp)
	movl	%r8d, 36(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 56(%rsp)
	movq	56(%rsp), %rsi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	callq	"??$type2Specifier@H@PrintInfo@@YAPEBDXZ"
	movq	%rax, 48(%rsp)
	movq	64(%rsp), %rdx
	movq	%rsi, %rcx
	callq	"??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	128(%rsp), %rcx
	movl	(%rax,%rcx,4), %ecx
	callq	"??$ValueAdapter@H@@YA?A?<auto>@@H@Z"
	movl	%eax, %esi
	movq	48(%rsp), %rdi
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rdi, %r8
	movl	%esi, %r9d
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	movl	36(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"(%rip), %r8
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	callq	snprintf
	addl	36(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	36(%rsp), %eax
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapterImpl@H@details@@YAHH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapterImpl@H@details@@YAHH@Z"
	.globl	"??$ValueAdapterImpl@H@details@@YAHH@Z" # -- Begin function ??$ValueAdapterImpl@H@details@@YAHH@Z
	.p2align	4, 0x90
"??$ValueAdapterImpl@H@details@@YAHH@Z": # @"??$ValueAdapterImpl@H@details@@YAHH@Z"
.seh_proc "??$ValueAdapterImpl@H@details@@YAHH@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movl	%ecx, 4(%rsp)
	movl	4(%rsp), %eax
	popq	%rcx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@H@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@H@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@H@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@H@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@H@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@H@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$2, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@H@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@H@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@H@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movl	(%rax), %ecx
	callq	"??$ValueAdapter@H@@YA?A?<auto>@@H@Z"
	movl	%eax, %edi
	movq	40(%rsp), %rbx
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movl	%edi, %r9d
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$UniArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Uniform@_N@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB98_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB98_3
.LBB98_2:
	movb	$0, 46(%rsp)
.LBB98_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
	.globl	"??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z" # -- Begin function ??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z
	.p2align	4, 0x90
"??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z": # @"??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
.seh_proc "??$VarArg2StrIfSuitable@_NVArgWriter@@@details@@YA_NDAEAVArgWriter@@AEAU?$array@D$0EAA@@notstd@@@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movb	%cl, 47(%rsp)
	movsbl	47(%rsp), %esi
	callq	"??$getEncoding4Varying@_N@PrintInfo@@YA?AW4Encoding@0@XZ"
	movsbl	%al, %eax
	cmpl	%eax, %esi
	jne	.LBB99_2
# %bb.1:
	movq	48(%rsp), %rcx
	leaq	64(%rsp), %rdx
	callq	"??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
	movq	56(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movb	$1, 46(%rsp)
	jmp	.LBB99_3
.LBB99_2:
	movb	$0, 46(%rsp)
.LBB99_3:
	movb	46(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Varying@_N@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Varying@_N@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Varying@_N@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Varying@_N@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Varying@_N@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Varying@_N@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$9, %al
	retq
                                        # -- End function
	.def	 "??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$varying2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1112, %rsp                     # imm = 0x458
	.seh_stackalloc 1112
	.seh_endprologue
	movq	%rdx, %r14
	movq	%r14, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	72(%rsp), %rdi
	callq	"??$type2Specifier@_N@PrintInfo@@YAPEBDXZ"
	movq	%rax, 64(%rsp)
	leaq	88(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$91, (%rax)
	movl	$1, 48(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 56(%rsp)
	movl	$0, 52(%rsp)
.LBB101_1:                              # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %eax
	cmpl	12(%rdi), %eax
	jge	.LBB101_9
# %bb.2:                                #   in Loop: Header=BB101_1 Depth=1
	movq	16(%rdi), %rax
	movl	52(%rsp), %ecx
	movl	$1, %edx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	andq	%rdx, %rax
	cmpq	$0, %rax
	je	.LBB101_4
# %bb.3:                                #   in Loop: Header=BB101_1 Depth=1
	movq	56(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	movslq	52(%rsp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	setne	%cl
	andb	$1, %cl
	callq	"??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z"
	movq	%rax, %rbx
	movq	64(%rsp), %rsi
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	movq	%rbx, %r9
	callq	snprintf
	addl	48(%rsp), %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB101_5
.LBB101_4:                              #   in Loop: Header=BB101_1 Depth=1
	movl	52(%rsp), %eax
	movq	56(%rsp), %r9
	movl	48(%rsp), %r8d
	leaq	88(%rsp), %rdx
	movq	%rdi, %rcx
	movl	%eax, 32(%rsp)
	callq	"??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	movl	%eax, 48(%rsp)
.LBB101_5:                              #   in Loop: Header=BB101_1 Depth=1
	movl	52(%rsp), %eax
	movl	12(%rdi), %ecx
	subl	$1, %ecx
	movb	$93, %bl
	cmpl	%ecx, %eax
	je	.LBB101_7
# %bb.6:                                #   in Loop: Header=BB101_1 Depth=1
	movb	$44, %bl
.LBB101_7:                              #   in Loop: Header=BB101_1 Depth=1
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
# %bb.8:                                #   in Loop: Header=BB101_1 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB101_1
.LBB101_9:
	movl	48(%rsp), %edx
	leaq	88(%rsp), %rcx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movb	$0, (%rax)
	leaq	88(%rsp), %rdx
	movq	%r14, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%r14, %rax
	addq	$1112, %rsp                     # imm = 0x458
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$type2Specifier@_N@PrintInfo@@YAPEBDXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$type2Specifier@_N@PrintInfo@@YAPEBDXZ"
	.globl	"??$type2Specifier@_N@PrintInfo@@YAPEBDXZ" # -- Begin function ??$type2Specifier@_N@PrintInfo@@YAPEBDXZ
	.p2align	4, 0x90
"??$type2Specifier@_N@PrintInfo@@YAPEBDXZ": # @"??$type2Specifier@_N@PrintInfo@@YAPEBDXZ"
# %bb.0:
	leaq	"??_C@_02DKCKIIND@?$CFs?$AA@"(%rip), %rax
	retq
                                        # -- End function
	.def	 "??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	.globl	"??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z" # -- Begin function ??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z
	.p2align	4, 0x90
"??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z": # @"??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
.seh_proc "??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rsp), %rax
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z"
	.globl	"??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z" # -- Begin function ??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z
	.p2align	4, 0x90
"??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z": # @"??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z"
.seh_proc "??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	andb	$1, %cl
	movb	%cl, 39(%rsp)
	movb	39(%rsp), %cl
	andb	$1, %cl
	callq	"?ValueAdapterImpl@details@@YAPEBD_N@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
	.globl	"??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z" # -- Begin function ??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z
	.p2align	4, 0x90
"??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z": # @"??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
.seh_proc "??$writeOffLane@_N@ArgWriter@@AEAAHAEAU?$array@D$0EAA@@notstd@@HPEBXH@Z"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$80, %rsp
	.seh_stackalloc 80
	.seh_endprologue
	movl	128(%rsp), %eax
	movq	%r9, 72(%rsp)
	movl	%r8d, 44(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 64(%rsp)
	callq	"??$type2Specifier@_N@PrintInfo@@YAPEBDXZ"
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rsi
	movq	56(%rsp), %rcx
	movl	44(%rsp), %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	leaq	OffLaneBoolStr(%rip), %r9
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rsi, %r8
	callq	snprintf
	addl	44(%rsp), %eax
	movl	%eax, 44(%rsp)
	movl	44(%rsp), %eax
	addq	$80, %rsp
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "?ValueAdapterImpl@details@@YAPEBD_N@Z";
	.scl	3;
	.type	32;
	.endef
	.text
	.p2align	4, 0x90                         # -- Begin function ?ValueAdapterImpl@details@@YAPEBD_N@Z
"?ValueAdapterImpl@details@@YAPEBD_N@Z": # @"?ValueAdapterImpl@details@@YAPEBD_N@Z"
.seh_proc "?ValueAdapterImpl@details@@YAPEBD_N@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	andb	$1, %cl
	movb	%cl, 7(%rsp)
	movb	7(%rsp), %cl
	leaq	"??_C@_05LAPONLG@false?$AA@"(%rip), %rax
	leaq	"??_C@_04LOAJBDKD@true?$AA@"(%rip), %rdx
	testb	$1, %cl
	cmovneq	%rdx, %rax
	popq	%rcx
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$getEncoding4Uniform@_N@PrintInfo@@YA?AW4Encoding@0@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$getEncoding4Uniform@_N@PrintInfo@@YA?AW4Encoding@0@XZ"
	.globl	"??$getEncoding4Uniform@_N@PrintInfo@@YA?AW4Encoding@0@XZ" # -- Begin function ??$getEncoding4Uniform@_N@PrintInfo@@YA?AW4Encoding@0@XZ
	.p2align	4, 0x90
"??$getEncoding4Uniform@_N@PrintInfo@@YA?AW4Encoding@0@XZ": # @"??$getEncoding4Uniform@_N@PrintInfo@@YA?AW4Encoding@0@XZ"
# %bb.0:
	movb	$1, %al
	retq
                                        # -- End function
	.def	 "??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
	.globl	"??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ" # -- Begin function ??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ
	.p2align	4, 0x90
"??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ": # @"??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
.seh_proc "??$uniform2Str@_N@ArgWriter@@QEAA?A?<auto>@@XZ"
# %bb.0:
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$1088, %rsp                     # imm = 0x440
	.seh_stackalloc 1088
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rdi
	callq	"??$type2Specifier@_N@PrintInfo@@YAPEBDXZ"
	movq	%rax, 40(%rsp)
	movq	%rdi, %rcx
	callq	"?getArg@ArgWriter@@AEAAPEBXXZ"
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rdx
	movq	%rdi, %rcx
	callq	"??$argCast@_N@ArgWriter@@AEAA?A?<auto>@@PEBX@Z"
	cmpl	$0, (%rax)
	setne	%cl
	andb	$1, %cl
	callq	"??$ValueAdapter@_N@@YA?A?<auto>@@_N@Z"
	movq	%rax, %rdi
	movq	40(%rsp), %rbx
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	callq	"??A?$array@D$0EAA@@notstd@@QEAAAEADH@Z"
	movq	%rax, %rcx
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %r8
	movq	%rdi, %r9
	callq	snprintf
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movl	$1024, %r8d                     # imm = 0x400
	callq	memcpy
	movq	%rsi, %rax
	addq	$1088, %rsp                     # imm = 0x440
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_endproc
                                        # -- End function
	.def	 "??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z"
	.globl	"??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z" # -- Begin function ??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z
	.p2align	4, 0x90
"??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z": # @"??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z"
.seh_proc "??$CopyTillSep@$0CF@$0A@PEBD$0CAAE@@details@@YAHPEBDHAEAU?$array@D$0CAAE@@notstd@@HH@Z"
# %bb.0:
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$64, %rsp
	.seh_stackalloc 64
	.seh_endprologue
	movl	112(%rsp), %eax
	movl	%r9d, 36(%rsp)
	movq	%r8, 56(%rsp)
	movl	%edx, 32(%rsp)
	movq	%rcx, 40(%rsp)
	movl	36(%rsp), %eax
	movl	%eax, 52(%rsp)
.LBB109_1:                              # =>This Inner Loop Header: Depth=1
	movq	40(%rsp), %rax
	movslq	32(%rsp), %rcx
	movsbl	(%rax,%rcx), %ecx
	xorl	%eax, %eax
	cmpl	$37, %ecx
	je	.LBB109_4
# %bb.2:                                #   in Loop: Header=BB109_1 Depth=1
	movq	40(%rsp), %rax
	movslq	32(%rsp), %rcx
	movsbl	(%rax,%rcx), %ecx
	xorl	%eax, %eax
	cmpl	$0, %ecx
	je	.LBB109_4
# %bb.3:                                #   in Loop: Header=BB109_1 Depth=1
	cmpl	$0, 112(%rsp)
	setne	%al
.LBB109_4:                              #   in Loop: Header=BB109_1 Depth=1
	testb	$1, %al
	jne	.LBB109_5
	jmp	.LBB109_6
.LBB109_5:                              #   in Loop: Header=BB109_1 Depth=1
	movq	40(%rsp), %rax
	movl	32(%rsp), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, 32(%rsp)
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %bl
	movq	56(%rsp), %rcx
	movl	36(%rsp), %edx
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, 36(%rsp)
	callq	"??A?$array@D$0CAAE@@notstd@@QEAAAEADH@Z"
	movb	%bl, (%rax)
	movl	112(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 112(%rsp)
	jmp	.LBB109_1
.LBB109_6:
	movl	36(%rsp), %eax
	subl	52(%rsp), %eax
	addq	$64, %rsp
	popq	%rbx
	retq
	.seh_endproc
                                        # -- End function
	.def	 conv_forward_ispc___uniuniuniuniuniuniuniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	6                               # -- Begin function conv_forward_ispc___uniuniuniuniuniuniuniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_
.LCPI110_0:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
	.text
	.globl	conv_forward_ispc___uniuniuniuniuniuniuniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_
	.p2align	4, 0x90
conv_forward_ispc___uniuniuniuniuniuniuniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_: # @conv_forward_ispc___uniuniuniuniuniuniuniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_
# %bb.0:                                # %allocas
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rsi
	pushq	%rdi
	pushq	%rbp
	pushq	%rbx
	subq	$136, %rsp
	vmovapd	%xmm7, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm6, 96(%rsp)                 # 16-byte Spill
	movl	%r9d, %edi
	movl	%r8d, %r14d
	movl	%edx, %esi
	movl	%ecx, %r15d
	movq	288(%rsp), %rbp
	movq	272(%rsp), %rbx
	movl	256(%rsp), %r12d
	movl	248(%rsp), %r13d
	movq	304(%rsp), %rax
	vpsllw	$7, (%rax), %xmm0
	vpmovmskb	%xmm0, %r8d
	leaq	__str(%rip), %rcx
	leaq	__str.1(%rip), %rdx
	callq	__do_print
	leal	15(%r15), %eax
	testl	%r15d, %r15d
	movq	%r15, 88(%rsp)                  # 8-byte Spill
	cmovnsl	%r15d, %eax
	vpbroadcastd	%r12d, %zmm0
	andl	$-16, %eax
	movl	%eax, 68(%rsp)                  # 4-byte Spill
	movq	%rdi, 80(%rsp)                  # 8-byte Spill
	movl	%esi, 56(%rsp)                  # 4-byte Spill
	movl	%r14d, 60(%rsp)                 # 4-byte Spill
	jle	.LBB110_1
# %bb.2:                                # %foreach_full_body.lr.ph
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtd	%zmm1, %zmm0, %k0
	kmovd	%k0, %eax
	movl	%eax, 64(%rsp)                  # 4-byte Spill
	movl	264(%rsp), %r10d
	vpbroadcastd	%r10d, %zmm2
	vpbroadcastd	%esi, %zmm3
	movl	240(%rsp), %eax
	vpbroadcastd	%eax, %zmm4
	vpbroadcastd	%r13d, %zmm5
	leal	(,%rdi,8), %edx
	movl	%edi, %ecx
	imull	%r14d, %ecx
	shll	$3, %ecx
	xorl	%r8d, %r8d
	vmovdqa64	.LCPI110_0(%rip), %zmm16 # zmm16 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	vpternlogd	$255, %zmm17, %zmm17, %zmm17
	movl	%r13d, %r9d
	movl	%r10d, %esi
	movl	%eax, %edi
	jmp	.LBB110_3
	.p2align	4, 0x90
.LBB110_19:                             # %for_exit
                                        #   in Loop: Header=BB110_3 Depth=1
	movq	72(%rsp), %r8                   # 8-byte Reload
	addl	$16, %r8d
	cmpl	68(%rsp), %r8d                  # 4-byte Folded Reload
	jge	.LBB110_20
.LBB110_3:                              # %foreach_full_body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB110_5 Depth 2
                                        #       Child Loop BB110_7 Depth 3
                                        #         Child Loop BB110_10 Depth 4
                                        #           Child Loop BB110_12 Depth 5
                                        #             Child Loop BB110_14 Depth 6
	movq	%r8, 72(%rsp)                   # 8-byte Spill
	cmpw	$0, 64(%rsp)                    # 2-byte Folded Reload
	je	.LBB110_19
# %bb.4:                                # %for_test45.preheader.lr.ph
                                        #   in Loop: Header=BB110_3 Depth=1
	movq	72(%rsp), %rax                  # 8-byte Reload
	vpbroadcastd	%eax, %zmm18
	vpord	%zmm16, %zmm18, %zmm19
	vpmulld	%zmm3, %zmm19, %zmm18
	vpmulld	%zmm0, %zmm19, %zmm19
	leal	(,%rax,8), %eax
	movl	%edi, %r15d
	movslq	%eax, %r11
	movq	296(%rsp), %rax
	leaq	(%rax,%r11), %r8
	leaq	(%rax,%r11), %r14
	addq	$64, %r14
	vpxord	%xmm20, %xmm20, %xmm20
	xorl	%r12d, %r12d
	kmovq	%k0, %k1
	jmp	.LBB110_5
	.p2align	4, 0x90
.LBB110_18:                             # %for_exit48
                                        #   in Loop: Header=BB110_5 Depth=2
	vpsubd	%zmm17, %zmm20, %zmm20
	vpcmpgtd	%zmm20, %zmm0, %k1 {%k1}
	addl	%edx, %r12d
	kortestw	%k1, %k1
	je	.LBB110_19
.LBB110_5:                              # %for_test45.preheader
                                        #   Parent Loop BB110_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB110_7 Depth 3
                                        #         Child Loop BB110_10 Depth 4
                                        #           Child Loop BB110_12 Depth 5
                                        #             Child Loop BB110_14 Depth 6
	vpcmpgtd	%zmm1, %zmm2, %k2 {%k1}
	kortestw	%k2, %k2
	je	.LBB110_18
# %bb.6:                                # %for_test61.preheader.lr.ph
                                        #   in Loop: Header=BB110_5 Depth=2
	vpaddd	%zmm19, %zmm20, %zmm21
	vpmulld	%zmm2, %zmm21, %zmm21
	vpxord	%xmm22, %xmm22, %xmm22
	jmp	.LBB110_7
	.p2align	4, 0x90
.LBB110_8:                              #   in Loop: Header=BB110_7 Depth=3
	vxorpd	%xmm24, %xmm24, %xmm24
	vxorpd	%xmm23, %xmm23, %xmm23
.LBB110_17:                             # %for_exit64
                                        #   in Loop: Header=BB110_7 Depth=3
	kmovw	%k2, 48(%rsp)
	vmovdqa	48(%rsp), %xmm7
	vpaddd	%zmm21, %zmm22, %zmm25
	vmovd	%xmm7, %edi
	vpextrb	$1, %xmm7, %eax
	kmovd	%edi, %k3
	vmovupd	(%r8), %zmm26 {%k3} {z}
	vpslld	$3, %zmm25, %zmm25
	vaddpd	%zmm26, %zmm24, %zmm24
	kmovd	%eax, %k3
	vmovupd	(%r14), %zmm26 {%k3} {z}
	vmaxpd	%zmm1, %zmm24, %zmm24
	kmovq	%k2, %k3
	movq	280(%rsp), %rax
	vscatterdpd	%zmm24, (%rax,%ymm25) {%k3}
	vaddpd	%zmm26, %zmm23, %zmm23
	vmaxpd	%zmm1, %zmm23, %zmm23
	kshiftrw	$8, %k2, %k3
	vextractf64x4	$1, %zmm25, %ymm24
	vscatterdpd	%zmm23, (%rax,%ymm24) {%k3}
	vpsubd	%zmm17, %zmm22, %zmm22
	vpcmpgtd	%zmm22, %zmm2, %k2 {%k2}
	kortestw	%k2, %k2
	movl	%r9d, %r13d
	movl	%r10d, %esi
	movl	%r15d, %edi
	je	.LBB110_18
.LBB110_7:                              # %for_test61.preheader
                                        #   Parent Loop BB110_3 Depth=1
                                        #     Parent Loop BB110_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB110_10 Depth 4
                                        #           Child Loop BB110_12 Depth 5
                                        #             Child Loop BB110_14 Depth 6
	vpcmpgtd	%zmm1, %zmm3, %k3 {%k2}
	kortestw	%k3, %k3
	je	.LBB110_8
# %bb.9:                                # %for_loop62.preheader
                                        #   in Loop: Header=BB110_7 Depth=3
	vpxord	%xmm25, %xmm25, %xmm25
	movl	%r12d, %r11d
	vxorpd	%xmm24, %xmm24, %xmm24
	vxorpd	%xmm23, %xmm23, %xmm23
	jmp	.LBB110_10
	.p2align	4, 0x90
.LBB110_16:                             # %for_exit96
                                        #   in Loop: Header=BB110_10 Depth=4
	vpsubd	%zmm17, %zmm25, %zmm25
	vpcmpgtd	%zmm25, %zmm3, %k3 {%k3}
	addl	%ecx, %r11d
	kortestw	%k3, %k3
	je	.LBB110_17
.LBB110_10:                             # %for_loop62
                                        #   Parent Loop BB110_3 Depth=1
                                        #     Parent Loop BB110_5 Depth=2
                                        #       Parent Loop BB110_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB110_12 Depth 5
                                        #             Child Loop BB110_14 Depth 6
	vpcmpgtd	%zmm1, %zmm4, %k4 {%k3}
	kortestw	%k4, %k4
	je	.LBB110_16
# %bb.11:                               # %for_test110.preheader.lr.ph
                                        #   in Loop: Header=BB110_10 Depth=4
	vpaddd	%zmm18, %zmm25, %zmm26
	vpmulld	%zmm4, %zmm26, %zmm26
	vpxord	%xmm27, %xmm27, %xmm27
	movl	%r11d, %edi
	jmp	.LBB110_12
	.p2align	4, 0x90
.LBB110_15:                             # %for_exit113
                                        #   in Loop: Header=BB110_12 Depth=5
	vpsubd	%zmm17, %zmm27, %zmm27
	vpcmpgtd	%zmm27, %zmm4, %k4 {%k4}
	addl	%edx, %edi
	kortestw	%k4, %k4
	je	.LBB110_16
.LBB110_12:                             # %for_test110.preheader
                                        #   Parent Loop BB110_3 Depth=1
                                        #     Parent Loop BB110_5 Depth=2
                                        #       Parent Loop BB110_7 Depth=3
                                        #         Parent Loop BB110_10 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB110_14 Depth 6
	vpcmpgtd	%zmm1, %zmm5, %k5 {%k4}
	kortestw	%k5, %k5
	je	.LBB110_15
# %bb.13:                               # %for_loop111.lr.ph
                                        #   in Loop: Header=BB110_12 Depth=5
	vpaddd	%zmm26, %zmm27, %zmm28
	vpmulld	%zmm5, %zmm28, %zmm28
	vpxord	%xmm29, %xmm29, %xmm29
	movl	%edi, %r13d
	.p2align	4, 0x90
.LBB110_14:                             # %for_loop111
                                        #   Parent Loop BB110_3 Depth=1
                                        #     Parent Loop BB110_5 Depth=2
                                        #       Parent Loop BB110_7 Depth=3
                                        #         Parent Loop BB110_10 Depth=4
                                        #           Parent Loop BB110_12 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movslq	%r13d, %r13
	vbroadcastsd	(%rbx,%r13), %zmm30
	vpaddd	%zmm28, %zmm29, %zmm31
	vpslld	$3, %zmm31, %zmm31
	kshiftrw	$8, %k5, %k6
	vextracti64x4	$1, %zmm31, %ymm6
	kmovq	%k5, %k7
	vxorpd	%xmm7, %xmm7, %xmm7
	vgatherdpd	(%rbp,%ymm31), %zmm7 {%k7}
	kmovq	%k6, %k7
	vxorpd	%xmm31, %xmm31, %xmm31
	vgatherdpd	(%rbp,%ymm6), %zmm31 {%k7}
	vfmadd231pd	%zmm31, %zmm30, %zmm23 {%k6} # zmm23 {%k6} = (zmm30 * zmm31) + zmm23
	vfmadd231pd	%zmm7, %zmm30, %zmm24 {%k5} # zmm24 {%k5} = (zmm30 * zmm7) + zmm24
	vpsubd	%zmm17, %zmm29, %zmm29
	vpcmpgtd	%zmm29, %zmm5, %k5 {%k5}
	addl	$8, %r13d
	kortestw	%k5, %k5
	jne	.LBB110_14
	jmp	.LBB110_15
.LBB110_1:
	xorl	%r8d, %r8d
	movl	264(%rsp), %esi
	movl	240(%rsp), %edi
.LBB110_20:                             # %partial_inner_all_outer
	movq	88(%rsp), %rax                  # 8-byte Reload
	cmpl	%eax, %r8d
	movl	60(%rsp), %r10d                 # 4-byte Reload
	jge	.LBB110_37
# %bb.21:                               # %partial_inner_only
	vpbroadcastd	%r8d, %zmm1
	vpord	.LCPI110_0(%rip), %zmm1, %zmm17
	vpbroadcastd	%eax, %zmm1
	vpcmpgtd	%zmm17, %zmm1, %k1
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtd	%zmm1, %zmm0, %k1 {%k1}
	kortestw	%k1, %k1
	je	.LBB110_37
# %bb.22:                               # %for_test257.preheader.lr.ph
	vpbroadcastd	%esi, %zmm2
	movl	56(%rsp), %eax                  # 4-byte Reload
	vpbroadcastd	%eax, %zmm3
	vpbroadcastd	%edi, %zmm4
	vpbroadcastd	%r13d, %zmm5
	vpmulld	%zmm3, %zmm17, %zmm16
	vpmulld	%zmm0, %zmm17, %zmm17
	shll	$3, %r8d
	movslq	%r8d, %rax
	movq	296(%rsp), %rcx
	leaq	(%rcx,%rax), %r9
	addq	%rax, %rcx
	addq	$64, %rcx
	movq	80(%rsp), %rax                  # 8-byte Reload
	leal	(,%rax,8), %edx
	imull	%eax, %r10d
	shll	$3, %r10d
	xorl	%r8d, %r8d
	vpternlogd	$255, %zmm18, %zmm18, %zmm18
	vpxord	%xmm19, %xmm19, %xmm19
	jmp	.LBB110_23
	.p2align	4, 0x90
.LBB110_36:                             # %for_exit260
                                        #   in Loop: Header=BB110_23 Depth=1
	vpsubd	%zmm18, %zmm19, %zmm19
	vpcmpgtd	%zmm19, %zmm0, %k1 {%k1}
	addl	%edx, %r8d
	kortestw	%k1, %k1
	je	.LBB110_37
.LBB110_23:                             # %for_test257.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB110_25 Depth 2
                                        #       Child Loop BB110_28 Depth 3
                                        #         Child Loop BB110_30 Depth 4
                                        #           Child Loop BB110_32 Depth 5
	vpcmpgtd	%zmm1, %zmm2, %k2 {%k1}
	kortestw	%k2, %k2
	je	.LBB110_36
# %bb.24:                               # %for_test277.preheader.lr.ph
                                        #   in Loop: Header=BB110_23 Depth=1
	vpaddd	%zmm17, %zmm19, %zmm20
	vpmulld	%zmm2, %zmm20, %zmm20
	vpxord	%xmm21, %xmm21, %xmm21
	jmp	.LBB110_25
	.p2align	4, 0x90
.LBB110_26:                             #   in Loop: Header=BB110_25 Depth=2
	vxorpd	%xmm23, %xmm23, %xmm23
	vpxord	%xmm22, %xmm22, %xmm22
.LBB110_35:                             # %for_exit280
                                        #   in Loop: Header=BB110_25 Depth=2
	kmovw	%k2, 32(%rsp)
	vmovdqa	32(%rsp), %xmm7
	vpaddd	%zmm20, %zmm21, %zmm24
	vmovd	%xmm7, %eax
	vpextrb	$1, %xmm7, %edi
	kmovd	%eax, %k3
	vmovupd	(%r9), %zmm25 {%k3} {z}
	vpslld	$3, %zmm24, %zmm24
	vaddpd	%zmm25, %zmm23, %zmm23
	kmovd	%edi, %k3
	vmovupd	(%rcx), %zmm25 {%k3} {z}
	vmaxpd	%zmm1, %zmm23, %zmm23
	kmovq	%k2, %k3
	movq	280(%rsp), %rax
	vscatterdpd	%zmm23, (%rax,%ymm24) {%k3}
	vaddpd	%zmm25, %zmm22, %zmm22
	vmaxpd	%zmm1, %zmm22, %zmm22
	kshiftrw	$8, %k2, %k3
	vextractf64x4	$1, %zmm24, %ymm23
	vscatterdpd	%zmm22, (%rax,%ymm23) {%k3}
	vpsubd	%zmm18, %zmm21, %zmm21
	vpcmpgtd	%zmm21, %zmm2, %k2 {%k2}
	kortestw	%k2, %k2
	je	.LBB110_36
.LBB110_25:                             # %for_test277.preheader
                                        #   Parent Loop BB110_23 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB110_28 Depth 3
                                        #         Child Loop BB110_30 Depth 4
                                        #           Child Loop BB110_32 Depth 5
	vpcmpgtd	%zmm1, %zmm3, %k3 {%k2}
	kortestw	%k3, %k3
	je	.LBB110_26
# %bb.27:                               # %for_loop278.preheader
                                        #   in Loop: Header=BB110_25 Depth=2
	vxorpd	%xmm24, %xmm24, %xmm24
	movl	%r8d, %edi
	vxorpd	%xmm23, %xmm23, %xmm23
	vpxord	%xmm22, %xmm22, %xmm22
	jmp	.LBB110_28
	.p2align	4, 0x90
.LBB110_34:                             # %for_exit321
                                        #   in Loop: Header=BB110_28 Depth=3
	vpsubd	%zmm18, %zmm24, %zmm24
	vpcmpgtd	%zmm24, %zmm3, %k3 {%k3}
	addl	%r10d, %edi
	kortestw	%k3, %k3
	je	.LBB110_35
.LBB110_28:                             # %for_loop278
                                        #   Parent Loop BB110_23 Depth=1
                                        #     Parent Loop BB110_25 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB110_30 Depth 4
                                        #           Child Loop BB110_32 Depth 5
	vpcmpgtd	%zmm1, %zmm4, %k4 {%k3}
	kortestw	%k4, %k4
	je	.LBB110_34
# %bb.29:                               # %for_test337.preheader.lr.ph
                                        #   in Loop: Header=BB110_28 Depth=3
	vpaddd	%zmm16, %zmm24, %zmm25
	vpmulld	%zmm4, %zmm25, %zmm25
	vxorpd	%xmm26, %xmm26, %xmm26
	movl	%edi, %esi
	jmp	.LBB110_30
	.p2align	4, 0x90
.LBB110_33:                             # %for_exit340
                                        #   in Loop: Header=BB110_30 Depth=4
	vpsubd	%zmm18, %zmm26, %zmm26
	vpcmpgtd	%zmm26, %zmm4, %k4 {%k4}
	addl	%edx, %esi
	kortestw	%k4, %k4
	je	.LBB110_34
.LBB110_30:                             # %for_test337.preheader
                                        #   Parent Loop BB110_23 Depth=1
                                        #     Parent Loop BB110_25 Depth=2
                                        #       Parent Loop BB110_28 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB110_32 Depth 5
	vpcmpgtd	%zmm1, %zmm5, %k5 {%k4}
	kortestw	%k5, %k5
	je	.LBB110_33
# %bb.31:                               # %for_loop338.lr.ph
                                        #   in Loop: Header=BB110_30 Depth=4
	vpaddd	%zmm25, %zmm26, %zmm27
	vpmulld	%zmm5, %zmm27, %zmm27
	vpxord	%xmm28, %xmm28, %xmm28
	movl	%esi, %eax
	.p2align	4, 0x90
.LBB110_32:                             # %for_loop338
                                        #   Parent Loop BB110_23 Depth=1
                                        #     Parent Loop BB110_25 Depth=2
                                        #       Parent Loop BB110_28 Depth=3
                                        #         Parent Loop BB110_30 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	cltq
	vbroadcastsd	(%rbx,%rax), %zmm29
	vpaddd	%zmm27, %zmm28, %zmm30
	vpslld	$3, %zmm30, %zmm30
	kshiftrw	$8, %k5, %k6
	vextracti64x4	$1, %zmm30, %ymm31
	vxorpd	%xmm6, %xmm6, %xmm6
	kmovq	%k5, %k7
	vgatherdpd	(%rbp,%ymm30), %zmm6 {%k7}
	kmovq	%k6, %k7
	vxorpd	%xmm30, %xmm30, %xmm30
	vgatherdpd	(%rbp,%ymm31), %zmm30 {%k7}
	vfmadd231pd	%zmm30, %zmm29, %zmm22 {%k6} # zmm22 {%k6} = (zmm29 * zmm30) + zmm22
	vfmadd231pd	%zmm6, %zmm29, %zmm23 {%k5} # zmm23 {%k5} = (zmm29 * zmm6) + zmm23
	vpsubd	%zmm18, %zmm28, %zmm28
	vpcmpgtd	%zmm28, %zmm5, %k5 {%k5}
	addl	$8, %eax
	kortestw	%k5, %k5
	jne	.LBB110_32
	jmp	.LBB110_33
.LBB110_37:                             # %foreach_reset
	vmovaps	96(%rsp), %xmm6                 # 16-byte Reload
	vmovaps	112(%rsp), %xmm7                # 16-byte Reload
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	vzeroupper
	retq
                                        # -- End function
	.def	 dot_forward_ispc___uniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	6                               # -- Begin function dot_forward_ispc___uniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_
.LCPI111_0:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
	.text
	.globl	dot_forward_ispc___uniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_
	.p2align	4, 0x90
dot_forward_ispc___uniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_: # @dot_forward_ispc___uniuniun_3C_und_3E_un_3C_und_3E_un_3C_und_3E_un_3C_und_3E_
# %bb.0:                                # %allocas
	pushq	%r15
	pushq	%r14
	pushq	%rsi
	pushq	%rdi
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
                                        # kill: def $edx killed $edx def $rdx
	movq	136(%rsp), %r10
	movq	128(%rsp), %rax
	leal	15(%rdx), %r11d
	testl	%edx, %edx
	cmovnsl	%edx, %r11d
	vpbroadcastd	%ecx, %zmm0
	andl	$-16, %r11d
	jle	.LBB111_1
# %bb.2:                                # %for_test.preheader.lr.ph
	vpxord	%xmm17, %xmm17, %xmm17
	vpcmpgtd	%zmm17, %zmm0, %k0
	kortestw	%k0, %k0
	je	.LBB111_7
# %bb.3:                                # %for_loop.lr.ph.preheader
	leal	(,%rdx,8), %esi
	xorl	%r15d, %r15d
	vpternlogd	$255, %zmm2, %zmm2, %zmm2
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB111_4:                              # %for_loop.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB111_5 Depth 2
	vpxor	%xmm3, %xmm3, %xmm3
	xorl	%ebx, %ebx
	movl	%r15d, %ecx
	kmovq	%k0, %k1
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB111_5:                              # %for_loop
                                        #   Parent Loop BB111_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpsubd	%zmm2, %zmm3, %zmm3
	movslq	%ebx, %rbx
	vbroadcastsd	(%r8,%rbx), %zmm16
	movslq	%ecx, %rcx
	kmovw	%k1, 32(%rsp)
	vmovdqa	32(%rsp), %xmm1
	vpextrb	$1, %xmm1, %ebp
	vmovd	%xmm1, %edi
	kmovd	%edi, %k2
	vmovupd	(%rax,%rcx), %zmm1 {%k2} {z}
	kmovd	%ebp, %k2
	vmovupd	64(%rax,%rcx), %zmm18 {%k2} {z}
	kshiftrw	$8, %k1, %k2
	vfmadd231pd	%zmm18, %zmm16, %zmm5 {%k2} # zmm5 {%k2} = (zmm16 * zmm18) + zmm5
	vfmadd231pd	%zmm1, %zmm16, %zmm4 {%k1} # zmm4 {%k1} = (zmm16 * zmm1) + zmm4
	vpcmpgtd	%zmm3, %zmm0, %k1 {%k1}
	addl	%esi, %ecx
	addl	$8, %ebx
	kortestw	%k1, %k1
	jne	.LBB111_5
# %bb.6:                                # %for_exit
                                        #   in Loop: Header=BB111_4 Depth=1
	leal	(,%r14,8), %ecx
	movslq	%ecx, %rcx
	vaddpd	64(%r10,%rcx), %zmm5, %zmm1
	vaddpd	(%r10,%rcx), %zmm4, %zmm3
	vmaxpd	%zmm17, %zmm1, %zmm1
	vmovupd	%zmm1, 64(%r9,%rcx)
	vmaxpd	%zmm17, %zmm3, %zmm1
	vmovupd	%zmm1, (%r9,%rcx)
	addl	$16, %r14d
	subl	$-128, %r15d
	cmpl	%r11d, %r14d
	jl	.LBB111_4
	jmp	.LBB111_9
.LBB111_1:
	xorl	%r14d, %r14d
	jmp	.LBB111_9
.LBB111_7:                              # %for_exit.us.preheader
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB111_8:                              # %for_exit.us
                                        # =>This Inner Loop Header: Depth=1
	movslq	%ecx, %rcx
	vaddpd	64(%r10,%rcx), %zmm17, %zmm2
	vaddpd	(%r10,%rcx), %zmm17, %zmm3
	vmaxpd	%zmm17, %zmm2, %zmm2
	vmovupd	%zmm2, 64(%r9,%rcx)
	vmaxpd	%zmm17, %zmm3, %zmm2
	vmovupd	%zmm2, (%r9,%rcx)
	addl	$16, %r14d
	subl	$-128, %ecx
	cmpl	%r11d, %r14d
	jl	.LBB111_8
.LBB111_9:                              # %partial_inner_all_outer
	cmpl	%edx, %r14d
	jge	.LBB111_15
# %bb.10:                               # %partial_inner_only
	vpbroadcastd	%r14d, %zmm1
	vpord	.LCPI111_0(%rip), %zmm1, %zmm2
	vpbroadcastd	%edx, %zmm3
	vpxord	%xmm19, %xmm19, %xmm19
	vpcmpgtd	%zmm19, %zmm0, %k1
	vpcmpgtd	%zmm2, %zmm3, %k1 {%k1}
	kortestw	%k1, %k1
	je	.LBB111_11
# %bb.12:                               # %for_loop97.lr.ph
	leal	(,%r14,8), %edi
	shll	$3, %edx
	vxorpd	%xmm16, %xmm16, %xmm16
	xorl	%esi, %esi
	vpternlogd	$255, %zmm17, %zmm17, %zmm17
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB111_13:                             # %for_loop97
                                        # =>This Inner Loop Header: Depth=1
	vpsubd	%zmm17, %zmm16, %zmm16
	movslq	%esi, %rsi
	vbroadcastsd	(%r8,%rsi), %zmm18
	movslq	%edi, %rdi
	kmovw	%k1, 16(%rsp)
	vmovdqa	16(%rsp), %xmm1
	vpextrb	$1, %xmm1, %ecx
	vmovd	%xmm1, %ebp
	kmovd	%ebp, %k2
	vmovupd	(%rax,%rdi), %zmm1 {%k2} {z}
	kmovd	%ecx, %k2
	vmovupd	64(%rax,%rdi), %zmm20 {%k2} {z}
	kshiftrw	$8, %k1, %k2
	vfmadd231pd	%zmm20, %zmm18, %zmm4 {%k2} # zmm4 {%k2} = (zmm18 * zmm20) + zmm4
	vfmadd231pd	%zmm1, %zmm18, %zmm5 {%k1} # zmm5 {%k1} = (zmm18 * zmm1) + zmm5
	vpcmpgtd	%zmm16, %zmm0, %k1 {%k1}
	addl	%edx, %edi
	addl	$8, %esi
	kortestw	%k1, %k1
	jne	.LBB111_13
	jmp	.LBB111_14
.LBB111_11:
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm4, %xmm4, %xmm4
.LBB111_14:                             # %for_exit99
	vpcmpgtd	%zmm2, %zmm3, %k0
	kmovw	%k0, (%rsp)
	vmovdqa	(%rsp), %xmm0
	shll	$3, %r14d
	movslq	%r14d, %rax
	vmovd	%xmm0, %ecx
	vpextrb	$1, %xmm0, %edx
	kmovd	%ecx, %k1
	vmovupd	(%r10,%rax), %zmm0 {%k1} {z}
	vaddpd	%zmm0, %zmm5, %zmm0
	kmovd	%edx, %k2
	vmovupd	64(%r10,%rax), %zmm1 {%k2} {z}
	vaddpd	%zmm1, %zmm4, %zmm1
	vmaxpd	%zmm19, %zmm1, %zmm1
	vmaxpd	%zmm19, %zmm0, %zmm0
	vmovupd	%zmm0, (%r9,%rax) {%k1}
	vmovupd	%zmm1, 64(%r9,%rax) {%k2}
.LBB111_15:                             # %foreach_reset
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	vzeroupper
	retq
                                        # -- End function
	.def	 conv_forward_ispc;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	6                               # -- Begin function conv_forward_ispc
.LCPI112_0:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
	.text
	.globl	conv_forward_ispc
	.p2align	4, 0x90
conv_forward_ispc:                      # @conv_forward_ispc
# %bb.0:                                # %allocas
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rsi
	pushq	%rdi
	pushq	%rbp
	pushq	%rbx
	subq	$136, %rsp
	vmovapd	%xmm7, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm6, 96(%rsp)                 # 16-byte Spill
	movl	%r9d, %edi
	movl	%r8d, %r14d
	movl	%edx, %esi
	movl	%ecx, %r15d
	movq	288(%rsp), %rbp
	movq	272(%rsp), %rbx
	movl	256(%rsp), %r12d
	movl	248(%rsp), %r13d
	leaq	__str.2(%rip), %rcx
	leaq	__str.3(%rip), %rdx
	movl	$65535, %r8d                    # imm = 0xFFFF
	callq	__do_print
	leal	15(%r15), %eax
	testl	%r15d, %r15d
	movq	%r15, 88(%rsp)                  # 8-byte Spill
	cmovnsl	%r15d, %eax
	vpbroadcastd	%r12d, %zmm0
	andl	$-16, %eax
	movl	%eax, 68(%rsp)                  # 4-byte Spill
	movq	%rdi, 80(%rsp)                  # 8-byte Spill
	movl	%esi, 56(%rsp)                  # 4-byte Spill
	movl	%r14d, 60(%rsp)                 # 4-byte Spill
	jle	.LBB112_1
# %bb.2:                                # %foreach_full_body.lr.ph
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtd	%zmm1, %zmm0, %k0
	kmovd	%k0, %eax
	movl	%eax, 64(%rsp)                  # 4-byte Spill
	movl	264(%rsp), %r10d
	vpbroadcastd	%r10d, %zmm2
	vpbroadcastd	%esi, %zmm3
	movl	240(%rsp), %eax
	vpbroadcastd	%eax, %zmm4
	vpbroadcastd	%r13d, %zmm5
	leal	(,%rdi,8), %edx
	movl	%edi, %ecx
	imull	%r14d, %ecx
	shll	$3, %ecx
	xorl	%r8d, %r8d
	vmovdqa64	.LCPI112_0(%rip), %zmm16 # zmm16 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	vpternlogd	$255, %zmm17, %zmm17, %zmm17
	movl	%r13d, %r9d
	movl	%r10d, %esi
	movl	%eax, %edi
	jmp	.LBB112_3
	.p2align	4, 0x90
.LBB112_19:                             # %for_exit
                                        #   in Loop: Header=BB112_3 Depth=1
	movq	72(%rsp), %r8                   # 8-byte Reload
	addl	$16, %r8d
	cmpl	68(%rsp), %r8d                  # 4-byte Folded Reload
	jge	.LBB112_20
.LBB112_3:                              # %foreach_full_body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB112_5 Depth 2
                                        #       Child Loop BB112_7 Depth 3
                                        #         Child Loop BB112_10 Depth 4
                                        #           Child Loop BB112_12 Depth 5
                                        #             Child Loop BB112_14 Depth 6
	movq	%r8, 72(%rsp)                   # 8-byte Spill
	cmpw	$0, 64(%rsp)                    # 2-byte Folded Reload
	je	.LBB112_19
# %bb.4:                                # %for_test29.preheader.lr.ph
                                        #   in Loop: Header=BB112_3 Depth=1
	movq	72(%rsp), %rax                  # 8-byte Reload
	vpbroadcastd	%eax, %zmm18
	vpord	%zmm16, %zmm18, %zmm19
	vpmulld	%zmm3, %zmm19, %zmm18
	vpmulld	%zmm0, %zmm19, %zmm19
	leal	(,%rax,8), %eax
	movl	%edi, %r15d
	movslq	%eax, %r11
	movq	296(%rsp), %rax
	leaq	(%rax,%r11), %r8
	leaq	(%rax,%r11), %r14
	addq	$64, %r14
	vpxord	%xmm20, %xmm20, %xmm20
	xorl	%r12d, %r12d
	kmovq	%k0, %k1
	jmp	.LBB112_5
	.p2align	4, 0x90
.LBB112_18:                             # %for_exit32
                                        #   in Loop: Header=BB112_5 Depth=2
	vpsubd	%zmm17, %zmm20, %zmm20
	vpcmpgtd	%zmm20, %zmm0, %k1 {%k1}
	addl	%edx, %r12d
	kortestw	%k1, %k1
	je	.LBB112_19
.LBB112_5:                              # %for_test29.preheader
                                        #   Parent Loop BB112_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB112_7 Depth 3
                                        #         Child Loop BB112_10 Depth 4
                                        #           Child Loop BB112_12 Depth 5
                                        #             Child Loop BB112_14 Depth 6
	vpcmpgtd	%zmm1, %zmm2, %k2 {%k1}
	kortestw	%k2, %k2
	je	.LBB112_18
# %bb.6:                                # %for_test41.preheader.lr.ph
                                        #   in Loop: Header=BB112_5 Depth=2
	vpaddd	%zmm19, %zmm20, %zmm21
	vpmulld	%zmm2, %zmm21, %zmm21
	vpxord	%xmm22, %xmm22, %xmm22
	jmp	.LBB112_7
	.p2align	4, 0x90
.LBB112_8:                              #   in Loop: Header=BB112_7 Depth=3
	vxorpd	%xmm24, %xmm24, %xmm24
	vxorpd	%xmm23, %xmm23, %xmm23
.LBB112_17:                             # %for_exit44
                                        #   in Loop: Header=BB112_7 Depth=3
	kmovw	%k2, 48(%rsp)
	vmovdqa	48(%rsp), %xmm7
	vpaddd	%zmm21, %zmm22, %zmm25
	vmovd	%xmm7, %edi
	vpextrb	$1, %xmm7, %eax
	kmovd	%edi, %k3
	vmovupd	(%r8), %zmm26 {%k3} {z}
	vpslld	$3, %zmm25, %zmm25
	vaddpd	%zmm26, %zmm24, %zmm24
	kmovd	%eax, %k3
	vmovupd	(%r14), %zmm26 {%k3} {z}
	vmaxpd	%zmm1, %zmm24, %zmm24
	kmovq	%k2, %k3
	movq	280(%rsp), %rax
	vscatterdpd	%zmm24, (%rax,%ymm25) {%k3}
	vaddpd	%zmm26, %zmm23, %zmm23
	vmaxpd	%zmm1, %zmm23, %zmm23
	kshiftrw	$8, %k2, %k3
	vextractf64x4	$1, %zmm25, %ymm24
	vscatterdpd	%zmm23, (%rax,%ymm24) {%k3}
	vpsubd	%zmm17, %zmm22, %zmm22
	vpcmpgtd	%zmm22, %zmm2, %k2 {%k2}
	kortestw	%k2, %k2
	movl	%r9d, %r13d
	movl	%r10d, %esi
	movl	%r15d, %edi
	je	.LBB112_18
.LBB112_7:                              # %for_test41.preheader
                                        #   Parent Loop BB112_3 Depth=1
                                        #     Parent Loop BB112_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB112_10 Depth 4
                                        #           Child Loop BB112_12 Depth 5
                                        #             Child Loop BB112_14 Depth 6
	vpcmpgtd	%zmm1, %zmm3, %k3 {%k2}
	kortestw	%k3, %k3
	je	.LBB112_8
# %bb.9:                                # %for_loop42.preheader
                                        #   in Loop: Header=BB112_7 Depth=3
	vpxord	%xmm25, %xmm25, %xmm25
	movl	%r12d, %r11d
	vxorpd	%xmm24, %xmm24, %xmm24
	vxorpd	%xmm23, %xmm23, %xmm23
	jmp	.LBB112_10
	.p2align	4, 0x90
.LBB112_16:                             # %for_exit72
                                        #   in Loop: Header=BB112_10 Depth=4
	vpsubd	%zmm17, %zmm25, %zmm25
	vpcmpgtd	%zmm25, %zmm3, %k3 {%k3}
	addl	%ecx, %r11d
	kortestw	%k3, %k3
	je	.LBB112_17
.LBB112_10:                             # %for_loop42
                                        #   Parent Loop BB112_3 Depth=1
                                        #     Parent Loop BB112_5 Depth=2
                                        #       Parent Loop BB112_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB112_12 Depth 5
                                        #             Child Loop BB112_14 Depth 6
	vpcmpgtd	%zmm1, %zmm4, %k4 {%k3}
	kortestw	%k4, %k4
	je	.LBB112_16
# %bb.11:                               # %for_test82.preheader.lr.ph
                                        #   in Loop: Header=BB112_10 Depth=4
	vpaddd	%zmm18, %zmm25, %zmm26
	vpmulld	%zmm4, %zmm26, %zmm26
	vpxord	%xmm27, %xmm27, %xmm27
	movl	%r11d, %edi
	jmp	.LBB112_12
	.p2align	4, 0x90
.LBB112_15:                             # %for_exit85
                                        #   in Loop: Header=BB112_12 Depth=5
	vpsubd	%zmm17, %zmm27, %zmm27
	vpcmpgtd	%zmm27, %zmm4, %k4 {%k4}
	addl	%edx, %edi
	kortestw	%k4, %k4
	je	.LBB112_16
.LBB112_12:                             # %for_test82.preheader
                                        #   Parent Loop BB112_3 Depth=1
                                        #     Parent Loop BB112_5 Depth=2
                                        #       Parent Loop BB112_7 Depth=3
                                        #         Parent Loop BB112_10 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB112_14 Depth 6
	vpcmpgtd	%zmm1, %zmm5, %k5 {%k4}
	kortestw	%k5, %k5
	je	.LBB112_15
# %bb.13:                               # %for_loop83.lr.ph
                                        #   in Loop: Header=BB112_12 Depth=5
	vpaddd	%zmm26, %zmm27, %zmm28
	vpmulld	%zmm5, %zmm28, %zmm28
	vpxord	%xmm29, %xmm29, %xmm29
	movl	%edi, %r13d
	.p2align	4, 0x90
.LBB112_14:                             # %for_loop83
                                        #   Parent Loop BB112_3 Depth=1
                                        #     Parent Loop BB112_5 Depth=2
                                        #       Parent Loop BB112_7 Depth=3
                                        #         Parent Loop BB112_10 Depth=4
                                        #           Parent Loop BB112_12 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	movslq	%r13d, %r13
	vbroadcastsd	(%rbx,%r13), %zmm30
	vpaddd	%zmm28, %zmm29, %zmm31
	vpslld	$3, %zmm31, %zmm31
	kshiftrw	$8, %k5, %k6
	vextracti64x4	$1, %zmm31, %ymm6
	vxorpd	%xmm7, %xmm7, %xmm7
	kmovq	%k5, %k7
	vgatherdpd	(%rbp,%ymm31), %zmm7 {%k7}
	vxorpd	%xmm31, %xmm31, %xmm31
	kmovq	%k6, %k7
	vgatherdpd	(%rbp,%ymm6), %zmm31 {%k7}
	vfmadd231pd	%zmm31, %zmm30, %zmm23 {%k6} # zmm23 {%k6} = (zmm30 * zmm31) + zmm23
	vfmadd231pd	%zmm7, %zmm30, %zmm24 {%k5} # zmm24 {%k5} = (zmm30 * zmm7) + zmm24
	vpsubd	%zmm17, %zmm29, %zmm29
	vpcmpgtd	%zmm29, %zmm5, %k5 {%k5}
	addl	$8, %r13d
	kortestw	%k5, %k5
	jne	.LBB112_14
	jmp	.LBB112_15
.LBB112_1:
	xorl	%r8d, %r8d
	movl	264(%rsp), %esi
	movl	240(%rsp), %edi
.LBB112_20:                             # %partial_inner_all_outer
	movq	88(%rsp), %rax                  # 8-byte Reload
	cmpl	%eax, %r8d
	movl	60(%rsp), %r10d                 # 4-byte Reload
	jge	.LBB112_37
# %bb.21:                               # %partial_inner_only
	vpbroadcastd	%r8d, %zmm1
	vpord	.LCPI112_0(%rip), %zmm1, %zmm17
	vpbroadcastd	%eax, %zmm1
	vpcmpgtd	%zmm17, %zmm1, %k1
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtd	%zmm1, %zmm0, %k1 {%k1}
	kortestw	%k1, %k1
	je	.LBB112_37
# %bb.22:                               # %for_test187.preheader.lr.ph
	vpbroadcastd	%esi, %zmm2
	movl	56(%rsp), %eax                  # 4-byte Reload
	vpbroadcastd	%eax, %zmm3
	vpbroadcastd	%edi, %zmm4
	vpbroadcastd	%r13d, %zmm5
	vpmulld	%zmm3, %zmm17, %zmm16
	vpmulld	%zmm0, %zmm17, %zmm17
	shll	$3, %r8d
	movslq	%r8d, %rax
	movq	296(%rsp), %rcx
	leaq	(%rcx,%rax), %r9
	addq	%rax, %rcx
	addq	$64, %rcx
	movq	80(%rsp), %rax                  # 8-byte Reload
	leal	(,%rax,8), %edx
	imull	%eax, %r10d
	shll	$3, %r10d
	xorl	%r8d, %r8d
	vpternlogd	$255, %zmm18, %zmm18, %zmm18
	vpxord	%xmm19, %xmm19, %xmm19
	jmp	.LBB112_23
	.p2align	4, 0x90
.LBB112_36:                             # %for_exit190
                                        #   in Loop: Header=BB112_23 Depth=1
	vpsubd	%zmm18, %zmm19, %zmm19
	vpcmpgtd	%zmm19, %zmm0, %k1 {%k1}
	addl	%edx, %r8d
	kortestw	%k1, %k1
	je	.LBB112_37
.LBB112_23:                             # %for_test187.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB112_25 Depth 2
                                        #       Child Loop BB112_28 Depth 3
                                        #         Child Loop BB112_30 Depth 4
                                        #           Child Loop BB112_32 Depth 5
	vpcmpgtd	%zmm1, %zmm2, %k2 {%k1}
	kortestw	%k2, %k2
	je	.LBB112_36
# %bb.24:                               # %for_test203.preheader.lr.ph
                                        #   in Loop: Header=BB112_23 Depth=1
	vpaddd	%zmm17, %zmm19, %zmm20
	vpmulld	%zmm2, %zmm20, %zmm20
	vpxord	%xmm21, %xmm21, %xmm21
	jmp	.LBB112_25
	.p2align	4, 0x90
.LBB112_26:                             #   in Loop: Header=BB112_25 Depth=2
	vxorpd	%xmm23, %xmm23, %xmm23
	vpxord	%xmm22, %xmm22, %xmm22
.LBB112_35:                             # %for_exit206
                                        #   in Loop: Header=BB112_25 Depth=2
	kmovw	%k2, 32(%rsp)
	vmovdqa	32(%rsp), %xmm7
	vpaddd	%zmm20, %zmm21, %zmm24
	vmovd	%xmm7, %eax
	vpextrb	$1, %xmm7, %edi
	kmovd	%eax, %k3
	vmovupd	(%r9), %zmm25 {%k3} {z}
	vpslld	$3, %zmm24, %zmm24
	vaddpd	%zmm25, %zmm23, %zmm23
	kmovd	%edi, %k3
	vmovupd	(%rcx), %zmm25 {%k3} {z}
	vmaxpd	%zmm1, %zmm23, %zmm23
	kmovq	%k2, %k3
	movq	280(%rsp), %rax
	vscatterdpd	%zmm23, (%rax,%ymm24) {%k3}
	vaddpd	%zmm25, %zmm22, %zmm22
	vmaxpd	%zmm1, %zmm22, %zmm22
	kshiftrw	$8, %k2, %k3
	vextractf64x4	$1, %zmm24, %ymm23
	vscatterdpd	%zmm22, (%rax,%ymm23) {%k3}
	vpsubd	%zmm18, %zmm21, %zmm21
	vpcmpgtd	%zmm21, %zmm2, %k2 {%k2}
	kortestw	%k2, %k2
	je	.LBB112_36
.LBB112_25:                             # %for_test203.preheader
                                        #   Parent Loop BB112_23 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB112_28 Depth 3
                                        #         Child Loop BB112_30 Depth 4
                                        #           Child Loop BB112_32 Depth 5
	vpcmpgtd	%zmm1, %zmm3, %k3 {%k2}
	kortestw	%k3, %k3
	je	.LBB112_26
# %bb.27:                               # %for_loop204.preheader
                                        #   in Loop: Header=BB112_25 Depth=2
	vxorpd	%xmm24, %xmm24, %xmm24
	movl	%r8d, %edi
	vxorpd	%xmm23, %xmm23, %xmm23
	vpxord	%xmm22, %xmm22, %xmm22
	jmp	.LBB112_28
	.p2align	4, 0x90
.LBB112_34:                             # %for_exit243
                                        #   in Loop: Header=BB112_28 Depth=3
	vpsubd	%zmm18, %zmm24, %zmm24
	vpcmpgtd	%zmm24, %zmm3, %k3 {%k3}
	addl	%r10d, %edi
	kortestw	%k3, %k3
	je	.LBB112_35
.LBB112_28:                             # %for_loop204
                                        #   Parent Loop BB112_23 Depth=1
                                        #     Parent Loop BB112_25 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB112_30 Depth 4
                                        #           Child Loop BB112_32 Depth 5
	vpcmpgtd	%zmm1, %zmm4, %k4 {%k3}
	kortestw	%k4, %k4
	je	.LBB112_34
# %bb.29:                               # %for_test255.preheader.lr.ph
                                        #   in Loop: Header=BB112_28 Depth=3
	vpaddd	%zmm16, %zmm24, %zmm25
	vpmulld	%zmm4, %zmm25, %zmm25
	vxorpd	%xmm26, %xmm26, %xmm26
	movl	%edi, %esi
	jmp	.LBB112_30
	.p2align	4, 0x90
.LBB112_33:                             # %for_exit258
                                        #   in Loop: Header=BB112_30 Depth=4
	vpsubd	%zmm18, %zmm26, %zmm26
	vpcmpgtd	%zmm26, %zmm4, %k4 {%k4}
	addl	%edx, %esi
	kortestw	%k4, %k4
	je	.LBB112_34
.LBB112_30:                             # %for_test255.preheader
                                        #   Parent Loop BB112_23 Depth=1
                                        #     Parent Loop BB112_25 Depth=2
                                        #       Parent Loop BB112_28 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB112_32 Depth 5
	vpcmpgtd	%zmm1, %zmm5, %k5 {%k4}
	kortestw	%k5, %k5
	je	.LBB112_33
# %bb.31:                               # %for_loop256.lr.ph
                                        #   in Loop: Header=BB112_30 Depth=4
	vpaddd	%zmm25, %zmm26, %zmm27
	vpmulld	%zmm5, %zmm27, %zmm27
	vpxord	%xmm28, %xmm28, %xmm28
	movl	%esi, %eax
	.p2align	4, 0x90
.LBB112_32:                             # %for_loop256
                                        #   Parent Loop BB112_23 Depth=1
                                        #     Parent Loop BB112_25 Depth=2
                                        #       Parent Loop BB112_28 Depth=3
                                        #         Parent Loop BB112_30 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	cltq
	vbroadcastsd	(%rbx,%rax), %zmm29
	vpaddd	%zmm27, %zmm28, %zmm30
	vpslld	$3, %zmm30, %zmm30
	kshiftrw	$8, %k5, %k6
	vextracti64x4	$1, %zmm30, %ymm31
	vxorpd	%xmm6, %xmm6, %xmm6
	kmovq	%k5, %k7
	vgatherdpd	(%rbp,%ymm30), %zmm6 {%k7}
	kmovq	%k6, %k7
	vxorpd	%xmm30, %xmm30, %xmm30
	vgatherdpd	(%rbp,%ymm31), %zmm30 {%k7}
	vfmadd231pd	%zmm30, %zmm29, %zmm22 {%k6} # zmm22 {%k6} = (zmm29 * zmm30) + zmm22
	vfmadd231pd	%zmm6, %zmm29, %zmm23 {%k5} # zmm23 {%k5} = (zmm29 * zmm6) + zmm23
	vpsubd	%zmm18, %zmm28, %zmm28
	vpcmpgtd	%zmm28, %zmm5, %k5 {%k5}
	addl	$8, %eax
	kortestw	%k5, %k5
	jne	.LBB112_32
	jmp	.LBB112_33
.LBB112_37:                             # %foreach_reset
	vmovaps	96(%rsp), %xmm6                 # 16-byte Reload
	vmovaps	112(%rsp), %xmm7                # 16-byte Reload
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	vzeroupper
	retq
                                        # -- End function
	.def	 dot_forward_ispc;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	6                               # -- Begin function dot_forward_ispc
.LCPI113_0:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
	.text
	.globl	dot_forward_ispc
	.p2align	4, 0x90
dot_forward_ispc:                       # @dot_forward_ispc
# %bb.0:                                # %allocas
	pushq	%r15
	pushq	%r14
	pushq	%rsi
	pushq	%rdi
	pushq	%rbp
	pushq	%rbx
	subq	$40, %rsp
                                        # kill: def $edx killed $edx def $rdx
	movq	136(%rsp), %r10
	movq	128(%rsp), %rax
	leal	15(%rdx), %r11d
	testl	%edx, %edx
	cmovnsl	%edx, %r11d
	vpbroadcastd	%ecx, %zmm0
	andl	$-16, %r11d
	jle	.LBB113_1
# %bb.2:                                # %for_test.preheader.lr.ph
	vpxord	%xmm17, %xmm17, %xmm17
	vpcmpgtd	%zmm17, %zmm0, %k0
	kortestw	%k0, %k0
	je	.LBB113_7
# %bb.3:                                # %for_loop.lr.ph.preheader
	leal	(,%rdx,8), %esi
	xorl	%r15d, %r15d
	vpternlogd	$255, %zmm2, %zmm2, %zmm2
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB113_4:                              # %for_loop.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB113_5 Depth 2
	vpxor	%xmm3, %xmm3, %xmm3
	xorl	%ebx, %ebx
	movl	%r15d, %ecx
	kmovq	%k0, %k1
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB113_5:                              # %for_loop
                                        #   Parent Loop BB113_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpsubd	%zmm2, %zmm3, %zmm3
	movslq	%ebx, %rbx
	vbroadcastsd	(%r8,%rbx), %zmm16
	movslq	%ecx, %rcx
	kmovw	%k1, 32(%rsp)
	vmovdqa	32(%rsp), %xmm1
	vpextrb	$1, %xmm1, %ebp
	vmovd	%xmm1, %edi
	kmovd	%edi, %k2
	vmovupd	(%rax,%rcx), %zmm1 {%k2} {z}
	kmovd	%ebp, %k2
	vmovupd	64(%rax,%rcx), %zmm18 {%k2} {z}
	kshiftrw	$8, %k1, %k2
	vfmadd231pd	%zmm18, %zmm16, %zmm5 {%k2} # zmm5 {%k2} = (zmm16 * zmm18) + zmm5
	vfmadd231pd	%zmm1, %zmm16, %zmm4 {%k1} # zmm4 {%k1} = (zmm16 * zmm1) + zmm4
	vpcmpgtd	%zmm3, %zmm0, %k1 {%k1}
	addl	%esi, %ecx
	addl	$8, %ebx
	kortestw	%k1, %k1
	jne	.LBB113_5
# %bb.6:                                # %for_exit
                                        #   in Loop: Header=BB113_4 Depth=1
	leal	(,%r14,8), %ecx
	movslq	%ecx, %rcx
	vaddpd	64(%r10,%rcx), %zmm5, %zmm1
	vaddpd	(%r10,%rcx), %zmm4, %zmm3
	vmaxpd	%zmm17, %zmm1, %zmm1
	vmovupd	%zmm1, 64(%r9,%rcx)
	vmaxpd	%zmm17, %zmm3, %zmm1
	vmovupd	%zmm1, (%r9,%rcx)
	addl	$16, %r14d
	subl	$-128, %r15d
	cmpl	%r11d, %r14d
	jl	.LBB113_4
	jmp	.LBB113_9
.LBB113_1:
	xorl	%r14d, %r14d
	jmp	.LBB113_9
.LBB113_7:                              # %for_exit.us.preheader
	xorl	%ecx, %ecx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB113_8:                              # %for_exit.us
                                        # =>This Inner Loop Header: Depth=1
	movslq	%ecx, %rcx
	vaddpd	64(%r10,%rcx), %zmm17, %zmm2
	vaddpd	(%r10,%rcx), %zmm17, %zmm3
	vmaxpd	%zmm17, %zmm2, %zmm2
	vmovupd	%zmm2, 64(%r9,%rcx)
	vmaxpd	%zmm17, %zmm3, %zmm2
	vmovupd	%zmm2, (%r9,%rcx)
	addl	$16, %r14d
	subl	$-128, %ecx
	cmpl	%r11d, %r14d
	jl	.LBB113_8
.LBB113_9:                              # %partial_inner_all_outer
	cmpl	%edx, %r14d
	jge	.LBB113_15
# %bb.10:                               # %partial_inner_only
	vpbroadcastd	%r14d, %zmm1
	vpord	.LCPI113_0(%rip), %zmm1, %zmm2
	vpbroadcastd	%edx, %zmm3
	vpxord	%xmm19, %xmm19, %xmm19
	vpcmpgtd	%zmm19, %zmm0, %k1
	vpcmpgtd	%zmm2, %zmm3, %k1 {%k1}
	kortestw	%k1, %k1
	je	.LBB113_11
# %bb.12:                               # %for_loop64.lr.ph
	leal	(,%r14,8), %edi
	shll	$3, %edx
	vxorpd	%xmm16, %xmm16, %xmm16
	xorl	%esi, %esi
	vpternlogd	$255, %zmm17, %zmm17, %zmm17
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB113_13:                             # %for_loop64
                                        # =>This Inner Loop Header: Depth=1
	vpsubd	%zmm17, %zmm16, %zmm16
	movslq	%esi, %rsi
	vbroadcastsd	(%r8,%rsi), %zmm18
	movslq	%edi, %rdi
	kmovw	%k1, 16(%rsp)
	vmovdqa	16(%rsp), %xmm1
	vpextrb	$1, %xmm1, %ecx
	vmovd	%xmm1, %ebp
	kmovd	%ebp, %k2
	vmovupd	(%rax,%rdi), %zmm1 {%k2} {z}
	kmovd	%ecx, %k2
	vmovupd	64(%rax,%rdi), %zmm20 {%k2} {z}
	kshiftrw	$8, %k1, %k2
	vfmadd231pd	%zmm20, %zmm18, %zmm4 {%k2} # zmm4 {%k2} = (zmm18 * zmm20) + zmm4
	vfmadd231pd	%zmm1, %zmm18, %zmm5 {%k1} # zmm5 {%k1} = (zmm18 * zmm1) + zmm5
	vpcmpgtd	%zmm16, %zmm0, %k1 {%k1}
	addl	%edx, %edi
	addl	$8, %esi
	kortestw	%k1, %k1
	jne	.LBB113_13
	jmp	.LBB113_14
.LBB113_11:
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm4, %xmm4, %xmm4
.LBB113_14:                             # %for_exit66
	vpcmpgtd	%zmm2, %zmm3, %k0
	kmovw	%k0, (%rsp)
	vmovdqa	(%rsp), %xmm0
	shll	$3, %r14d
	movslq	%r14d, %rax
	vmovd	%xmm0, %ecx
	vpextrb	$1, %xmm0, %edx
	kmovd	%ecx, %k1
	vmovupd	(%r10,%rax), %zmm0 {%k1} {z}
	vaddpd	%zmm0, %zmm5, %zmm0
	kmovd	%edx, %k2
	vmovupd	64(%r10,%rax), %zmm1 {%k2} {z}
	vaddpd	%zmm1, %zmm4, %zmm1
	vmaxpd	%zmm19, %zmm1, %zmm1
	vmaxpd	%zmm19, %zmm0, %zmm0
	vmovupd	%zmm0, (%r9,%rax) {%k1}
	vmovupd	%zmm1, 64(%r9,%rax) {%k2}
.LBB113_15:                             # %foreach_reset
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	vzeroupper
	retq
                                        # -- End function
	.section	.rdata,"dr",discard,"??_C@_02DKCKIIND@?$CFs?$AA@"
	.globl	"??_C@_02DKCKIIND@?$CFs?$AA@"   # @"??_C@_02DKCKIIND@?$CFs?$AA@"
"??_C@_02DKCKIIND@?$CFs?$AA@":
	.asciz	"%s"

	.section	.bss,"bw",discard,"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"
	.globl	"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" # @"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"
	.p2align	3
"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA":
	.quad	0                               # 0x0

	.section	.rdata,"dr",discard,"??_C@_04LOAJBDKD@true?$AA@"
	.globl	"??_C@_04LOAJBDKD@true?$AA@"    # @"??_C@_04LOAJBDKD@true?$AA@"
"??_C@_04LOAJBDKD@true?$AA@":
	.asciz	"true"

	.section	.rdata,"dr",discard,"??_C@_05LAPONLG@false?$AA@"
	.globl	"??_C@_05LAPONLG@false?$AA@"    # @"??_C@_05LAPONLG@false?$AA@"
"??_C@_05LAPONLG@false?$AA@":
	.asciz	"false"

	.section	.rdata,"dr"
OffLaneBoolStr:                         # @OffLaneBoolStr
	.asciz	"_________"

	.section	.rdata,"dr",discard,"??_C@_02DPKJAMEF@?$CFd?$AA@"
	.globl	"??_C@_02DPKJAMEF@?$CFd?$AA@"   # @"??_C@_02DPKJAMEF@?$CFd?$AA@"
"??_C@_02DPKJAMEF@?$CFd?$AA@":
	.asciz	"%d"

	.section	.rdata,"dr",discard,"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"
	.globl	"??_C@_02GLLNJPBP@?$CI?$CI?$AA@" # @"??_C@_02GLLNJPBP@?$CI?$CI?$AA@"
"??_C@_02GLLNJPBP@?$CI?$CI?$AA@":
	.asciz	"(("

	.section	.rdata,"dr",discard,"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"
	.globl	"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@" # @"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@"
"??_C@_02HDGEMEGJ@?$CJ?$CJ?$AA@":
	.asciz	"))"

	.section	.rdata,"dr",discard,"??_C@_02GMHACPFF@?$CFu?$AA@"
	.globl	"??_C@_02GMHACPFF@?$CFu?$AA@"   # @"??_C@_02GMHACPFF@?$CFu?$AA@"
"??_C@_02GMHACPFF@?$CFu?$AA@":
	.asciz	"%u"

	.section	.rdata,"dr",discard,"??_C@_02NJPGOMH@?$CFf?$AA@"
	.globl	"??_C@_02NJPGOMH@?$CFf?$AA@"    # @"??_C@_02NJPGOMH@?$CFf?$AA@"
"??_C@_02NJPGOMH@?$CFf?$AA@":
	.asciz	"%f"

	.section	.rdata,"dr",discard,"??_C@_04BFAHMMK@?$CFlld?$AA@"
	.globl	"??_C@_04BFAHMMK@?$CFlld?$AA@"  # @"??_C@_04BFAHMMK@?$CFlld?$AA@"
"??_C@_04BFAHMMK@?$CFlld?$AA@":
	.asciz	"%lld"

	.section	.rdata,"dr",discard,"??_C@_04FCIJFPNK@?$CFllu?$AA@"
	.globl	"??_C@_04FCIJFPNK@?$CFllu?$AA@" # @"??_C@_04FCIJFPNK@?$CFllu?$AA@"
"??_C@_04FCIJFPNK@?$CFllu?$AA@":
	.asciz	"%llu"

	.section	.rdata,"dr",discard,"??_C@_02BBAHNLBA@?$CFp?$AA@"
	.globl	"??_C@_02BBAHNLBA@?$CFp?$AA@"   # @"??_C@_02BBAHNLBA@?$CFp?$AA@"
"??_C@_02BBAHNLBA@?$CFp?$AA@":
	.asciz	"%p"

	.section	.rdata,"dr"
	.p2align	4                               # @__str
__str:
	.asciz	">>> ISPC conv_forward_ispc launched! <<<\n"

__str.1:                                # @__str.1
	.zero	1

	.p2align	4                               # @__str.2
__str.2:
	.asciz	">>> ISPC conv_forward_ispc launched! <<<\n"

__str.3:                                # @__str.3
	.zero	1

	.section	.drectve,"yn"
	.ascii	" /FAILIFMISMATCH:\"_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\""
	.globl	_fltused
