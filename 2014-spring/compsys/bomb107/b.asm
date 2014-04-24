
bomb:     file format elf32-i386


Disassembly of section .init:

080487d8 <_init>:
 80487d8:	53                   	push   %ebx
 80487d9:	83 ec 08             	sub    $0x8,%esp
 80487dc:	e8 00 00 00 00       	call   80487e1 <_init+0x9>
 80487e1:	5b                   	pop    %ebx
 80487e2:	81 c3 13 48 00 00    	add    $0x4813,%ebx
 80487e8:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80487ee:	85 c0                	test   %eax,%eax
 80487f0:	74 05                	je     80487f7 <_init+0x1f>
 80487f2:	e8 09 01 00 00       	call   8048900 <__gmon_start__@plt>
 80487f7:	e8 c4 02 00 00       	call   8048ac0 <frame_dummy>
 80487fc:	e8 ef 1c 00 00       	call   804a4f0 <__do_global_ctors_aux>
 8048801:	83 c4 08             	add    $0x8,%esp
 8048804:	5b                   	pop    %ebx
 8048805:	c3                   	ret    

Disassembly of section .plt:

08048810 <read@plt-0x10>:
 8048810:	ff 35 f8 cf 04 08    	pushl  0x804cff8
 8048816:	ff 25 fc cf 04 08    	jmp    *0x804cffc
 804881c:	00 00                	add    %al,(%eax)
	...

08048820 <read@plt>:
 8048820:	ff 25 00 d0 04 08    	jmp    *0x804d000
 8048826:	68 00 00 00 00       	push   $0x0
 804882b:	e9 e0 ff ff ff       	jmp    8048810 <_init+0x38>

08048830 <fflush@plt>:
 8048830:	ff 25 04 d0 04 08    	jmp    *0x804d004
 8048836:	68 08 00 00 00       	push   $0x8
 804883b:	e9 d0 ff ff ff       	jmp    8048810 <_init+0x38>

08048840 <fgets@plt>:
 8048840:	ff 25 08 d0 04 08    	jmp    *0x804d008
 8048846:	68 10 00 00 00       	push   $0x10
 804884b:	e9 c0 ff ff ff       	jmp    8048810 <_init+0x38>

08048850 <signal@plt>:
 8048850:	ff 25 0c d0 04 08    	jmp    *0x804d00c
 8048856:	68 18 00 00 00       	push   $0x18
 804885b:	e9 b0 ff ff ff       	jmp    8048810 <_init+0x38>

08048860 <sleep@plt>:
 8048860:	ff 25 10 d0 04 08    	jmp    *0x804d010
 8048866:	68 20 00 00 00       	push   $0x20
 804886b:	e9 a0 ff ff ff       	jmp    8048810 <_init+0x38>

08048870 <alarm@plt>:
 8048870:	ff 25 14 d0 04 08    	jmp    *0x804d014
 8048876:	68 28 00 00 00       	push   $0x28
 804887b:	e9 90 ff ff ff       	jmp    8048810 <_init+0x38>

08048880 <__stack_chk_fail@plt>:
 8048880:	ff 25 18 d0 04 08    	jmp    *0x804d018
 8048886:	68 30 00 00 00       	push   $0x30
 804888b:	e9 80 ff ff ff       	jmp    8048810 <_init+0x38>

08048890 <fwrite@plt>:
 8048890:	ff 25 1c d0 04 08    	jmp    *0x804d01c
 8048896:	68 38 00 00 00       	push   $0x38
 804889b:	e9 70 ff ff ff       	jmp    8048810 <_init+0x38>

080488a0 <strcpy@plt>:
 80488a0:	ff 25 20 d0 04 08    	jmp    *0x804d020
 80488a6:	68 40 00 00 00       	push   $0x40
 80488ab:	e9 60 ff ff ff       	jmp    8048810 <_init+0x38>

080488b0 <gethostname@plt>:
 80488b0:	ff 25 24 d0 04 08    	jmp    *0x804d024
 80488b6:	68 48 00 00 00       	push   $0x48
 80488bb:	e9 50 ff ff ff       	jmp    8048810 <_init+0x38>

080488c0 <getenv@plt>:
 80488c0:	ff 25 28 d0 04 08    	jmp    *0x804d028
 80488c6:	68 50 00 00 00       	push   $0x50
 80488cb:	e9 40 ff ff ff       	jmp    8048810 <_init+0x38>

080488d0 <puts@plt>:
 80488d0:	ff 25 2c d0 04 08    	jmp    *0x804d02c
 80488d6:	68 58 00 00 00       	push   $0x58
 80488db:	e9 30 ff ff ff       	jmp    8048810 <_init+0x38>

080488e0 <__memmove_chk@plt>:
 80488e0:	ff 25 30 d0 04 08    	jmp    *0x804d030
 80488e6:	68 60 00 00 00       	push   $0x60
 80488eb:	e9 20 ff ff ff       	jmp    8048810 <_init+0x38>

080488f0 <__memcpy_chk@plt>:
 80488f0:	ff 25 34 d0 04 08    	jmp    *0x804d034
 80488f6:	68 68 00 00 00       	push   $0x68
 80488fb:	e9 10 ff ff ff       	jmp    8048810 <_init+0x38>

08048900 <__gmon_start__@plt>:
 8048900:	ff 25 38 d0 04 08    	jmp    *0x804d038
 8048906:	68 70 00 00 00       	push   $0x70
 804890b:	e9 00 ff ff ff       	jmp    8048810 <_init+0x38>

08048910 <exit@plt>:
 8048910:	ff 25 3c d0 04 08    	jmp    *0x804d03c
 8048916:	68 78 00 00 00       	push   $0x78
 804891b:	e9 f0 fe ff ff       	jmp    8048810 <_init+0x38>

08048920 <__libc_start_main@plt>:
 8048920:	ff 25 40 d0 04 08    	jmp    *0x804d040
 8048926:	68 80 00 00 00       	push   $0x80
 804892b:	e9 e0 fe ff ff       	jmp    8048810 <_init+0x38>

08048930 <write@plt>:
 8048930:	ff 25 44 d0 04 08    	jmp    *0x804d044
 8048936:	68 88 00 00 00       	push   $0x88
 804893b:	e9 d0 fe ff ff       	jmp    8048810 <_init+0x38>

08048940 <strcasecmp@plt>:
 8048940:	ff 25 48 d0 04 08    	jmp    *0x804d048
 8048946:	68 90 00 00 00       	push   $0x90
 804894b:	e9 c0 fe ff ff       	jmp    8048810 <_init+0x38>

08048950 <__isoc99_sscanf@plt>:
 8048950:	ff 25 4c d0 04 08    	jmp    *0x804d04c
 8048956:	68 98 00 00 00       	push   $0x98
 804895b:	e9 b0 fe ff ff       	jmp    8048810 <_init+0x38>

08048960 <fopen@plt>:
 8048960:	ff 25 50 d0 04 08    	jmp    *0x804d050
 8048966:	68 a0 00 00 00       	push   $0xa0
 804896b:	e9 a0 fe ff ff       	jmp    8048810 <_init+0x38>

08048970 <__errno_location@plt>:
 8048970:	ff 25 54 d0 04 08    	jmp    *0x804d054
 8048976:	68 a8 00 00 00       	push   $0xa8
 804897b:	e9 90 fe ff ff       	jmp    8048810 <_init+0x38>

08048980 <gai_strerror@plt>:
 8048980:	ff 25 58 d0 04 08    	jmp    *0x804d058
 8048986:	68 b0 00 00 00       	push   $0xb0
 804898b:	e9 80 fe ff ff       	jmp    8048810 <_init+0x38>

08048990 <__printf_chk@plt>:
 8048990:	ff 25 5c d0 04 08    	jmp    *0x804d05c
 8048996:	68 b8 00 00 00       	push   $0xb8
 804899b:	e9 70 fe ff ff       	jmp    8048810 <_init+0x38>

080489a0 <socket@plt>:
 80489a0:	ff 25 60 d0 04 08    	jmp    *0x804d060
 80489a6:	68 c0 00 00 00       	push   $0xc0
 80489ab:	e9 60 fe ff ff       	jmp    8048810 <_init+0x38>

080489b0 <getaddrinfo@plt>:
 80489b0:	ff 25 64 d0 04 08    	jmp    *0x804d064
 80489b6:	68 c8 00 00 00       	push   $0xc8
 80489bb:	e9 50 fe ff ff       	jmp    8048810 <_init+0x38>

080489c0 <__fprintf_chk@plt>:
 80489c0:	ff 25 68 d0 04 08    	jmp    *0x804d068
 80489c6:	68 d0 00 00 00       	push   $0xd0
 80489cb:	e9 40 fe ff ff       	jmp    8048810 <_init+0x38>

080489d0 <gethostbyname@plt>:
 80489d0:	ff 25 6c d0 04 08    	jmp    *0x804d06c
 80489d6:	68 d8 00 00 00       	push   $0xd8
 80489db:	e9 30 fe ff ff       	jmp    8048810 <_init+0x38>

080489e0 <strtol@plt>:
 80489e0:	ff 25 70 d0 04 08    	jmp    *0x804d070
 80489e6:	68 e0 00 00 00       	push   $0xe0
 80489eb:	e9 20 fe ff ff       	jmp    8048810 <_init+0x38>

080489f0 <connect@plt>:
 80489f0:	ff 25 74 d0 04 08    	jmp    *0x804d074
 80489f6:	68 e8 00 00 00       	push   $0xe8
 80489fb:	e9 10 fe ff ff       	jmp    8048810 <_init+0x38>

08048a00 <close@plt>:
 8048a00:	ff 25 78 d0 04 08    	jmp    *0x804d078
 8048a06:	68 f0 00 00 00       	push   $0xf0
 8048a0b:	e9 00 fe ff ff       	jmp    8048810 <_init+0x38>

08048a10 <__ctype_b_loc@plt>:
 8048a10:	ff 25 7c d0 04 08    	jmp    *0x804d07c
 8048a16:	68 f8 00 00 00       	push   $0xf8
 8048a1b:	e9 f0 fd ff ff       	jmp    8048810 <_init+0x38>

08048a20 <__sprintf_chk@plt>:
 8048a20:	ff 25 80 d0 04 08    	jmp    *0x804d080
 8048a26:	68 00 01 00 00       	push   $0x100
 8048a2b:	e9 e0 fd ff ff       	jmp    8048810 <_init+0x38>

Disassembly of section .text:

08048a30 <_start>:
 8048a30:	31 ed                	xor    %ebp,%ebp
 8048a32:	5e                   	pop    %esi
 8048a33:	89 e1                	mov    %esp,%ecx
 8048a35:	83 e4 f0             	and    $0xfffffff0,%esp
 8048a38:	50                   	push   %eax
 8048a39:	54                   	push   %esp
 8048a3a:	52                   	push   %edx
 8048a3b:	68 e0 a4 04 08       	push   $0x804a4e0
 8048a40:	68 70 a4 04 08       	push   $0x804a470
 8048a45:	51                   	push   %ecx
 8048a46:	56                   	push   %esi
 8048a47:	68 e4 8a 04 08       	push   $0x8048ae4
 8048a4c:	e8 cf fe ff ff       	call   8048920 <__libc_start_main@plt>
 8048a51:	f4                   	hlt    
 8048a52:	90                   	nop
 8048a53:	90                   	nop
 8048a54:	90                   	nop
 8048a55:	90                   	nop
 8048a56:	90                   	nop
 8048a57:	90                   	nop
 8048a58:	90                   	nop
 8048a59:	90                   	nop
 8048a5a:	90                   	nop
 8048a5b:	90                   	nop
 8048a5c:	90                   	nop
 8048a5d:	90                   	nop
 8048a5e:	90                   	nop
 8048a5f:	90                   	nop

08048a60 <__do_global_dtors_aux>:
 8048a60:	55                   	push   %ebp
 8048a61:	89 e5                	mov    %esp,%ebp
 8048a63:	53                   	push   %ebx
 8048a64:	83 ec 04             	sub    $0x4,%esp
 8048a67:	80 3d 04 d8 04 08 00 	cmpb   $0x0,0x804d804
 8048a6e:	75 3f                	jne    8048aaf <__do_global_dtors_aux+0x4f>
 8048a70:	a1 08 d8 04 08       	mov    0x804d808,%eax
 8048a75:	bb 20 cf 04 08       	mov    $0x804cf20,%ebx
 8048a7a:	81 eb 1c cf 04 08    	sub    $0x804cf1c,%ebx
 8048a80:	c1 fb 02             	sar    $0x2,%ebx
 8048a83:	83 eb 01             	sub    $0x1,%ebx
 8048a86:	39 d8                	cmp    %ebx,%eax
 8048a88:	73 1e                	jae    8048aa8 <__do_global_dtors_aux+0x48>
 8048a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048a90:	83 c0 01             	add    $0x1,%eax
 8048a93:	a3 08 d8 04 08       	mov    %eax,0x804d808
 8048a98:	ff 14 85 1c cf 04 08 	call   *0x804cf1c(,%eax,4)
 8048a9f:	a1 08 d8 04 08       	mov    0x804d808,%eax
 8048aa4:	39 d8                	cmp    %ebx,%eax
 8048aa6:	72 e8                	jb     8048a90 <__do_global_dtors_aux+0x30>
 8048aa8:	c6 05 04 d8 04 08 01 	movb   $0x1,0x804d804
 8048aaf:	83 c4 04             	add    $0x4,%esp
 8048ab2:	5b                   	pop    %ebx
 8048ab3:	5d                   	pop    %ebp
 8048ab4:	c3                   	ret    
 8048ab5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048ac0 <frame_dummy>:
 8048ac0:	55                   	push   %ebp
 8048ac1:	89 e5                	mov    %esp,%ebp
 8048ac3:	83 ec 18             	sub    $0x18,%esp
 8048ac6:	a1 24 cf 04 08       	mov    0x804cf24,%eax
 8048acb:	85 c0                	test   %eax,%eax
 8048acd:	74 12                	je     8048ae1 <frame_dummy+0x21>
 8048acf:	b8 00 00 00 00       	mov    $0x0,%eax
 8048ad4:	85 c0                	test   %eax,%eax
 8048ad6:	74 09                	je     8048ae1 <frame_dummy+0x21>
 8048ad8:	c7 04 24 24 cf 04 08 	movl   $0x804cf24,(%esp)
 8048adf:	ff d0                	call   *%eax
 8048ae1:	c9                   	leave  
 8048ae2:	c3                   	ret    
 8048ae3:	90                   	nop

08048ae4 <main>:
 8048ae4:	55                   	push   %ebp
 8048ae5:	89 e5                	mov    %esp,%ebp
 8048ae7:	53                   	push   %ebx
 8048ae8:	83 e4 f0             	and    $0xfffffff0,%esp
 8048aeb:	83 ec 10             	sub    $0x10,%esp
 8048aee:	8b 45 08             	mov    0x8(%ebp),%eax
 8048af1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048af4:	83 f8 01             	cmp    $0x1,%eax
 8048af7:	75 0c                	jne    8048b05 <main+0x21>
 8048af9:	a1 e4 d7 04 08       	mov    0x804d7e4,%eax
 8048afe:	a3 10 d8 04 08       	mov    %eax,0x804d810
 8048b03:	eb 74                	jmp    8048b79 <main+0x95>
 8048b05:	83 f8 02             	cmp    $0x2,%eax
 8048b08:	75 49                	jne    8048b53 <main+0x6f>
 8048b0a:	c7 44 24 04 48 a5 04 	movl   $0x804a548,0x4(%esp)
 8048b11:	08 
 8048b12:	8b 43 04             	mov    0x4(%ebx),%eax
 8048b15:	89 04 24             	mov    %eax,(%esp)
 8048b18:	e8 43 fe ff ff       	call   8048960 <fopen@plt>
 8048b1d:	a3 10 d8 04 08       	mov    %eax,0x804d810
 8048b22:	85 c0                	test   %eax,%eax
 8048b24:	75 53                	jne    8048b79 <main+0x95>
 8048b26:	8b 43 04             	mov    0x4(%ebx),%eax
 8048b29:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048b2d:	8b 03                	mov    (%ebx),%eax
 8048b2f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048b33:	c7 44 24 04 4a a5 04 	movl   $0x804a54a,0x4(%esp)
 8048b3a:	08 
 8048b3b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048b42:	e8 49 fe ff ff       	call   8048990 <__printf_chk@plt>
 8048b47:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048b4e:	e8 bd fd ff ff       	call   8048910 <exit@plt>
 8048b53:	8b 03                	mov    (%ebx),%eax
 8048b55:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048b59:	c7 44 24 04 67 a5 04 	movl   $0x804a567,0x4(%esp)
 8048b60:	08 
 8048b61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048b68:	e8 23 fe ff ff       	call   8048990 <__printf_chk@plt>
 8048b6d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048b74:	e8 97 fd ff ff       	call   8048910 <exit@plt>
 8048b79:	e8 f0 06 00 00       	call   804926e <initialize_bomb>
 8048b7e:	c7 04 24 bc a5 04 08 	movl   $0x804a5bc,(%esp)
 8048b85:	e8 46 fd ff ff       	call   80488d0 <puts@plt>
 8048b8a:	c7 04 24 fc a5 04 08 	movl   $0x804a5fc,(%esp)
 8048b91:	e8 3a fd ff ff       	call   80488d0 <puts@plt>
 8048b96:	e8 72 0a 00 00       	call   804960d <read_line>
 8048b9b:	89 04 24             	mov    %eax,(%esp)
 8048b9e:	e8 ad 00 00 00       	call   8048c50 <phase_1>
 8048ba3:	e8 c3 0b 00 00       	call   804976b <phase_defused>
 8048ba8:	c7 04 24 3c a6 04 08 	movl   $0x804a63c,(%esp)
 8048baf:	e8 1c fd ff ff       	call   80488d0 <puts@plt>
 8048bb4:	e8 54 0a 00 00       	call   804960d <read_line>
 8048bb9:	89 04 24             	mov    %eax,(%esp)
 8048bbc:	e8 b3 00 00 00       	call   8048c74 <phase_2>
 8048bc1:	e8 a5 0b 00 00       	call   804976b <phase_defused>
 8048bc6:	c7 04 24 81 a5 04 08 	movl   $0x804a581,(%esp)
 8048bcd:	e8 fe fc ff ff       	call   80488d0 <puts@plt>
 8048bd2:	e8 36 0a 00 00       	call   804960d <read_line>
 8048bd7:	89 04 24             	mov    %eax,(%esp)
 8048bda:	e8 de 00 00 00       	call   8048cbd <phase_3>
 8048bdf:	e8 87 0b 00 00       	call   804976b <phase_defused>
 8048be4:	c7 04 24 68 a6 04 08 	movl   $0x804a668,(%esp)
 8048beb:	e8 e0 fc ff ff       	call   80488d0 <puts@plt>
 8048bf0:	e8 18 0a 00 00       	call   804960d <read_line>
 8048bf5:	89 04 24             	mov    %eax,(%esp)
 8048bf8:	e8 c2 01 00 00       	call   8048dbf <phase_4>
 8048bfd:	e8 69 0b 00 00       	call   804976b <phase_defused>
 8048c02:	c7 04 24 9b a5 04 08 	movl   $0x804a59b,(%esp)
 8048c09:	e8 c2 fc ff ff       	call   80488d0 <puts@plt>
 8048c0e:	e8 fa 09 00 00       	call   804960d <read_line>
 8048c13:	89 04 24             	mov    %eax,(%esp)
 8048c16:	e8 13 02 00 00       	call   8048e2e <phase_5>
 8048c1b:	e8 4b 0b 00 00       	call   804976b <phase_defused>
 8048c20:	c7 04 24 88 a6 04 08 	movl   $0x804a688,(%esp)
 8048c27:	e8 a4 fc ff ff       	call   80488d0 <puts@plt>
 8048c2c:	e8 dc 09 00 00       	call   804960d <read_line>
 8048c31:	89 04 24             	mov    %eax,(%esp)
 8048c34:	e8 88 02 00 00       	call   8048ec1 <phase_6>
 8048c39:	e8 2d 0b 00 00       	call   804976b <phase_defused>
 8048c3e:	b8 00 00 00 00       	mov    $0x0,%eax
 8048c43:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048c46:	c9                   	leave  
 8048c47:	c3                   	ret    
 8048c48:	90                   	nop
 8048c49:	90                   	nop
 8048c4a:	90                   	nop
 8048c4b:	90                   	nop
 8048c4c:	90                   	nop
 8048c4d:	90                   	nop
 8048c4e:	90                   	nop
 8048c4f:	90                   	nop

08048c50 <phase_1>:
 8048c50:	83 ec 1c             	sub    $0x1c,%esp				# %esp -= 0x1C (grow the stack by 0x1C or 28 bytes) for local variables
 8048c53:	c7 44 24 04 ac a6 04 	movl   $0x804a6ac,0x4(%esp)		# M [%esp+4] = 0x804a6ac (address is beyond the address in this disassembly)
 8048c5a:	08 
 8048c5b:	8b 44 24 20          	mov    0x20(%esp),%eax			# %eax = 0x20 + %esp  ; first param - ptr to string passed to phase_1()
 8048c5f:	89 04 24             	mov    %eax,(%esp)				# M [%esp] = %eax     ; set to a local variable
 8048c62:	e8 f8 04 00 00       	call   804915f <strings_check>
 8048c67:	85 c0                	test   %eax,%eax				# test return value of strings_check should return 0 for success
 8048c69:	74 05                	je     8048c70 <phase_1+0x20>	# jump to end of pahse_1() function line 8048c70
 8048c6b:	e8 6a 09 00 00       	call   80495da <explode_bomb>
 8048c70:	83 c4 1c             	add    $0x1c,%esp				# %esp += 0x1C
 8048c73:	c3                   	ret    

08048c74 <phase_2>:
 8048c74:	56                   	push   %esi
 8048c75:	53                   	push   %ebx
 8048c76:	83 ec 34             	sub    $0x34,%esp				# %esp -= 0x34 (grow the stack by 0x34 or 52 bytes) for local variables
 8048c79:	8d 44 24 18          	lea    0x18(%esp),%eax			# %eax = M[0x18 + %esp]
 8048c7d:	89 44 24 04          	mov    %eax,0x4(%esp)			# M[%esp + 4] = %eax
 8048c81:	8b 44 24 40          	mov    0x40(%esp),%eax			# %eax = M[0x40 + %esp]		input_line parameter
 8048c85:	89 04 24             	mov    %eax,(%esp)				# M[%esp] = %eax			local var = input_line passed to read_six_numbers
 8048c88:	e8 8e 0a 00 00       	call   804971b <read_six_numbers> # Function name is key ? read six numbers
 8048c8d:	83 7c 24 18 02       	cmpl   $0x2,0x18(%esp)			# 0x2 cmp1 M [0x18 + %esp]
 8048c92:	74 05                	je     8048c99 <phase_2+0x25>   # jump just past explode_bomb
 8048c94:	e8 41 09 00 00       	call   80495da <explode_bomb>
 8048c99:	8d 5c 24 1c          	lea    0x1c(%esp),%ebx			# %ebx = 0x1C + %esp
 8048c9d:	8d 74 24 30          	lea    0x30(%esp),%esi			# %esi = 0x30 + %esp
 8048ca1:	8b 43 fc             	mov    -0x4(%ebx),%eax			# %eax = -0x4 + %ebx
 8048ca4:	8d 04 40             	lea    (%eax,%eax,2),%eax		# %eax = 3 * %eax
 8048ca7:	39 03                	cmp    %eax,(%ebx)				# %eax == M [ %ebx ]
 8048ca9:	74 05                	je     8048cb0 <phase_2+0x3c>   # jump past explode
 8048cab:	e8 2a 09 00 00       	call   80495da <explode_bomb>
 8048cb0:	83 c3 04             	add    $0x4,%ebx				#
 8048cb3:	39 f3                	cmp    %esi,%ebx
 8048cb5:	75 ea                	jne    8048ca1 <phase_2+0x2d>
 8048cb7:	83 c4 34             	add    $0x34,%esp
 8048cba:	5b                   	pop    %ebx
 8048cbb:	5e                   	pop    %esi
 8048cbc:	c3                   	ret    

08048cbd <phase_3>:
 8048cbd:	83 ec 2c             	sub    $0x2c,%esp				# %esp -= 0x2c (grow the stack by 0x2c or 44 bytes) for local variables
 8048cc0:	8d 44 24 1c          	lea    0x1c(%esp),%eax			# %eax = M [ %esp + 0x1c]
 8048cc4:	89 44 24 0c          	mov    %eax,0xc(%esp)			# M [%esp + 0xc ] = %eax
 8048cc8:	8d 44 24 18          	lea    0x18(%esp),%eax			# %eax = M [ %esp + 0x18]
 8048ccc:	89 44 24 08          	mov    %eax,0x8(%esp)			# M [%esp + 0x8] = %eax
 8048cd0:	c7 44 24 04 05 aa 04 	movl   $0x804aa05,0x4(%esp)		# M [%esp + 0x4] = 0x804aa05   # beyond the address in this disassembly
 8048cd7:	08 
 8048cd8:	8b 44 24 30          	mov    0x30(%esp),%eax			# %eax = M [ %esp + 0x30] scanf(input_line, "fmt", &local1 (one int?), &local2 (4 ints?))
 8048cdc:	89 04 24             	mov    %eax,(%esp)				# M [%esp] = %eax
 8048cdf:	e8 6c fc ff ff       	call   8048950 <__isoc99_sscanf@plt>
 8048ce4:	83 f8 01             	cmp    $0x1,%eax				# 0x1 == %eax ; return value from sscanf == 1? sscanf returns number of variables read.
 8048ce7:	7f 05                	jg     8048cee <phase_3+0x31>	# jump past "EXPLODE 1" bomb instruction
 8048ce9:	e8 ec 08 00 00       	call   80495da <explode_bomb>	# "EXPLODE 1" <=======================================================
 8048cee:	83 7c 24 18 07       	cmpl   $0x7,0x18(%esp)			# M [%esp + 0x18] = 0x7
 8048cf3:	77 3c                	ja     8048d31 <phase_3+0x74>	# jump to "EXPLODE 2" <===============================================
 8048cf5:	8b 44 24 18          	mov    0x18(%esp),%eax			# %eax = M [%esp + 0x18]
 8048cf9:	ff 24 85 20 a7 04 08 	jmp    *0x804a720(,%eax,4)		# beyond the end of current disassembly
 8048d00:	b8 ac 0c 00 00       	mov    $0xcac,%eax				# %eax = 0x0cac
 8048d05:	eb 3b                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d07:	b8 d8 0a 00 00       	mov    $0xad8,%eax				%eax = 0xad8
 8048d0c:	eb 34                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d0e:	b8 de 03 00 00       	mov    $0x3de,%eax				%eax = 0x3de
 8048d13:	eb 2d                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d15:	b8 66 0e 00 00       	mov    $0xe66,%eax				%eax = 0xe66
 8048d1a:	eb 26                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d1c:	b8 6d 0e 00 00       	mov    $0xe6d,%eax				%eax = 0xe6d
 8048d21:	eb 1f                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d23:	b8 dc 0f 00 00       	mov    $0xfdc,%eax				%eax = 0xfdc
 8048d28:	eb 18                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d2a:	b8 87 09 00 00       	mov    $0x987,%eax				%eax = 0x987
 8048d2f:	eb 11                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d31:	e8 a4 08 00 00       	call   80495da <explode_bomb>	# "EXPLODE 2" <======================================================
 8048d36:	b8 00 00 00 00       	mov    $0x0,%eax				# %eax = 0
 8048d3b:	eb 05                	jmp    8048d42 <phase_3+0x85>	# GOTO BRANCH CHECK <+++++++++
 8048d3d:	b8 1c 0e 00 00       	mov    $0xe1c,%eax				# %eax = 0xe1c
 8048d42:	05 9a 00 00 00       	add    $0x9a,%eax				# %eax += 0x9a   ALL BRANCHES COME HERE <++++++++++
 8048d47:	3b 44 24 1c          	cmp    0x1c(%esp),%eax			# %eax == M [%esp + 0x1c]
 8048d4b:	74 05                	je     8048d52 <phase_3+0x95>	# SUCCESS
 8048d4d:	e8 88 08 00 00       	call   80495da <explode_bomb>	# "EXPLODE 3" <======================================================
 8048d52:	83 c4 2c             	add    $0x2c,%esp
 8048d55:	c3                   	ret    

08048d56 <func4>:													This is just func4 not phase_4 !!!!
 8048d56:	83 ec 1c             	sub    $0x1c,%esp				# grow stack by 0x1C or 28 bytes
 8048d59:	89 5c 24 14          	mov    %ebx,0x14(%esp)			# M [%esp + 0x14] = %ebx
 8048d5d:	89 74 24 18          	mov    %esi,0x18(%esp)			# M [%esp + 0x18] = %esi
 8048d61:	8b 44 24 20          	mov    0x20(%esp),%eax			# %eax = first param
 8048d65:	8b 54 24 24          	mov    0x24(%esp),%edx			# %edx = second param
 8048d69:	8b 74 24 28          	mov    0x28(%esp),%esi			# %esi = M [%esp + 0x28]  - third param
 8048d6d:	89 f1                	mov    %esi,%ecx				# %ecx = %esi (p3)
 8048d6f:	29 d1                	sub    %edx,%ecx				# %ecx -= %edx (p3-p2)
 8048d71:	89 cb                	mov    %ecx,%ebx				# %ebx = %ecx  (p3-p2)
 8048d73:	c1 eb 1f             	shr    $0x1f,%ebx				# %ebx >>= 0x1F (p3-p2) >> 31
 8048d76:	01 d9                	add    %ebx,%ecx				# %ecx += %ebx (p3-p2) + ((p3-p2) >> 31) since p2=0 and p3=14, this is just p3-p2 = 14-0=14
 8048d78:	d1 f9                	sar    %ecx						# 14>>1 = 7
 8048d7a:	8d 1c 11             	lea    (%ecx,%edx,1),%ebx		# %ebx = %ecx + %edx (or ebx = 7 + 0) = 7
 8048d7d:	39 c3                	cmp    %eax,%ebx				# if p1 == 7
 8048d7f:	7e 17                	jle    8048d98 <func4+0x42>
 8048d81:	8d 4b ff             	lea    -0x1(%ebx),%ecx
 8048d84:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048d88:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048d8c:	89 04 24             	mov    %eax,(%esp)
 8048d8f:	e8 c2 ff ff ff       	call   8048d56 <func4>
 8048d94:	01 c3                	add    %eax,%ebx
 8048d96:	eb 19                	jmp    8048db1 <func4+0x5b>
 8048d98:	39 c3                	cmp    %eax,%ebx
 8048d9a:	7d 15                	jge    8048db1 <func4+0x5b>
 8048d9c:	89 74 24 08          	mov    %esi,0x8(%esp)
 8048da0:	8d 53 01             	lea    0x1(%ebx),%edx
 8048da3:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048da7:	89 04 24             	mov    %eax,(%esp)
 8048daa:	e8 a7 ff ff ff       	call   8048d56 <func4>			# recursive call
 8048daf:	01 c3                	add    %eax,%ebx
 8048db1:	89 d8                	mov    %ebx,%eax
 8048db3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 8048db7:	8b 74 24 18          	mov    0x18(%esp),%esi
 8048dbb:	83 c4 1c             	add    $0x1c,%esp
 8048dbe:	c3                   	ret    

08048dbf <phase_4>:
 8048dbf:	83 ec 2c             	sub    $0x2c,%esp						# grow stack 0x2c for local variables
 8048dc2:	8d 44 24 1c          	lea    0x1c(%esp),%eax					# %eax = prepare for the sscanf call below
 8048dc6:	89 44 24 0c          	mov    %eax,0xc(%esp)					# sscancf fourth param (ptr to an int?)
 8048dca:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048dce:	89 44 24 08          	mov    %eax,0x8(%esp)					# scanf third param - ptr to an int?
 8048dd2:	c7 44 24 04 05 aa 04 	movl   $0x804aa05,0x4(%esp)				# sscanf second param = format-str
 8048dd9:	08 
 8048dda:	8b 44 24 30          	mov    0x30(%esp),%eax					# %eax = sscanf first param (input str)
 8048dde:	89 04 24             	mov    %eax,(%esp)
 8048de1:	e8 6a fb ff ff       	call   8048950 <__isoc99_sscanf@plt>	# scan string
 8048de6:	83 f8 02             	cmp    $0x2,%eax						# two words scanned by sscanf
 8048de9:	75 0d                	jne    8048df8 <phase_4+0x39>			# goto "EXPLODE 1" <==========================================
 8048deb:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048def:	85 c0                	test   %eax,%eax						#
 8048df1:	78 05                	js     8048df8 <phase_4+0x39>
 8048df3:	83 f8 0e             	cmp    $0xe,%eax						# first int = 0xe or 14
 8048df6:	7e 05                	jle    8048dfd <phase_4+0x3e>
 8048df8:	e8 dd 07 00 00       	call   80495da <explode_bomb>			# "EXPLODE 1" <===============================================
 8048dfd:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)					# prepare for func4 call - third param to func4 - oxe or 14)
 8048e04:	00 
 8048e05:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)					# second param to func4
 8048e0c:	00 
 8048e0d:	8b 44 24 18          	mov    0x18(%esp),%eax					# ptr to second int scanned by scanf
 8048e11:	89 04 24             	mov    %eax,(%esp)						# first param to func4
 8048e14:	e8 3d ff ff ff       	call   8048d56 <func4>					# func4(scannedint2,0,14)
 8048e19:	83 f8 23             	cmp    $0x23,%eax						# %eax == 0x23 or 'C'
 8048e1c:	75 07                	jne    8048e25 <phase_4+0x66>			# goto "EXPLODE 2" <==========================================
 8048e1e:	83 7c 24 1c 23       	cmpl   $0x23,0x1c(%esp)					# M[%esp+0x1C] == 0x23 or 'C'
 8048e23:	74 05                	je     8048e2a <phase_4+0x6b>			# "SUCCESS"
 8048e25:	e8 b0 07 00 00       	call   80495da <explode_bomb>			# "EXPLODE 2" <===============================================
 8048e2a:	83 c4 2c             	add    $0x2c,%esp
 8048e2d:	c3                   	ret    

08048e2e <phase_5>:
 8048e2e:	56                   	push   %esi
 8048e2f:	53                   	push   %ebx
 8048e30:	83 ec 24             	sub    $0x24,%esp						# grow stack downward 0x24 bytes for local variables
 8048e33:	8b 5c 24 30          	mov    0x30(%esp),%ebx					# %ebx = *input_line
 8048e37:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax					# %eax =
 8048e3d:	89 44 24 1c          	mov    %eax,0x1c(%esp)					# M [%esp + 0x1C] = %eax
 8048e41:	31 c0                	xor    %eax,%eax
 8048e43:	89 1c 24             	mov    %ebx,(%esp)						# input_line to %esp
 8048e46:	e8 84 02 00 00       	call   80490cf <string_length>			# get string length
 8048e4b:	83 f8 06             	cmp    $0x6,%eax						# string length == 6
 8048e4e:	74 05                	je     8048e55 <phase_5+0x27>			# is so then SKIP "EXPLODE 1"
 8048e50:	e8 85 07 00 00       	call   80495da <explode_bomb>			# "EXPLODE 1" <===============================================
 8048e55:	b8 00 00 00 00       	mov    $0x0,%eax						# %eax = 0
 8048e5a:	89 c6                	mov    %eax,%esi						# %esi = %eax (LOOP START)
 8048e5c:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx				# %edx = M [%ebx + %eax]
 8048e60:	0f be ca             	movsbl %dl,%ecx
 8048e63:	83 e9 41             	sub    $0x41,%ecx
 8048e66:	80 fa 60             	cmp    $0x60,%dl
 8048e69:	7e 06                	jle    8048e71 <phase_5+0x43>
 8048e6b:	0f be d2             	movsbl %dl,%edx
 8048e6e:	8d 4a 9f             	lea    -0x61(%edx),%ecx
 8048e71:	83 e1 0f             	and    $0xf,%ecx
 8048e74:	0f b6 91 2d a9 04 08 	movzbl 0x804a92d(%ecx),%edx
 8048e7b:	88 54 34 15          	mov    %dl,0x15(%esp,%esi,1)
 8048e7f:	83 c0 01             	add    $0x1,%eax
 8048e82:	83 f8 06             	cmp    $0x6,%eax
 8048e85:	75 d3                	jne    8048e5a <phase_5+0x2c>
 8048e87:	c6 44 24 1b 00       	movb   $0x0,0x1b(%esp)
 8048e8c:	c7 44 24 04 17 a7 04 	movl   $0x804a717,0x4(%esp)
 8048e93:	08 
 8048e94:	8d 44 24 15          	lea    0x15(%esp),%eax
 8048e98:	89 04 24             	mov    %eax,(%esp)
 8048e9b:	e8 48 02 00 00       	call   80490e8 <strings_not_equal>
 8048ea0:	85 c0                	test   %eax,%eax						# %eax is not zero (unequal strings?)
 8048ea2:	74 05                	je     8048ea9 <phase_5+0x7b>			# is so then SKIP "EXPLODE 2"
 8048ea4:	e8 31 07 00 00       	call   80495da <explode_bomb>			# "EXPLODE 2" <===============================================
 8048ea9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 8048ead:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 8048eb4:	74 05                	je     8048ebb <phase_5+0x8d>			# skip the next bad stack statement - probably generates a signal caught to explode the bomb
 8048eb6:	e8 c5 f9 ff ff       	call   8048880 <__stack_chk_fail@plt>
 8048ebb:	83 c4 24             	add    $0x24,%esp
 8048ebe:	5b                   	pop    %ebx
 8048ebf:	5e                   	pop    %esi
 8048ec0:	c3                   	ret    

08048ec1 <phase_6>:
 8048ec1:	56                   	push   %esi
 8048ec2:	53                   	push   %ebx
 8048ec3:	83 ec 44             	sub    $0x44,%esp						# grow stack by 0x44 for local variables
 8048ec6:	8d 44 24 10          	lea    0x10(%esp),%eax					#
 8048eca:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ece:	8b 44 24 50          	mov    0x50(%esp),%eax
 8048ed2:	89 04 24             	mov    %eax,(%esp)
 8048ed5:	e8 41 08 00 00       	call   804971b <read_six_numbers>		# read six numbers
 8048eda:	be 00 00 00 00       	mov    $0x0,%esi						# %esi = 0 ; looks like a loop variable
 8048edf:	8b 44 b4 10          	mov    0x10(%esp,%esi,4),%eax			# %eax = M [0x10 + %esp + %esi*4]
 8048ee3:	83 e8 01             	sub    $0x1,%eax						# %eax -= 1
 8048ee6:	83 f8 05             	cmp    $0x5,%eax						# %eax == 5
 8048ee9:	76 05                	jbe    8048ef0 <phase_6+0x2f>			# skip "explode 1" (i.e. explode is not exactly 6 numbers)
 8048eeb:	e8 ea 06 00 00       	call   80495da <explode_bomb>			# "EXPLODE 1" <===============================================
 8048ef0:	83 c6 01             	add    $0x1,%esi						# %esi += 1
 8048ef3:	83 fe 06             	cmp    $0x6,%esi						# %esi == 6
 8048ef6:	74 33                	je     8048f2b <phase_6+0x6a>			# GOTO END OF LOOP
 8048ef8:	89 f3                	mov    %esi,%ebx						# %ebx = %esi (loop variable)
 8048efa:	8b 44 9c 10          	mov    0x10(%esp,%ebx,4),%eax			# %eax = local variable at the index location
 8048efe:	39 44 b4 0c          	cmp    %eax,0xc(%esp,%esi,4)			# %eax == M [0xC + %esp + %esi*4] - matching numbers are in local variable at contiguous location C or 12 bytes away
 8048f02:	75 05                	jne    8048f09 <phase_6+0x48>			# skip "explode 2" (no matching number)
 8048f04:	e8 d1 06 00 00       	call   80495da <explode_bomb>			# "EXPLODE 2" <===============================================
 8048f09:	83 c3 01             	add    $0x1,%ebx						# increment %ebx
 8048f0c:	83 fb 05             	cmp    $0x5,%ebx						# compare to 5
 8048f0f:	7e e9                	jle    8048efa <phase_6+0x39>			# back (loop?) MAYBE THIS CHECKS IF ALL NUMBERS ARR UNIQUE
 8048f11:	eb cc                	jmp    8048edf <phase_6+0x1e>
 8048f13:	8b 52 08             	mov    0x8(%edx),%edx
 8048f16:	83 c0 01             	add    $0x1,%eax
 8048f19:	39 c8                	cmp    %ecx,%eax
 8048f1b:	75 f6                	jne    8048f13 <phase_6+0x52>
 8048f1d:	89 54 b4 28          	mov    %edx,0x28(%esp,%esi,4)
 8048f21:	83 c3 01             	add    $0x1,%ebx
 8048f24:	83 fb 06             	cmp    $0x6,%ebx
 8048f27:	75 07                	jne    8048f30 <phase_6+0x6f>
 8048f29:	eb 1c                	jmp    8048f47 <phase_6+0x86>
 8048f2b:	bb 00 00 00 00       	mov    $0x0,%ebx						# END OF LOOP ?
 8048f30:	89 de                	mov    %ebx,%esi
 8048f32:	8b 4c 9c 10          	mov    0x10(%esp,%ebx,4),%ecx
 8048f36:	b8 01 00 00 00       	mov    $0x1,%eax
 8048f3b:	ba 74 d1 04 08       	mov    $0x804d174,%edx
 8048f40:	83 f9 01             	cmp    $0x1,%ecx
 8048f43:	7f ce                	jg     8048f13 <phase_6+0x52>
 8048f45:	eb d6                	jmp    8048f1d <phase_6+0x5c>
 8048f47:	8b 5c 24 28          	mov    0x28(%esp),%ebx
 8048f4b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8048f4f:	89 43 08             	mov    %eax,0x8(%ebx)
 8048f52:	8b 54 24 30          	mov    0x30(%esp),%edx
 8048f56:	89 50 08             	mov    %edx,0x8(%eax)
 8048f59:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048f5d:	89 42 08             	mov    %eax,0x8(%edx)
 8048f60:	8b 54 24 38          	mov    0x38(%esp),%edx
 8048f64:	89 50 08             	mov    %edx,0x8(%eax)
 8048f67:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 8048f6b:	89 42 08             	mov    %eax,0x8(%edx)
 8048f6e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8048f75:	be 05 00 00 00       	mov    $0x5,%esi
 8048f7a:	8b 43 08             	mov    0x8(%ebx),%eax
 8048f7d:	8b 10                	mov    (%eax),%edx
 8048f7f:	39 13                	cmp    %edx,(%ebx)
 8048f81:	7e 05                	jle    8048f88 <phase_6+0xc7>
 8048f83:	e8 52 06 00 00       	call   80495da <explode_bomb>				# "EXPLODE 3" <===============================================
 8048f88:	8b 5b 08             	mov    0x8(%ebx),%ebx
 8048f8b:	83 ee 01             	sub    $0x1,%esi
 8048f8e:	75 ea                	jne    8048f7a <phase_6+0xb9>
 8048f90:	83 c4 44             	add    $0x44,%esp
 8048f93:	5b                   	pop    %ebx
 8048f94:	5e                   	pop    %esi
 8048f95:	c3                   	ret    

08048f96 <fun7>:
 8048f96:	53                   	push   %ebx
 8048f97:	83 ec 18             	sub    $0x18,%esp
 8048f9a:	8b 54 24 20          	mov    0x20(%esp),%edx
 8048f9e:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8048fa2:	85 d2                	test   %edx,%edx
 8048fa4:	74 37                	je     8048fdd <fun7+0x47>
 8048fa6:	8b 5a 08             	mov    0x8(%edx),%ebx
 8048fa9:	39 cb                	cmp    %ecx,%ebx
 8048fab:	7e 12                	jle    8048fbf <fun7+0x29>
 8048fad:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048fb1:	8b 02                	mov    (%edx),%eax
 8048fb3:	89 04 24             	mov    %eax,(%esp)
 8048fb6:	e8 db ff ff ff       	call   8048f96 <fun7>
 8048fbb:	01 c0                	add    %eax,%eax
 8048fbd:	eb 23                	jmp    8048fe2 <fun7+0x4c>
 8048fbf:	b8 00 00 00 00       	mov    $0x0,%eax
 8048fc4:	39 cb                	cmp    %ecx,%ebx
 8048fc6:	74 1a                	je     8048fe2 <fun7+0x4c>
 8048fc8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048fcc:	8b 42 04             	mov    0x4(%edx),%eax
 8048fcf:	89 04 24             	mov    %eax,(%esp)
 8048fd2:	e8 bf ff ff ff       	call   8048f96 <fun7>
 8048fd7:	8d 44 00 01          	lea    0x1(%eax,%eax,1),%eax
 8048fdb:	eb 05                	jmp    8048fe2 <fun7+0x4c>
 8048fdd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8048fe2:	83 c4 18             	add    $0x18,%esp
 8048fe5:	5b                   	pop    %ebx
 8048fe6:	c3                   	ret    

08048fe7 <secret_phase>:
 8048fe7:	53                   	push   %ebx
 8048fe8:	83 ec 18             	sub    $0x18,%esp
 8048feb:	e8 1d 06 00 00       	call   804960d <read_line>
 8048ff0:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8048ff7:	00 
 8048ff8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048fff:	00 
 8049000:	89 04 24             	mov    %eax,(%esp)
 8049003:	e8 d8 f9 ff ff       	call   80489e0 <strtol@plt>
 8049008:	89 c3                	mov    %eax,%ebx
 804900a:	8d 40 fd             	lea    -0x3(%eax),%eax
 804900d:	3d 97 00 00 00       	cmp    $0x97,%eax
 8049012:	76 05                	jbe    8049019 <secret_phase+0x32>
 8049014:	e8 c1 05 00 00       	call   80495da <explode_bomb>
 8049019:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804901d:	c7 04 24 c0 d0 04 08 	movl   $0x804d0c0,(%esp)
 8049024:	e8 6d ff ff ff       	call   8048f96 <fun7>
 8049029:	85 c0                	test   %eax,%eax
 804902b:	74 05                	je     8049032 <secret_phase+0x4b>
 804902d:	e8 a8 05 00 00       	call   80495da <explode_bomb>
 8049032:	c7 04 24 ec a6 04 08 	movl   $0x804a6ec,(%esp)
 8049039:	e8 92 f8 ff ff       	call   80488d0 <puts@plt>
 804903e:	e8 28 07 00 00       	call   804976b <phase_defused>
 8049043:	83 c4 18             	add    $0x18,%esp
 8049046:	5b                   	pop    %ebx
 8049047:	c3                   	ret    
 8049048:	90                   	nop
 8049049:	90                   	nop
 804904a:	90                   	nop
 804904b:	90                   	nop
 804904c:	90                   	nop
 804904d:	90                   	nop
 804904e:	90                   	nop
 804904f:	90                   	nop

08049050 <sig_handler>:
 8049050:	83 ec 1c             	sub    $0x1c,%esp
 8049053:	c7 44 24 04 3e a9 04 	movl   $0x804a93e,0x4(%esp)
 804905a:	08 
 804905b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049062:	e8 29 f9 ff ff       	call   8048990 <__printf_chk@plt>
 8049067:	a1 00 d8 04 08       	mov    0x804d800,%eax
 804906c:	89 04 24             	mov    %eax,(%esp)
 804906f:	e8 bc f7 ff ff       	call   8048830 <fflush@plt>
 8049074:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804907b:	e8 e0 f7 ff ff       	call   8048860 <sleep@plt>
 8049080:	c7 04 24 4e a9 04 08 	movl   $0x804a94e,(%esp)
 8049087:	e8 44 f8 ff ff       	call   80488d0 <puts@plt>
 804908c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049093:	e8 c8 f7 ff ff       	call   8048860 <sleep@plt>
 8049098:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
 804909f:	e8 6c f8 ff ff       	call   8048910 <exit@plt>

080490a4 <invalid_phase>:
 80490a4:	83 ec 1c             	sub    $0x1c,%esp
 80490a7:	8b 44 24 20          	mov    0x20(%esp),%eax
 80490ab:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490af:	c7 44 24 04 59 a9 04 	movl   $0x804a959,0x4(%esp)
 80490b6:	08 
 80490b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80490be:	e8 cd f8 ff ff       	call   8048990 <__printf_chk@plt>
 80490c3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80490ca:	e8 41 f8 ff ff       	call   8048910 <exit@plt>

080490cf <string_length>:
 80490cf:	8b 54 24 04          	mov    0x4(%esp),%edx
 80490d3:	b8 00 00 00 00       	mov    $0x0,%eax
 80490d8:	80 3a 00             	cmpb   $0x0,(%edx)
 80490db:	74 09                	je     80490e6 <string_length+0x17>
 80490dd:	83 c0 01             	add    $0x1,%eax
 80490e0:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 80490e4:	75 f7                	jne    80490dd <string_length+0xe>
 80490e6:	f3 c3                	repz ret 

080490e8 <strings_not_equal>:
 80490e8:	83 ec 10             	sub    $0x10,%esp
 80490eb:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80490ef:	89 74 24 08          	mov    %esi,0x8(%esp)
 80490f3:	89 7c 24 0c          	mov    %edi,0xc(%esp)
 80490f7:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 80490fb:	8b 74 24 18          	mov    0x18(%esp),%esi
 80490ff:	89 1c 24             	mov    %ebx,(%esp)
 8049102:	e8 c8 ff ff ff       	call   80490cf <string_length>
 8049107:	89 c7                	mov    %eax,%edi
 8049109:	89 34 24             	mov    %esi,(%esp)
 804910c:	e8 be ff ff ff       	call   80490cf <string_length>
 8049111:	ba 01 00 00 00       	mov    $0x1,%edx
 8049116:	39 c7                	cmp    %eax,%edi
 8049118:	75 33                	jne    804914d <strings_not_equal+0x65>
 804911a:	0f b6 03             	movzbl (%ebx),%eax
 804911d:	b2 00                	mov    $0x0,%dl
 804911f:	84 c0                	test   %al,%al
 8049121:	74 2a                	je     804914d <strings_not_equal+0x65>
 8049123:	b2 01                	mov    $0x1,%dl
 8049125:	3a 06                	cmp    (%esi),%al
 8049127:	75 24                	jne    804914d <strings_not_equal+0x65>
 8049129:	b8 00 00 00 00       	mov    $0x0,%eax
 804912e:	eb 08                	jmp    8049138 <strings_not_equal+0x50>
 8049130:	83 c0 01             	add    $0x1,%eax
 8049133:	3a 14 06             	cmp    (%esi,%eax,1),%dl
 8049136:	75 10                	jne    8049148 <strings_not_equal+0x60>
 8049138:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
 804913d:	84 d2                	test   %dl,%dl
 804913f:	75 ef                	jne    8049130 <strings_not_equal+0x48>
 8049141:	ba 00 00 00 00       	mov    $0x0,%edx
 8049146:	eb 05                	jmp    804914d <strings_not_equal+0x65>
 8049148:	ba 01 00 00 00       	mov    $0x1,%edx
 804914d:	89 d0                	mov    %edx,%eax
 804914f:	8b 5c 24 04          	mov    0x4(%esp),%ebx
 8049153:	8b 74 24 08          	mov    0x8(%esp),%esi
 8049157:	8b 7c 24 0c          	mov    0xc(%esp),%edi
 804915b:	83 c4 10             	add    $0x10,%esp
 804915e:	c3                   	ret    

0804915f <strings_check>:
 804915f:	57                   	push   %edi
 8049160:	56                   	push   %esi
 8049161:	53                   	push   %ebx
 8049162:	83 ec 20             	sub    $0x20,%esp					# grow stack by 0x20 for local variables
 8049165:	8b 74 24 30          	mov    0x30(%esp),%esi				# %esi = M [%esp + 0x30]	# first param? is local input_line
 8049169:	8b 5c 24 34          	mov    0x34(%esp),%ebx				# %ebx = M [%esp + 0x34]	# second param? is the  variable phase_1
 804916d:	89 1c 24             	mov    %ebx,(%esp)					# M [%esp] = %ebx			# local var = second param
 8049170:	e8 5a ff ff ff       	call   80490cf <string_length>		# string_length of second param (input_line)
 8049175:	89 c7                	mov    %eax,%edi					# moved to %edi length of input_line
 8049177:	89 34 24             	mov    %esi,(%esp)					# first param
 804917a:	e8 50 ff ff ff       	call   80490cf <string_length>		# string length
 804917f:	ba 01 00 00 00       	mov    $0x1,%edx					# %edx = 0x1
 8049184:	39 c7                	cmp    %eax,%edi					# string length of param 1 compared to string length of second param
 8049186:	7d 65                	jge    80491ed <strings_check+0x8e>	# exit failure - so instructor should be smaller
 8049188:	0f b6 03             	movzbl (%ebx),%eax					# %eax = M [%ebx] first character of instructor string
 804918b:	84 c0                	test   %al,%al						# byte value not zero of eax's first byte
 804918d:	74 18                	je     80491a7 <strings_check+0x48>	# if zero string 0 length then error
 804918f:	3a 06                	cmp    (%esi),%al					#
 8049191:	74 09                	je     804919c <strings_check+0x3d>	# First character match
 8049193:	eb 58                	jmp    80491ed <strings_check+0x8e> # jumps to failure
 8049195:	83 c3 01             	add    $0x1,%ebx					# loop
 8049198:	3a 06                	cmp    (%esi),%al
 804919a:	75 4c                	jne    80491e8 <strings_check+0x89>
 804919c:	83 c6 01             	add    $0x1,%esi					# incrementing our pointer
 804919f:	0f b6 43 01          	movzbl 0x1(%ebx),%eax				# %eax has get his next char
 80491a3:	84 c0                	test   %al,%al
 80491a5:	75 ee                	jne    8049195 <strings_check+0x36> # if reached end of his then jump
 80491a7:	ba 01 00 00 00       	mov    $0x1,%edx					# compare to our string does it begin with space, if then fail
 80491ac:	80 3e 20             	cmpb   $0x20,(%esi)
 80491af:	75 3c                	jne    80491ed <strings_check+0x8e>	# if our string not space then fail  <===================
 80491b1:	80 7e 01 00          	cmpb   $0x0,0x1(%esi)				# did we end of our cannot match the last space of our string
 80491b5:	74 36                	je     80491ed <strings_check+0x8e>
 80491b7:	8d 44 24 1c          	lea    0x1c(%esp),%eax				# moving some local integer into eax
 80491bb:	89 44 24 08          	mov    %eax,0x8(%esp)				# moves into another local variable
 80491bf:	c7 44 24 04 08 aa 04 	movl   $0x804aa08,0x4(%esp)			# moves an address (beyong this listing) into local variable
 80491c6:	08 
 80491c7:	83 c6 01             	add    $0x1,%esi					# pointing the next non-zero char
 80491ca:	89 34 24             	mov    %esi,(%esp)					# local variable now contains will contain 1
 80491cd:	e8 7e f7 ff ff       	call   8048950 <__isoc99_sscanf@plt>
 80491d2:	ba 01 00 00 00       	mov    $0x1,%edx
 80491d7:	83 f8 01             	cmp    $0x1,%eax					# did sscanf return 1, remaning read read one variable
 80491da:	75 11                	jne    80491ed <strings_check+0x8e> # fail if scanf did not return 1
 80491dc:	3b 7c 24 1c          	cmp    0x1c(%esp),%edi				# length of input string to some local variable
 80491e0:	0f 95 c2             	setne  %dl							# input_line length has to match his internal local length
 80491e3:	0f b6 d2             	movzbl %dl,%edx							# this success point because 0 is being moved into %edx
 80491e6:	eb 05                	jmp    80491ed <strings_check+0x8e>
 80491e8:	ba 01 00 00 00       	mov    $0x1,%edx
 80491ed:	89 d0                	mov    %edx,%eax
 80491ef:	83 c4 20             	add    $0x20,%esp
 80491f2:	5b                   	pop    %ebx
 80491f3:	5e                   	pop    %esi
 80491f4:	5f                   	pop    %edi
 80491f5:	c3                   	ret    

080491f6 <strings_close>:
 80491f6:	57                   	push   %edi
 80491f7:	56                   	push   %esi
 80491f8:	53                   	push   %ebx
 80491f9:	83 ec 04             	sub    $0x4,%esp
 80491fc:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 8049200:	8b 74 24 18          	mov    0x18(%esp),%esi
 8049204:	89 1c 24             	mov    %ebx,(%esp)
 8049207:	e8 c3 fe ff ff       	call   80490cf <string_length>
 804920c:	89 c7                	mov    %eax,%edi
 804920e:	89 34 24             	mov    %esi,(%esp)
 8049211:	e8 b9 fe ff ff       	call   80490cf <string_length>
 8049216:	ba 01 00 00 00       	mov    $0x1,%edx
 804921b:	39 c7                	cmp    %eax,%edi
 804921d:	75 46                	jne    8049265 <strings_close+0x6f>
 804921f:	0f b6 03             	movzbl (%ebx),%eax
 8049222:	b2 00                	mov    $0x0,%dl
 8049224:	84 c0                	test   %al,%al
 8049226:	74 3d                	je     8049265 <strings_close+0x6f>
 8049228:	0f be c0             	movsbl %al,%eax
 804922b:	83 c0 01             	add    $0x1,%eax
 804922e:	0f be 0e             	movsbl (%esi),%ecx
 8049231:	b2 01                	mov    $0x1,%dl
 8049233:	39 c8                	cmp    %ecx,%eax
 8049235:	75 2e                	jne    8049265 <strings_close+0x6f>
 8049237:	b8 00 00 00 00       	mov    $0x0,%eax
 804923c:	eb 12                	jmp    8049250 <strings_close+0x5a>
 804923e:	0f be 4c 06 01       	movsbl 0x1(%esi,%eax,1),%ecx
 8049243:	83 c0 01             	add    $0x1,%eax
 8049246:	0f be d2             	movsbl %dl,%edx
 8049249:	83 c2 01             	add    $0x1,%edx
 804924c:	39 ca                	cmp    %ecx,%edx
 804924e:	75 10                	jne    8049260 <strings_close+0x6a>
 8049250:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
 8049255:	84 d2                	test   %dl,%dl
 8049257:	75 e5                	jne    804923e <strings_close+0x48>
 8049259:	ba 00 00 00 00       	mov    $0x0,%edx
 804925e:	eb 05                	jmp    8049265 <strings_close+0x6f>
 8049260:	ba 01 00 00 00       	mov    $0x1,%edx
 8049265:	89 d0                	mov    %edx,%eax
 8049267:	83 c4 04             	add    $0x4,%esp
 804926a:	5b                   	pop    %ebx
 804926b:	5e                   	pop    %esi
 804926c:	5f                   	pop    %edi
 804926d:	c3                   	ret    

0804926e <initialize_bomb>:
 804926e:	56                   	push   %esi
 804926f:	53                   	push   %ebx
 8049270:	81 ec 84 20 00 00    	sub    $0x2084,%esp
 8049276:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 804927c:	89 84 24 7c 20 00 00 	mov    %eax,0x207c(%esp)
 8049283:	31 c0                	xor    %eax,%eax
 8049285:	c7 44 24 04 50 90 04 	movl   $0x8049050,0x4(%esp)
 804928c:	08 
 804928d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049294:	e8 b7 f5 ff ff       	call   8048850 <signal@plt>
 8049299:	c6 84 24 7b 20 00 00 	movb   $0x0,0x207b(%esp)
 80492a0:	00 
 80492a1:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
 80492a8:	00 
 80492a9:	8d 84 24 3c 20 00 00 	lea    0x203c(%esp),%eax
 80492b0:	89 04 24             	mov    %eax,(%esp)
 80492b3:	e8 f8 f5 ff ff       	call   80488b0 <gethostname@plt>
 80492b8:	85 c0                	test   %eax,%eax
 80492ba:	74 18                	je     80492d4 <initialize_bomb+0x66>
 80492bc:	c7 04 24 44 ae 04 08 	movl   $0x804ae44,(%esp)
 80492c3:	e8 08 f6 ff ff       	call   80488d0 <puts@plt>
 80492c8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80492cf:	e8 3c f6 ff ff       	call   8048910 <exit@plt>
 80492d4:	b9 00 00 00 00       	mov    $0x0,%ecx
 80492d9:	ba 20 00 00 00       	mov    $0x20,%edx
 80492de:	b8 00 00 00 00       	mov    $0x0,%eax
 80492e3:	89 4c 04 18          	mov    %ecx,0x18(%esp,%eax,1)				# loop to 80492ec
 80492e7:	83 c0 04             	add    $0x4,%eax
 80492ea:	39 d0                	cmp    %edx,%eax
 80492ec:	72 f5                	jb     80492e3 <initialize_bomb+0x75> 		# 80492e3
 80492ee:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%esp)
 80492f5:	00 
 80492f6:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
 80492fd:	00 
 80492fe:	8d 44 24 38          	lea    0x38(%esp),%eax
 8049302:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049306:	8d 44 24 18          	lea    0x18(%esp),%eax
 804930a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804930e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8049315:	00 
 8049316:	8d 84 24 3c 20 00 00 	lea    0x203c(%esp),%eax
 804931d:	89 04 24             	mov    %eax,(%esp)
 8049320:	e8 8b f6 ff ff       	call   80489b0 <getaddrinfo@plt>
 8049325:	85 c0                	test   %eax,%eax
 8049327:	74 35                	je     804935e <initialize_bomb+0xf0>
 8049329:	89 04 24             	mov    %eax,(%esp)
 804932c:	e8 4f f6 ff ff       	call   8048980 <gai_strerror@plt>
 8049331:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049335:	c7 44 24 08 70 ae 04 	movl   $0x804ae70,0x8(%esp)
 804933c:	08 
 804933d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049344:	00 
 8049345:	a1 e0 d7 04 08       	mov    0x804d7e0,%eax
 804934a:	89 04 24             	mov    %eax,(%esp)
 804934d:	e8 6e f6 ff ff       	call   80489c0 <__fprintf_chk@plt>
 8049352:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049359:	e8 b2 f5 ff ff       	call   8048910 <exit@plt>
 804935e:	8b 44 24 38          	mov    0x38(%esp),%eax
 8049362:	8b 70 18             	mov    0x18(%eax),%esi
 8049365:	85 f6                	test   %esi,%esi
 8049367:	74 18                	je     8049381 <initialize_bomb+0x113>
 8049369:	80 3e 00             	cmpb   $0x0,(%esi)
 804936c:	74 13                	je     8049381 <initialize_bomb+0x113>
 804936e:	a1 e0 d5 04 08       	mov    0x804d5e0,%eax
 8049373:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049378:	85 c0                	test   %eax,%eax
 804937a:	75 36                	jne    80493b2 <initialize_bomb+0x144>
 804937c:	e9 89 00 00 00       	jmp    804940a <initialize_bomb+0x19c>
 8049381:	a1 e0 d7 04 08       	mov    0x804d7e0,%eax
 8049386:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804938a:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
 8049391:	00 
 8049392:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049399:	00 
 804939a:	c7 04 24 9c ae 04 08 	movl   $0x804ae9c,(%esp)
 80493a1:	e8 ea f4 ff ff       	call   8048890 <fwrite@plt>
 80493a6:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80493ad:	e8 5e f5 ff ff       	call   8048910 <exit@plt>
 80493b2:	89 74 24 04          	mov    %esi,0x4(%esp)
 80493b6:	89 04 24             	mov    %eax,(%esp)
 80493b9:	e8 82 f5 ff ff       	call   8048940 <strcasecmp@plt>
 80493be:	85 c0                	test   %eax,%eax
 80493c0:	74 10                	je     80493d2 <initialize_bomb+0x164>
 80493c2:	83 c3 01             	add    $0x1,%ebx
 80493c5:	8b 04 9d e0 d5 04 08 	mov    0x804d5e0(,%ebx,4),%eax
 80493cc:	85 c0                	test   %eax,%eax
 80493ce:	75 e2                	jne    80493b2 <initialize_bomb+0x144>
 80493d0:	eb 38                	jmp    804940a <initialize_bomb+0x19c>
 80493d2:	8d 44 24 3c          	lea    0x3c(%esp),%eax
 80493d6:	89 04 24             	mov    %eax,(%esp)
 80493d9:	e8 13 0e 00 00       	call   804a1f1 <init_driver>
 80493de:	85 c0                	test   %eax,%eax
 80493e0:	79 4c                	jns    804942e <initialize_bomb+0x1c0>
 80493e2:	8d 44 24 3c          	lea    0x3c(%esp),%eax
 80493e6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80493ea:	c7 44 24 04 6a a9 04 	movl   $0x804a96a,0x4(%esp)
 80493f1:	08 
 80493f2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80493f9:	e8 92 f5 ff ff       	call   8048990 <__printf_chk@plt>
 80493fe:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049405:	e8 06 f5 ff ff       	call   8048910 <exit@plt>
 804940a:	89 74 24 08          	mov    %esi,0x8(%esp)
 804940e:	c7 44 24 04 c0 ae 04 	movl   $0x804aec0,0x4(%esp)
 8049415:	08 
 8049416:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804941d:	e8 6e f5 ff ff       	call   8048990 <__printf_chk@plt>
 8049422:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049429:	e8 e2 f4 ff ff       	call   8048910 <exit@plt>
 804942e:	8b 84 24 7c 20 00 00 	mov    0x207c(%esp),%eax
 8049435:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 804943c:	74 05                	je     8049443 <initialize_bomb+0x1d5>
 804943e:	e8 3d f4 ff ff       	call   8048880 <__stack_chk_fail@plt>
 8049443:	81 c4 84 20 00 00    	add    $0x2084,%esp
 8049449:	5b                   	pop    %ebx
 804944a:	5e                   	pop    %esi
 804944b:	c3                   	ret    

0804944c <initialize_bomb_solve>:
 804944c:	f3 c3                	repz ret 

0804944e <blank_line>:
 804944e:	56                   	push   %esi
 804944f:	53                   	push   %ebx
 8049450:	83 ec 04             	sub    $0x4,%esp
 8049453:	8b 74 24 10          	mov    0x10(%esp),%esi
 8049457:	eb 14                	jmp    804946d <blank_line+0x1f>
 8049459:	e8 b2 f5 ff ff       	call   8048a10 <__ctype_b_loc@plt>
 804945e:	83 c6 01             	add    $0x1,%esi
 8049461:	0f be db             	movsbl %bl,%ebx
 8049464:	8b 00                	mov    (%eax),%eax
 8049466:	f6 44 58 01 20       	testb  $0x20,0x1(%eax,%ebx,2)
 804946b:	74 0e                	je     804947b <blank_line+0x2d>
 804946d:	0f b6 1e             	movzbl (%esi),%ebx
 8049470:	84 db                	test   %bl,%bl
 8049472:	75 e5                	jne    8049459 <blank_line+0xb>
 8049474:	b8 01 00 00 00       	mov    $0x1,%eax
 8049479:	eb 05                	jmp    8049480 <blank_line+0x32>
 804947b:	b8 00 00 00 00       	mov    $0x0,%eax
 8049480:	83 c4 04             	add    $0x4,%esp
 8049483:	5b                   	pop    %ebx
 8049484:	5e                   	pop    %esi
 8049485:	c3                   	ret    

08049486 <skip>:
 8049486:	53                   	push   %ebx
 8049487:	83 ec 18             	sub    $0x18,%esp
 804948a:	a1 10 d8 04 08       	mov    0x804d810,%eax
 804948f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049493:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
 804949a:	00 
 804949b:	a1 0c d8 04 08       	mov    0x804d80c,%eax
 80494a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 80494a3:	c1 e0 04             	shl    $0x4,%eax
 80494a6:	05 20 d8 04 08       	add    $0x804d820,%eax
 80494ab:	89 04 24             	mov    %eax,(%esp)
 80494ae:	e8 8d f3 ff ff       	call   8048840 <fgets@plt>
 80494b3:	89 c3                	mov    %eax,%ebx
 80494b5:	85 c0                	test   %eax,%eax
 80494b7:	74 0c                	je     80494c5 <skip+0x3f>
 80494b9:	89 04 24             	mov    %eax,(%esp)
 80494bc:	e8 8d ff ff ff       	call   804944e <blank_line>
 80494c1:	85 c0                	test   %eax,%eax
 80494c3:	75 c5                	jne    804948a <skip+0x4>
 80494c5:	89 d8                	mov    %ebx,%eax
 80494c7:	83 c4 18             	add    $0x18,%esp
 80494ca:	5b                   	pop    %ebx
 80494cb:	c3                   	ret    

080494cc <send_msg>:
 80494cc:	57                   	push   %edi
 80494cd:	53                   	push   %ebx
 80494ce:	81 ec 34 40 00 00    	sub    $0x4034,%esp
 80494d4:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 80494da:	89 84 24 2c 40 00 00 	mov    %eax,0x402c(%esp)
 80494e1:	31 c0                	xor    %eax,%eax
 80494e3:	8b 15 0c d8 04 08    	mov    0x804d80c,%edx
 80494e9:	8d 5c 92 fb          	lea    -0x5(%edx,%edx,4),%ebx
 80494ed:	c1 e3 04             	shl    $0x4,%ebx
 80494f0:	81 c3 20 d8 04 08    	add    $0x804d820,%ebx
 80494f6:	89 df                	mov    %ebx,%edi
 80494f8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80494fd:	f2 ae                	repnz scas %es:(%edi),%al
 80494ff:	f7 d1                	not    %ecx
 8049501:	83 c1 63             	add    $0x63,%ecx
 8049504:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
 804950a:	76 20                	jbe    804952c <send_msg+0x60>
 804950c:	c7 44 24 04 f8 ae 04 	movl   $0x804aef8,0x4(%esp)
 8049513:	08 
 8049514:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804951b:	e8 70 f4 ff ff       	call   8048990 <__printf_chk@plt>
 8049520:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049527:	e8 e4 f3 ff ff       	call   8048910 <exit@plt>
 804952c:	83 bc 24 40 40 00 00 	cmpl   $0x0,0x4040(%esp)
 8049533:	00 
 8049534:	b8 88 a9 04 08       	mov    $0x804a988,%eax
 8049539:	b9 90 a9 04 08       	mov    $0x804a990,%ecx
 804953e:	0f 44 c1             	cmove  %ecx,%eax
 8049541:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
 8049545:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049549:	89 44 24 14          	mov    %eax,0x14(%esp)
 804954d:	a1 c0 d5 04 08       	mov    0x804d5c0,%eax
 8049552:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049556:	c7 44 24 0c 99 a9 04 	movl   $0x804a999,0xc(%esp)
 804955d:	08 
 804955e:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 8049565:	00 
 8049566:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804956d:	00 
 804956e:	8d 5c 24 2c          	lea    0x2c(%esp),%ebx
 8049572:	89 1c 24             	mov    %ebx,(%esp)
 8049575:	e8 a6 f4 ff ff       	call   8048a20 <__sprintf_chk@plt>
 804957a:	8d 84 24 2c 20 00 00 	lea    0x202c(%esp),%eax
 8049581:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049585:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804958c:	00 
 804958d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8049591:	c7 04 24 c0 d1 04 08 	movl   $0x804d1c0,(%esp)
 8049598:	e8 3c 0e 00 00       	call   804a3d9 <driver_post>
 804959d:	85 c0                	test   %eax,%eax
 804959f:	79 1b                	jns    80495bc <send_msg+0xf0>
 80495a1:	8d 84 24 2c 20 00 00 	lea    0x202c(%esp),%eax
 80495a8:	89 04 24             	mov    %eax,(%esp)
 80495ab:	e8 20 f3 ff ff       	call   80488d0 <puts@plt>
 80495b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80495b7:	e8 54 f3 ff ff       	call   8048910 <exit@plt>
 80495bc:	8b 84 24 2c 40 00 00 	mov    0x402c(%esp),%eax
 80495c3:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 80495ca:	74 05                	je     80495d1 <send_msg+0x105>
 80495cc:	e8 af f2 ff ff       	call   8048880 <__stack_chk_fail@plt>
 80495d1:	81 c4 34 40 00 00    	add    $0x4034,%esp
 80495d7:	5b                   	pop    %ebx
 80495d8:	5f                   	pop    %edi
 80495d9:	c3                   	ret    

080495da <explode_bomb>:
 80495da:	83 ec 1c             	sub    $0x1c,%esp
 80495dd:	c7 04 24 1c af 04 08 	movl   $0x804af1c,(%esp)
 80495e4:	e8 e7 f2 ff ff       	call   80488d0 <puts@plt>
 80495e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80495f0:	e8 d7 fe ff ff       	call   80494cc <send_msg>
 80495f5:	c7 04 24 4c af 04 08 	movl   $0x804af4c,(%esp)
 80495fc:	e8 cf f2 ff ff       	call   80488d0 <puts@plt>
 8049601:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049608:	e8 03 f3 ff ff       	call   8048910 <exit@plt>

0804960d <read_line>:
 804960d:	83 ec 2c             	sub    $0x2c,%esp
 8049610:	89 5c 24 20          	mov    %ebx,0x20(%esp)
 8049614:	89 74 24 24          	mov    %esi,0x24(%esp)
 8049618:	89 7c 24 28          	mov    %edi,0x28(%esp)
 804961c:	e8 65 fe ff ff       	call   8049486 <skip>
 8049621:	85 c0                	test   %eax,%eax
 8049623:	75 6c                	jne    8049691 <read_line+0x84>
 8049625:	a1 e4 d7 04 08       	mov    0x804d7e4,%eax
 804962a:	39 05 10 d8 04 08    	cmp    %eax,0x804d810
 8049630:	75 18                	jne    804964a <read_line+0x3d>
 8049632:	c7 04 24 a5 a9 04 08 	movl   $0x804a9a5,(%esp)
 8049639:	e8 92 f2 ff ff       	call   80488d0 <puts@plt>
 804963e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049645:	e8 c6 f2 ff ff       	call   8048910 <exit@plt>
 804964a:	c7 04 24 c3 a9 04 08 	movl   $0x804a9c3,(%esp)
 8049651:	e8 6a f2 ff ff       	call   80488c0 <getenv@plt>
 8049656:	85 c0                	test   %eax,%eax
 8049658:	74 0c                	je     8049666 <read_line+0x59>
 804965a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049661:	e8 aa f2 ff ff       	call   8048910 <exit@plt>
 8049666:	a1 e4 d7 04 08       	mov    0x804d7e4,%eax
 804966b:	a3 10 d8 04 08       	mov    %eax,0x804d810
 8049670:	e8 11 fe ff ff       	call   8049486 <skip>
 8049675:	85 c0                	test   %eax,%eax
 8049677:	75 18                	jne    8049691 <read_line+0x84>
 8049679:	c7 04 24 a5 a9 04 08 	movl   $0x804a9a5,(%esp)
 8049680:	e8 4b f2 ff ff       	call   80488d0 <puts@plt>
 8049685:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804968c:	e8 7f f2 ff ff       	call   8048910 <exit@plt>
 8049691:	8b 15 0c d8 04 08    	mov    0x804d80c,%edx
 8049697:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 804969a:	c1 e3 04             	shl    $0x4,%ebx
 804969d:	81 c3 20 d8 04 08    	add    $0x804d820,%ebx
 80496a3:	89 df                	mov    %ebx,%edi
 80496a5:	b8 00 00 00 00       	mov    $0x0,%eax
 80496aa:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80496af:	f2 ae                	repnz scas %es:(%edi),%al
 80496b1:	f7 d1                	not    %ecx
 80496b3:	83 e9 01             	sub    $0x1,%ecx
 80496b6:	83 f9 4e             	cmp    $0x4e,%ecx
 80496b9:	7e 37                	jle    80496f2 <read_line+0xe5>
 80496bb:	c7 04 24 ce a9 04 08 	movl   $0x804a9ce,(%esp)
 80496c2:	e8 09 f2 ff ff       	call   80488d0 <puts@plt>
 80496c7:	a1 0c d8 04 08       	mov    0x804d80c,%eax
 80496cc:	8d 50 01             	lea    0x1(%eax),%edx
 80496cf:	89 15 0c d8 04 08    	mov    %edx,0x804d80c
 80496d5:	6b c0 50             	imul   $0x50,%eax,%eax
 80496d8:	05 20 d8 04 08       	add    $0x804d820,%eax
 80496dd:	ba e9 a9 04 08       	mov    $0x804a9e9,%edx
 80496e2:	b9 04 00 00 00       	mov    $0x4,%ecx
 80496e7:	89 c7                	mov    %eax,%edi
 80496e9:	89 d6                	mov    %edx,%esi
 80496eb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 80496ed:	e8 e8 fe ff ff       	call   80495da <explode_bomb>
 80496f2:	8d 04 92             	lea    (%edx,%edx,4),%eax
 80496f5:	c1 e0 04             	shl    $0x4,%eax
 80496f8:	c6 84 01 1f d8 04 08 	movb   $0x0,0x804d81f(%ecx,%eax,1)
 80496ff:	00 
 8049700:	83 c2 01             	add    $0x1,%edx
 8049703:	89 15 0c d8 04 08    	mov    %edx,0x804d80c
 8049709:	89 d8                	mov    %ebx,%eax
 804970b:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 804970f:	8b 74 24 24          	mov    0x24(%esp),%esi
 8049713:	8b 7c 24 28          	mov    0x28(%esp),%edi
 8049717:	83 c4 2c             	add    $0x2c,%esp
 804971a:	c3                   	ret    

0804971b <read_six_numbers>:
 804971b:	83 ec 2c             	sub    $0x2c,%esp					# grow stack pointer for local variables
 804971e:	8b 44 24 34          	mov    0x34(%esp),%eax				# 34-2c = 8
 8049722:	8d 50 14             	lea    0x14(%eax),%edx				# ptr to 6th integer
 8049725:	89 54 24 1c          	mov    %edx,0x1c(%esp)				# first is 6th arg
 8049729:	8d 50 10             	lea    0x10(%eax),%edx				# ptr to 5th integer
 804972c:	89 54 24 18          	mov    %edx,0x18(%esp)				# x-1 arg, fifth scanf param
 8049730:	8d 50 0c             	lea    0xc(%eax),%edx				# 4th ptr
 8049733:	89 54 24 14          	mov    %edx,0x14(%esp)				# x-2 arg, 4th scanf param
 8049737:	8d 50 08             	lea    0x8(%eax),%edx				# offset 2 down x
 804973a:	89 54 24 10          	mov    %edx,0x10(%esp)				# third sscanf param
 804973e:	8d 50 04             	lea    0x4(%eax),%edx
 8049741:	89 54 24 0c          	mov    %edx,0xc(%esp)				# second scanf param
 8049745:	89 44 24 08          	mov    %eax,0x8(%esp)				# first scanf param
 8049749:	c7 44 24 04 f9 a9 04 	movl   $0x804a9f9,0x4(%esp)			# format
 8049750:	08 
 8049751:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049755:	89 04 24             	mov    %eax,(%esp)					# input line
 8049758:	e8 f3 f1 ff ff       	call   8048950 <__isoc99_sscanf@plt>
 804975d:	83 f8 05             	cmp    $0x5,%eax						# read more than 5 numbers and succeed??
 8049760:	7f 05                	jg     8049767 <read_six_numbers+0x4c> # success
 8049762:	e8 73 fe ff ff       	call   80495da <explode_bomb>
 8049767:	83 c4 2c             	add    $0x2c,%esp
 804976a:	c3                   	ret    

0804976b <phase_defused>:
 804976b:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 8049771:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 8049777:	89 44 24 7c          	mov    %eax,0x7c(%esp)
 804977b:	31 c0                	xor    %eax,%eax
 804977d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049784:	e8 43 fd ff ff       	call   80494cc <send_msg>
 8049789:	83 3d 0c d8 04 08 06 	cmpl   $0x6,0x804d80c
 8049790:	75 72                	jne    8049804 <phase_defused+0x99>
 8049792:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 8049796:	89 44 24 10          	mov    %eax,0x10(%esp)
 804979a:	8d 44 24 28          	lea    0x28(%esp),%eax
 804979e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80497a2:	8d 44 24 24          	lea    0x24(%esp),%eax
 80497a6:	89 44 24 08          	mov    %eax,0x8(%esp)
 80497aa:	c7 44 24 04 0b aa 04 	movl   $0x804aa0b,0x4(%esp)
 80497b1:	08 
 80497b2:	c7 04 24 10 d9 04 08 	movl   $0x804d910,(%esp)
 80497b9:	e8 92 f1 ff ff       	call   8048950 <__isoc99_sscanf@plt>
 80497be:	83 f8 03             	cmp    $0x3,%eax
 80497c1:	75 29                	jne    80497ec <phase_defused+0x81>
 80497c3:	c7 44 24 04 14 aa 04 	movl   $0x804aa14,0x4(%esp)
 80497ca:	08 
 80497cb:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 80497cf:	89 04 24             	mov    %eax,(%esp)
 80497d2:	e8 1f fa ff ff       	call   80491f6 <strings_close>
 80497d7:	85 c0                	test   %eax,%eax
 80497d9:	75 11                	jne    80497ec <phase_defused+0x81>
 80497db:	c7 04 24 94 af 04 08 	movl   $0x804af94,(%esp)
 80497e2:	e8 e9 f0 ff ff       	call   80488d0 <puts@plt>
 80497e7:	e8 fb f7 ff ff       	call   8048fe7 <secret_phase>
 80497ec:	c7 04 24 b8 af 04 08 	movl   $0x804afb8,(%esp)
 80497f3:	e8 d8 f0 ff ff       	call   80488d0 <puts@plt>
 80497f8:	c7 04 24 e8 af 04 08 	movl   $0x804afe8,(%esp)
 80497ff:	e8 cc f0 ff ff       	call   80488d0 <puts@plt>
 8049804:	8b 44 24 7c          	mov    0x7c(%esp),%eax
 8049808:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 804980f:	74 05                	je     8049816 <phase_defused+0xab>
 8049811:	e8 6a f0 ff ff       	call   8048880 <__stack_chk_fail@plt>
 8049816:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804981c:	c3                   	ret    
 804981d:	90                   	nop
 804981e:	90                   	nop
 804981f:	90                   	nop

08049820 <rio_readlineb>:
 8049820:	55                   	push   %ebp
 8049821:	57                   	push   %edi
 8049822:	56                   	push   %esi
 8049823:	53                   	push   %ebx
 8049824:	83 ec 3c             	sub    $0x3c,%esp
 8049827:	89 c3                	mov    %eax,%ebx
 8049829:	83 f9 01             	cmp    $0x1,%ecx
 804982c:	0f 86 bb 00 00 00    	jbe    80498ed <rio_readlineb+0xcd>
 8049832:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 8049836:	89 54 24 18          	mov    %edx,0x18(%esp)
 804983a:	bd 01 00 00 00       	mov    $0x1,%ebp
 804983f:	8d 78 0c             	lea    0xc(%eax),%edi
 8049842:	eb 3c                	jmp    8049880 <rio_readlineb+0x60>
 8049844:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 804984b:	00 
 804984c:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049850:	8b 03                	mov    (%ebx),%eax
 8049852:	89 04 24             	mov    %eax,(%esp)
 8049855:	e8 c6 ef ff ff       	call   8048820 <read@plt>
 804985a:	89 43 04             	mov    %eax,0x4(%ebx)
 804985d:	85 c0                	test   %eax,%eax
 804985f:	79 14                	jns    8049875 <rio_readlineb+0x55>
 8049861:	e8 0a f1 ff ff       	call   8048970 <__errno_location@plt>
 8049866:	83 38 04             	cmpl   $0x4,(%eax)
 8049869:	74 15                	je     8049880 <rio_readlineb+0x60>
 804986b:	90                   	nop
 804986c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049870:	e9 a0 00 00 00       	jmp    8049915 <rio_readlineb+0xf5>
 8049875:	85 c0                	test   %eax,%eax
 8049877:	0f 84 9f 00 00 00    	je     804991c <rio_readlineb+0xfc>
 804987d:	89 7b 08             	mov    %edi,0x8(%ebx)
 8049880:	8b 73 04             	mov    0x4(%ebx),%esi
 8049883:	85 f6                	test   %esi,%esi
 8049885:	7e bd                	jle    8049844 <rio_readlineb+0x24>
 8049887:	85 f6                	test   %esi,%esi
 8049889:	0f 85 96 00 00 00    	jne    8049925 <rio_readlineb+0x105>
 804988f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8049896:	00 
 8049897:	89 74 24 08          	mov    %esi,0x8(%esp)
 804989b:	8b 43 08             	mov    0x8(%ebx),%eax
 804989e:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498a2:	8d 44 24 2f          	lea    0x2f(%esp),%eax
 80498a6:	89 04 24             	mov    %eax,(%esp)
 80498a9:	e8 42 f0 ff ff       	call   80488f0 <__memcpy_chk@plt>
 80498ae:	01 73 08             	add    %esi,0x8(%ebx)
 80498b1:	29 73 04             	sub    %esi,0x4(%ebx)
 80498b4:	83 fe 01             	cmp    $0x1,%esi
 80498b7:	75 18                	jne    80498d1 <rio_readlineb+0xb1>
 80498b9:	0f b6 44 24 2f       	movzbl 0x2f(%esp),%eax
 80498be:	8b 54 24 18          	mov    0x18(%esp),%edx
 80498c2:	88 02                	mov    %al,(%edx)
 80498c4:	83 c2 01             	add    $0x1,%edx
 80498c7:	89 54 24 18          	mov    %edx,0x18(%esp)
 80498cb:	3c 0a                	cmp    $0xa,%al
 80498cd:	75 13                	jne    80498e2 <rio_readlineb+0xc2>
 80498cf:	eb 25                	jmp    80498f6 <rio_readlineb+0xd6>
 80498d1:	89 e8                	mov    %ebp,%eax
 80498d3:	85 f6                	test   %esi,%esi
 80498d5:	75 28                	jne    80498ff <rio_readlineb+0xdf>
 80498d7:	83 f8 01             	cmp    $0x1,%eax
 80498da:	75 1a                	jne    80498f6 <rio_readlineb+0xd6>
 80498dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80498e0:	eb 24                	jmp    8049906 <rio_readlineb+0xe6>
 80498e2:	83 c5 01             	add    $0x1,%ebp
 80498e5:	3b 6c 24 1c          	cmp    0x1c(%esp),%ebp
 80498e9:	75 95                	jne    8049880 <rio_readlineb+0x60>
 80498eb:	eb 09                	jmp    80498f6 <rio_readlineb+0xd6>
 80498ed:	89 54 24 18          	mov    %edx,0x18(%esp)
 80498f1:	bd 01 00 00 00       	mov    $0x1,%ebp
 80498f6:	8b 44 24 18          	mov    0x18(%esp),%eax
 80498fa:	c6 00 00             	movb   $0x0,(%eax)
 80498fd:	eb 0c                	jmp    804990b <rio_readlineb+0xeb>
 80498ff:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
 8049904:	eb 05                	jmp    804990b <rio_readlineb+0xeb>
 8049906:	bd 00 00 00 00       	mov    $0x0,%ebp
 804990b:	89 e8                	mov    %ebp,%eax
 804990d:	83 c4 3c             	add    $0x3c,%esp
 8049910:	5b                   	pop    %ebx
 8049911:	5e                   	pop    %esi
 8049912:	5f                   	pop    %edi
 8049913:	5d                   	pop    %ebp
 8049914:	c3                   	ret    
 8049915:	be ff ff ff ff       	mov    $0xffffffff,%esi
 804991a:	eb 05                	jmp    8049921 <rio_readlineb+0x101>
 804991c:	be 00 00 00 00       	mov    $0x0,%esi
 8049921:	89 e8                	mov    %ebp,%eax
 8049923:	eb ae                	jmp    80498d3 <rio_readlineb+0xb3>
 8049925:	8b 43 08             	mov    0x8(%ebx),%eax
 8049928:	0f b6 00             	movzbl (%eax),%eax
 804992b:	88 44 24 2f          	mov    %al,0x2f(%esp)
 804992f:	83 43 08 01          	addl   $0x1,0x8(%ebx)
 8049933:	83 6b 04 01          	subl   $0x1,0x4(%ebx)
 8049937:	eb 80                	jmp    80498b9 <rio_readlineb+0x99>

08049939 <sigalrm_handler>:
 8049939:	83 ec 1c             	sub    $0x1c,%esp
 804993c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8049943:	00 
 8049944:	c7 44 24 08 1c b0 04 	movl   $0x804b01c,0x8(%esp)
 804994b:	08 
 804994c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049953:	00 
 8049954:	a1 e0 d7 04 08       	mov    0x804d7e0,%eax
 8049959:	89 04 24             	mov    %eax,(%esp)
 804995c:	e8 5f f0 ff ff       	call   80489c0 <__fprintf_chk@plt>
 8049961:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049968:	e8 a3 ef ff ff       	call   8048910 <exit@plt>

0804996d <submitr>:
 804996d:	55                   	push   %ebp
 804996e:	57                   	push   %edi
 804996f:	56                   	push   %esi
 8049970:	53                   	push   %ebx
 8049971:	81 ec 7c a0 00 00    	sub    $0xa07c,%esp
 8049977:	8b 9c 24 90 a0 00 00 	mov    0xa090(%esp),%ebx
 804997e:	8b 84 24 98 a0 00 00 	mov    0xa098(%esp),%eax
 8049985:	89 44 24 30          	mov    %eax,0x30(%esp)
 8049989:	8b 94 24 9c a0 00 00 	mov    0xa09c(%esp),%edx
 8049990:	89 54 24 34          	mov    %edx,0x34(%esp)
 8049994:	8b 8c 24 a0 a0 00 00 	mov    0xa0a0(%esp),%ecx
 804999b:	89 4c 24 38          	mov    %ecx,0x38(%esp)
 804999f:	8b ac 24 a4 a0 00 00 	mov    0xa0a4(%esp),%ebp
 80499a6:	8b 84 24 a8 a0 00 00 	mov    0xa0a8(%esp),%eax
 80499ad:	89 44 24 28          	mov    %eax,0x28(%esp)
 80499b1:	65 8b 15 14 00 00 00 	mov    %gs:0x14,%edx
 80499b8:	89 94 24 6c a0 00 00 	mov    %edx,0xa06c(%esp)
 80499bf:	31 d2                	xor    %edx,%edx
 80499c1:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
 80499c8:	00 
 80499c9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80499d0:	00 
 80499d1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80499d8:	00 
 80499d9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80499e0:	e8 bb ef ff ff       	call   80489a0 <socket@plt>
 80499e5:	89 44 24 2c          	mov    %eax,0x2c(%esp)
 80499e9:	85 c0                	test   %eax,%eax
 80499eb:	79 52                	jns    8049a3f <submitr+0xd2>
 80499ed:	8b 4c 24 28          	mov    0x28(%esp),%ecx
 80499f1:	c7 01 45 72 72 6f    	movl   $0x6f727245,(%ecx)
 80499f7:	c7 41 04 72 3a 20 43 	movl   $0x43203a72,0x4(%ecx)
 80499fe:	c7 41 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%ecx)
 8049a05:	c7 41 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%ecx)
 8049a0c:	c7 41 10 61 62 6c 65 	movl   $0x656c6261,0x10(%ecx)
 8049a13:	c7 41 14 20 74 6f 20 	movl   $0x206f7420,0x14(%ecx)
 8049a1a:	c7 41 18 63 72 65 61 	movl   $0x61657263,0x18(%ecx)
 8049a21:	c7 41 1c 74 65 20 73 	movl   $0x73206574,0x1c(%ecx)
 8049a28:	c7 41 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%ecx)
 8049a2f:	66 c7 41 24 74 00    	movw   $0x74,0x24(%ecx)
 8049a35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049a3a:	e9 e8 06 00 00       	jmp    804a127 <submitr+0x7ba>
 8049a3f:	89 1c 24             	mov    %ebx,(%esp)
 8049a42:	e8 89 ef ff ff       	call   80489d0 <gethostbyname@plt>
 8049a47:	85 c0                	test   %eax,%eax
 8049a49:	75 70                	jne    8049abb <submitr+0x14e>
 8049a4b:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049a4f:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049a55:	c7 40 04 72 3a 20 44 	movl   $0x44203a72,0x4(%eax)
 8049a5c:	c7 40 08 4e 53 20 69 	movl   $0x6920534e,0x8(%eax)
 8049a63:	c7 40 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%eax)
 8049a6a:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049a71:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049a78:	c7 40 18 72 65 73 6f 	movl   $0x6f736572,0x18(%eax)
 8049a7f:	c7 40 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%eax)
 8049a86:	c7 40 20 73 65 72 76 	movl   $0x76726573,0x20(%eax)
 8049a8d:	c7 40 24 65 72 20 61 	movl   $0x61207265,0x24(%eax)
 8049a94:	c7 40 28 64 64 72 65 	movl   $0x65726464,0x28(%eax)
 8049a9b:	66 c7 40 2c 73 73    	movw   $0x7373,0x2c(%eax)
 8049aa1:	c6 40 2e 00          	movb   $0x0,0x2e(%eax)
 8049aa5:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049aa9:	89 04 24             	mov    %eax,(%esp)
 8049aac:	e8 4f ef ff ff       	call   8048a00 <close@plt>
 8049ab1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049ab6:	e9 6c 06 00 00       	jmp    804a127 <submitr+0x7ba>
 8049abb:	8d 9c 24 54 a0 00 00 	lea    0xa054(%esp),%ebx
 8049ac2:	c7 84 24 54 a0 00 00 	movl   $0x0,0xa054(%esp)
 8049ac9:	00 00 00 00 
 8049acd:	c7 84 24 58 a0 00 00 	movl   $0x0,0xa058(%esp)
 8049ad4:	00 00 00 00 
 8049ad8:	c7 84 24 5c a0 00 00 	movl   $0x0,0xa05c(%esp)
 8049adf:	00 00 00 00 
 8049ae3:	c7 84 24 60 a0 00 00 	movl   $0x0,0xa060(%esp)
 8049aea:	00 00 00 00 
 8049aee:	66 c7 84 24 54 a0 00 	movw   $0x2,0xa054(%esp)
 8049af5:	00 02 00 
 8049af8:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 8049aff:	00 
 8049b00:	8b 50 0c             	mov    0xc(%eax),%edx
 8049b03:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049b07:	8b 40 10             	mov    0x10(%eax),%eax
 8049b0a:	8b 00                	mov    (%eax),%eax
 8049b0c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b10:	8d 84 24 58 a0 00 00 	lea    0xa058(%esp),%eax
 8049b17:	89 04 24             	mov    %eax,(%esp)
 8049b1a:	e8 c1 ed ff ff       	call   80488e0 <__memmove_chk@plt>
 8049b1f:	0f b7 84 24 94 a0 00 	movzwl 0xa094(%esp),%eax
 8049b26:	00 
 8049b27:	66 c1 c8 08          	ror    $0x8,%ax
 8049b2b:	66 89 84 24 56 a0 00 	mov    %ax,0xa056(%esp)
 8049b32:	00 
 8049b33:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8049b3a:	00 
 8049b3b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8049b3f:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049b43:	89 04 24             	mov    %eax,(%esp)
 8049b46:	e8 a5 ee ff ff       	call   80489f0 <connect@plt>
 8049b4b:	85 c0                	test   %eax,%eax
 8049b4d:	79 62                	jns    8049bb1 <submitr+0x244>
 8049b4f:	8b 54 24 28          	mov    0x28(%esp),%edx
 8049b53:	c7 02 45 72 72 6f    	movl   $0x6f727245,(%edx)
 8049b59:	c7 42 04 72 3a 20 55 	movl   $0x55203a72,0x4(%edx)
 8049b60:	c7 42 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%edx)
 8049b67:	c7 42 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%edx)
 8049b6e:	c7 42 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%edx)
 8049b75:	c7 42 14 6e 65 63 74 	movl   $0x7463656e,0x14(%edx)
 8049b7c:	c7 42 18 20 74 6f 20 	movl   $0x206f7420,0x18(%edx)
 8049b83:	c7 42 1c 74 68 65 20 	movl   $0x20656874,0x1c(%edx)
 8049b8a:	c7 42 20 73 65 72 76 	movl   $0x76726573,0x20(%edx)
 8049b91:	66 c7 42 24 65 72    	movw   $0x7265,0x24(%edx)
 8049b97:	c6 42 26 00          	movb   $0x0,0x26(%edx)
 8049b9b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049b9f:	89 04 24             	mov    %eax,(%esp)
 8049ba2:	e8 59 ee ff ff       	call   8048a00 <close@plt>
 8049ba7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049bac:	e9 76 05 00 00       	jmp    804a127 <submitr+0x7ba>
 8049bb1:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 8049bb6:	89 ef                	mov    %ebp,%edi
 8049bb8:	b8 00 00 00 00       	mov    $0x0,%eax
 8049bbd:	89 d1                	mov    %edx,%ecx
 8049bbf:	f2 ae                	repnz scas %es:(%edi),%al
 8049bc1:	89 cb                	mov    %ecx,%ebx
 8049bc3:	f7 d3                	not    %ebx
 8049bc5:	8b 7c 24 30          	mov    0x30(%esp),%edi
 8049bc9:	89 d1                	mov    %edx,%ecx
 8049bcb:	f2 ae                	repnz scas %es:(%edi),%al
 8049bcd:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
 8049bd1:	8b 7c 24 34          	mov    0x34(%esp),%edi
 8049bd5:	89 d1                	mov    %edx,%ecx
 8049bd7:	f2 ae                	repnz scas %es:(%edi),%al
 8049bd9:	89 ce                	mov    %ecx,%esi
 8049bdb:	f7 d6                	not    %esi
 8049bdd:	8b 7c 24 38          	mov    0x38(%esp),%edi
 8049be1:	89 d1                	mov    %edx,%ecx
 8049be3:	f2 ae                	repnz scas %es:(%edi),%al
 8049be5:	2b 74 24 3c          	sub    0x3c(%esp),%esi
 8049be9:	29 ce                	sub    %ecx,%esi
 8049beb:	8d 44 5b fd          	lea    -0x3(%ebx,%ebx,2),%eax
 8049bef:	8d 44 06 7b          	lea    0x7b(%esi,%eax,1),%eax
 8049bf3:	3d 00 20 00 00       	cmp    $0x2000,%eax
 8049bf8:	76 7b                	jbe    8049c75 <submitr+0x308>
 8049bfa:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049bfe:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049c04:	c7 40 04 72 3a 20 52 	movl   $0x52203a72,0x4(%eax)
 8049c0b:	c7 40 08 65 73 75 6c 	movl   $0x6c757365,0x8(%eax)
 8049c12:	c7 40 0c 74 20 73 74 	movl   $0x74732074,0xc(%eax)
 8049c19:	c7 40 10 72 69 6e 67 	movl   $0x676e6972,0x10(%eax)
 8049c20:	c7 40 14 20 74 6f 6f 	movl   $0x6f6f7420,0x14(%eax)
 8049c27:	c7 40 18 20 6c 61 72 	movl   $0x72616c20,0x18(%eax)
 8049c2e:	c7 40 1c 67 65 2e 20 	movl   $0x202e6567,0x1c(%eax)
 8049c35:	c7 40 20 49 6e 63 72 	movl   $0x72636e49,0x20(%eax)
 8049c3c:	c7 40 24 65 61 73 65 	movl   $0x65736165,0x24(%eax)
 8049c43:	c7 40 28 20 53 55 42 	movl   $0x42555320,0x28(%eax)
 8049c4a:	c7 40 2c 4d 49 54 52 	movl   $0x5254494d,0x2c(%eax)
 8049c51:	c7 40 30 5f 4d 41 58 	movl   $0x58414d5f,0x30(%eax)
 8049c58:	c7 40 34 42 55 46 00 	movl   $0x465542,0x34(%eax)
 8049c5f:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049c63:	89 04 24             	mov    %eax,(%esp)
 8049c66:	e8 95 ed ff ff       	call   8048a00 <close@plt>
 8049c6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049c70:	e9 b2 04 00 00       	jmp    804a127 <submitr+0x7ba>
 8049c75:	8d 94 24 54 40 00 00 	lea    0x4054(%esp),%edx
 8049c7c:	b9 00 08 00 00       	mov    $0x800,%ecx
 8049c81:	b8 00 00 00 00       	mov    $0x0,%eax
 8049c86:	89 d7                	mov    %edx,%edi
 8049c88:	f3 ab                	rep stos %eax,%es:(%edi)
 8049c8a:	89 ef                	mov    %ebp,%edi
 8049c8c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049c91:	f2 ae                	repnz scas %es:(%edi),%al
 8049c93:	f7 d1                	not    %ecx
 8049c95:	89 ce                	mov    %ecx,%esi
 8049c97:	83 ee 01             	sub    $0x1,%esi
 8049c9a:	0f 84 99 04 00 00    	je     804a139 <submitr+0x7cc>
 8049ca0:	89 d3                	mov    %edx,%ebx
 8049ca2:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
 8049ca6:	3c 2a                	cmp    $0x2a,%al
 8049ca8:	74 24                	je     8049cce <submitr+0x361>
 8049caa:	3c 2d                	cmp    $0x2d,%al
 8049cac:	74 20                	je     8049cce <submitr+0x361>
 8049cae:	3c 2e                	cmp    $0x2e,%al
 8049cb0:	74 1c                	je     8049cce <submitr+0x361>
 8049cb2:	3c 5f                	cmp    $0x5f,%al
 8049cb4:	74 18                	je     8049cce <submitr+0x361>
 8049cb6:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049cb9:	80 fa 09             	cmp    $0x9,%dl
 8049cbc:	76 10                	jbe    8049cce <submitr+0x361>
 8049cbe:	8d 50 bf             	lea    -0x41(%eax),%edx
 8049cc1:	80 fa 19             	cmp    $0x19,%dl
 8049cc4:	76 08                	jbe    8049cce <submitr+0x361>
 8049cc6:	8d 50 9f             	lea    -0x61(%eax),%edx
 8049cc9:	80 fa 19             	cmp    $0x19,%dl
 8049ccc:	77 07                	ja     8049cd5 <submitr+0x368>
 8049cce:	88 03                	mov    %al,(%ebx)
 8049cd0:	83 c3 01             	add    $0x1,%ebx
 8049cd3:	eb 69                	jmp    8049d3e <submitr+0x3d1>
 8049cd5:	3c 20                	cmp    $0x20,%al
 8049cd7:	75 08                	jne    8049ce1 <submitr+0x374>
 8049cd9:	c6 03 2b             	movb   $0x2b,(%ebx)
 8049cdc:	83 c3 01             	add    $0x1,%ebx
 8049cdf:	eb 5d                	jmp    8049d3e <submitr+0x3d1>
 8049ce1:	8d 50 e0             	lea    -0x20(%eax),%edx
 8049ce4:	80 fa 5f             	cmp    $0x5f,%dl
 8049ce7:	76 04                	jbe    8049ced <submitr+0x380>
 8049ce9:	3c 09                	cmp    $0x9,%al
 8049ceb:	75 62                	jne    8049d4f <submitr+0x3e2>
 8049ced:	0f b6 c0             	movzbl %al,%eax
 8049cf0:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049cf4:	c7 44 24 0c 50 b1 04 	movl   $0x804b150,0xc(%esp)
 8049cfb:	08 
 8049cfc:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 8049d03:	00 
 8049d04:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049d0b:	00 
 8049d0c:	8d 94 24 64 a0 00 00 	lea    0xa064(%esp),%edx
 8049d13:	89 14 24             	mov    %edx,(%esp)
 8049d16:	e8 05 ed ff ff       	call   8048a20 <__sprintf_chk@plt>
 8049d1b:	0f b6 84 24 64 a0 00 	movzbl 0xa064(%esp),%eax
 8049d22:	00 
 8049d23:	88 03                	mov    %al,(%ebx)
 8049d25:	0f b6 84 24 65 a0 00 	movzbl 0xa065(%esp),%eax
 8049d2c:	00 
 8049d2d:	88 43 01             	mov    %al,0x1(%ebx)
 8049d30:	0f b6 84 24 66 a0 00 	movzbl 0xa066(%esp),%eax
 8049d37:	00 
 8049d38:	88 43 02             	mov    %al,0x2(%ebx)
 8049d3b:	83 c3 03             	add    $0x3,%ebx
 8049d3e:	83 c5 01             	add    $0x1,%ebp
 8049d41:	83 ee 01             	sub    $0x1,%esi
 8049d44:	0f 85 58 ff ff ff    	jne    8049ca2 <submitr+0x335>
 8049d4a:	e9 ea 03 00 00       	jmp    804a139 <submitr+0x7cc>
 8049d4f:	8b 7c 24 28          	mov    0x28(%esp),%edi
 8049d53:	be 40 b0 04 08       	mov    $0x804b040,%esi
 8049d58:	b8 43 00 00 00       	mov    $0x43,%eax
 8049d5d:	f7 c7 01 00 00 00    	test   $0x1,%edi
 8049d63:	74 1a                	je     8049d7f <submitr+0x412>
 8049d65:	0f b6 05 40 b0 04 08 	movzbl 0x804b040,%eax
 8049d6c:	88 07                	mov    %al,(%edi)
 8049d6e:	8b 7c 24 28          	mov    0x28(%esp),%edi
 8049d72:	83 c7 01             	add    $0x1,%edi
 8049d75:	be 41 b0 04 08       	mov    $0x804b041,%esi
 8049d7a:	b8 42 00 00 00       	mov    $0x42,%eax
 8049d7f:	f7 c7 02 00 00 00    	test   $0x2,%edi
 8049d85:	74 0f                	je     8049d96 <submitr+0x429>
 8049d87:	0f b7 16             	movzwl (%esi),%edx
 8049d8a:	66 89 17             	mov    %dx,(%edi)
 8049d8d:	83 c7 02             	add    $0x2,%edi
 8049d90:	83 c6 02             	add    $0x2,%esi
 8049d93:	83 e8 02             	sub    $0x2,%eax
 8049d96:	89 c1                	mov    %eax,%ecx
 8049d98:	c1 e9 02             	shr    $0x2,%ecx
 8049d9b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049d9d:	ba 00 00 00 00       	mov    $0x0,%edx
 8049da2:	a8 02                	test   $0x2,%al
 8049da4:	74 0b                	je     8049db1 <submitr+0x444>
 8049da6:	0f b7 16             	movzwl (%esi),%edx
 8049da9:	66 89 17             	mov    %dx,(%edi)
 8049dac:	ba 02 00 00 00       	mov    $0x2,%edx
 8049db1:	a8 01                	test   $0x1,%al
 8049db3:	74 07                	je     8049dbc <submitr+0x44f>
 8049db5:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 8049db9:	88 04 17             	mov    %al,(%edi,%edx,1)
 8049dbc:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049dc0:	89 04 24             	mov    %eax,(%esp)
 8049dc3:	e8 38 ec ff ff       	call   8048a00 <close@plt>
 8049dc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049dcd:	e9 55 03 00 00       	jmp    804a127 <submitr+0x7ba>
 8049dd2:	89 fd                	mov    %edi,%ebp
 8049dd4:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
 8049dd8:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049ddc:	89 74 24 04          	mov    %esi,0x4(%esp)
 8049de0:	89 3c 24             	mov    %edi,(%esp)
 8049de3:	e8 48 eb ff ff       	call   8048930 <write@plt>
 8049de8:	85 c0                	test   %eax,%eax
 8049dea:	7f 0f                	jg     8049dfb <submitr+0x48e>
 8049dec:	e8 7f eb ff ff       	call   8048970 <__errno_location@plt>
 8049df1:	83 38 04             	cmpl   $0x4,(%eax)
 8049df4:	75 0f                	jne    8049e05 <submitr+0x498>
 8049df6:	b8 00 00 00 00       	mov    $0x0,%eax
 8049dfb:	01 c6                	add    %eax,%esi
 8049dfd:	29 c3                	sub    %eax,%ebx
 8049dff:	75 d7                	jne    8049dd8 <submitr+0x46b>
 8049e01:	85 ed                	test   %ebp,%ebp
 8049e03:	79 66                	jns    8049e6b <submitr+0x4fe>
 8049e05:	8b 54 24 28          	mov    0x28(%esp),%edx
 8049e09:	c7 02 45 72 72 6f    	movl   $0x6f727245,(%edx)
 8049e0f:	c7 42 04 72 3a 20 43 	movl   $0x43203a72,0x4(%edx)
 8049e16:	c7 42 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%edx)
 8049e1d:	c7 42 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%edx)
 8049e24:	c7 42 10 61 62 6c 65 	movl   $0x656c6261,0x10(%edx)
 8049e2b:	c7 42 14 20 74 6f 20 	movl   $0x206f7420,0x14(%edx)
 8049e32:	c7 42 18 77 72 69 74 	movl   $0x74697277,0x18(%edx)
 8049e39:	c7 42 1c 65 20 74 6f 	movl   $0x6f742065,0x1c(%edx)
 8049e40:	c7 42 20 20 74 68 65 	movl   $0x65687420,0x20(%edx)
 8049e47:	c7 42 24 20 73 65 72 	movl   $0x72657320,0x24(%edx)
 8049e4e:	c7 42 28 76 65 72 00 	movl   $0x726576,0x28(%edx)
 8049e55:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049e59:	89 04 24             	mov    %eax,(%esp)
 8049e5c:	e8 9f eb ff ff       	call   8048a00 <close@plt>
 8049e61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049e66:	e9 bc 02 00 00       	jmp    804a127 <submitr+0x7ba>
 8049e6b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049e6f:	89 44 24 48          	mov    %eax,0x48(%esp)
 8049e73:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
 8049e7a:	00 
 8049e7b:	8d 44 24 54          	lea    0x54(%esp),%eax
 8049e7f:	89 44 24 50          	mov    %eax,0x50(%esp)
 8049e83:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049e88:	8d 94 24 54 20 00 00 	lea    0x2054(%esp),%edx
 8049e8f:	8d 44 24 48          	lea    0x48(%esp),%eax
 8049e93:	e8 88 f9 ff ff       	call   8049820 <rio_readlineb>
 8049e98:	85 c0                	test   %eax,%eax
 8049e9a:	7f 7a                	jg     8049f16 <submitr+0x5a9>
 8049e9c:	8b 54 24 28          	mov    0x28(%esp),%edx
 8049ea0:	c7 02 45 72 72 6f    	movl   $0x6f727245,(%edx)
 8049ea6:	c7 42 04 72 3a 20 43 	movl   $0x43203a72,0x4(%edx)
 8049ead:	c7 42 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%edx)
 8049eb4:	c7 42 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%edx)
 8049ebb:	c7 42 10 61 62 6c 65 	movl   $0x656c6261,0x10(%edx)
 8049ec2:	c7 42 14 20 74 6f 20 	movl   $0x206f7420,0x14(%edx)
 8049ec9:	c7 42 18 72 65 61 64 	movl   $0x64616572,0x18(%edx)
 8049ed0:	c7 42 1c 20 66 69 72 	movl   $0x72696620,0x1c(%edx)
 8049ed7:	c7 42 20 73 74 20 68 	movl   $0x68207473,0x20(%edx)
 8049ede:	c7 42 24 65 61 64 65 	movl   $0x65646165,0x24(%edx)
 8049ee5:	c7 42 28 72 20 66 72 	movl   $0x72662072,0x28(%edx)
 8049eec:	c7 42 2c 6f 6d 20 73 	movl   $0x73206d6f,0x2c(%edx)
 8049ef3:	c7 42 30 65 72 76 65 	movl   $0x65767265,0x30(%edx)
 8049efa:	66 c7 42 34 72 00    	movw   $0x72,0x34(%edx)
 8049f00:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049f04:	89 04 24             	mov    %eax,(%esp)
 8049f07:	e8 f4 ea ff ff       	call   8048a00 <close@plt>
 8049f0c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049f11:	e9 11 02 00 00       	jmp    804a127 <submitr+0x7ba>
 8049f16:	8d 84 24 54 80 00 00 	lea    0x8054(%esp),%eax
 8049f1d:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049f21:	8d 44 24 44          	lea    0x44(%esp),%eax
 8049f25:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049f29:	8d 84 24 54 60 00 00 	lea    0x6054(%esp),%eax
 8049f30:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049f34:	c7 44 24 04 57 b1 04 	movl   $0x804b157,0x4(%esp)
 8049f3b:	08 
 8049f3c:	8d 84 24 54 20 00 00 	lea    0x2054(%esp),%eax
 8049f43:	89 04 24             	mov    %eax,(%esp)
 8049f46:	e8 05 ea ff ff       	call   8048950 <__isoc99_sscanf@plt>
 8049f4b:	8b 44 24 44          	mov    0x44(%esp),%eax
 8049f4f:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8049f54:	0f 84 d3 00 00 00    	je     804a02d <submitr+0x6c0>
 8049f5a:	8d 94 24 54 80 00 00 	lea    0x8054(%esp),%edx
 8049f61:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049f65:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049f69:	c7 44 24 0c 84 b0 04 	movl   $0x804b084,0xc(%esp)
 8049f70:	08 
 8049f71:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 8049f78:	ff 
 8049f79:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049f80:	00 
 8049f81:	8b 54 24 28          	mov    0x28(%esp),%edx
 8049f85:	89 14 24             	mov    %edx,(%esp)
 8049f88:	e8 93 ea ff ff       	call   8048a20 <__sprintf_chk@plt>
 8049f8d:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049f91:	89 04 24             	mov    %eax,(%esp)
 8049f94:	e8 67 ea ff ff       	call   8048a00 <close@plt>
 8049f99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049f9e:	e9 84 01 00 00       	jmp    804a127 <submitr+0x7ba>
 8049fa3:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049fa8:	8d 94 24 54 20 00 00 	lea    0x2054(%esp),%edx
 8049faf:	8d 44 24 48          	lea    0x48(%esp),%eax
 8049fb3:	e8 68 f8 ff ff       	call   8049820 <rio_readlineb>
 8049fb8:	85 c0                	test   %eax,%eax
 8049fba:	7f 71                	jg     804a02d <submitr+0x6c0>
 8049fbc:	8b 54 24 28          	mov    0x28(%esp),%edx
 8049fc0:	c7 02 45 72 72 6f    	movl   $0x6f727245,(%edx)
 8049fc6:	c7 42 04 72 3a 20 43 	movl   $0x43203a72,0x4(%edx)
 8049fcd:	c7 42 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%edx)
 8049fd4:	c7 42 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%edx)
 8049fdb:	c7 42 10 61 62 6c 65 	movl   $0x656c6261,0x10(%edx)
 8049fe2:	c7 42 14 20 74 6f 20 	movl   $0x206f7420,0x14(%edx)
 8049fe9:	c7 42 18 72 65 61 64 	movl   $0x64616572,0x18(%edx)
 8049ff0:	c7 42 1c 20 68 65 61 	movl   $0x61656820,0x1c(%edx)
 8049ff7:	c7 42 20 64 65 72 73 	movl   $0x73726564,0x20(%edx)
 8049ffe:	c7 42 24 20 66 72 6f 	movl   $0x6f726620,0x24(%edx)
 804a005:	c7 42 28 6d 20 73 65 	movl   $0x6573206d,0x28(%edx)
 804a00c:	c7 42 2c 72 76 65 72 	movl   $0x72657672,0x2c(%edx)
 804a013:	c6 42 30 00          	movb   $0x0,0x30(%edx)
 804a017:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 804a01b:	89 04 24             	mov    %eax,(%esp)
 804a01e:	e8 dd e9 ff ff       	call   8048a00 <close@plt>
 804a023:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a028:	e9 fa 00 00 00       	jmp    804a127 <submitr+0x7ba>
 804a02d:	80 bc 24 54 20 00 00 	cmpb   $0xd,0x2054(%esp)
 804a034:	0d 
 804a035:	0f 85 68 ff ff ff    	jne    8049fa3 <submitr+0x636>
 804a03b:	80 bc 24 55 20 00 00 	cmpb   $0xa,0x2055(%esp)
 804a042:	0a 
 804a043:	0f 85 5a ff ff ff    	jne    8049fa3 <submitr+0x636>
 804a049:	80 bc 24 56 20 00 00 	cmpb   $0x0,0x2056(%esp)
 804a050:	00 
 804a051:	0f 85 4c ff ff ff    	jne    8049fa3 <submitr+0x636>
 804a057:	b9 00 20 00 00       	mov    $0x2000,%ecx
 804a05c:	8d 94 24 54 20 00 00 	lea    0x2054(%esp),%edx
 804a063:	8d 44 24 48          	lea    0x48(%esp),%eax
 804a067:	e8 b4 f7 ff ff       	call   8049820 <rio_readlineb>
 804a06c:	85 c0                	test   %eax,%eax
 804a06e:	7f 78                	jg     804a0e8 <submitr+0x77b>
 804a070:	8b 54 24 28          	mov    0x28(%esp),%edx
 804a074:	c7 02 45 72 72 6f    	movl   $0x6f727245,(%edx)
 804a07a:	c7 42 04 72 3a 20 43 	movl   $0x43203a72,0x4(%edx)
 804a081:	c7 42 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%edx)
 804a088:	c7 42 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%edx)
 804a08f:	c7 42 10 61 62 6c 65 	movl   $0x656c6261,0x10(%edx)
 804a096:	c7 42 14 20 74 6f 20 	movl   $0x206f7420,0x14(%edx)
 804a09d:	c7 42 18 72 65 61 64 	movl   $0x64616572,0x18(%edx)
 804a0a4:	c7 42 1c 20 73 74 61 	movl   $0x61747320,0x1c(%edx)
 804a0ab:	c7 42 20 74 75 73 20 	movl   $0x20737574,0x20(%edx)
 804a0b2:	c7 42 24 6d 65 73 73 	movl   $0x7373656d,0x24(%edx)
 804a0b9:	c7 42 28 61 67 65 20 	movl   $0x20656761,0x28(%edx)
 804a0c0:	c7 42 2c 66 72 6f 6d 	movl   $0x6d6f7266,0x2c(%edx)
 804a0c7:	c7 42 30 20 73 65 72 	movl   $0x72657320,0x30(%edx)
 804a0ce:	c7 42 34 76 65 72 00 	movl   $0x726576,0x34(%edx)
 804a0d5:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 804a0d9:	89 04 24             	mov    %eax,(%esp)
 804a0dc:	e8 1f e9 ff ff       	call   8048a00 <close@plt>
 804a0e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a0e6:	eb 3f                	jmp    804a127 <submitr+0x7ba>
 804a0e8:	8d 84 24 54 20 00 00 	lea    0x2054(%esp),%eax
 804a0ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a0f3:	8b 54 24 28          	mov    0x28(%esp),%edx
 804a0f7:	89 14 24             	mov    %edx,(%esp)
 804a0fa:	e8 a1 e7 ff ff       	call   80488a0 <strcpy@plt>
 804a0ff:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 804a103:	89 04 24             	mov    %eax,(%esp)
 804a106:	e8 f5 e8 ff ff       	call   8048a00 <close@plt>
 804a10b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a110:	8b 54 24 28          	mov    0x28(%esp),%edx
 804a114:	80 3a 4f             	cmpb   $0x4f,(%edx)
 804a117:	75 0e                	jne    804a127 <submitr+0x7ba>
 804a119:	80 7a 01 4b          	cmpb   $0x4b,0x1(%edx)
 804a11d:	75 08                	jne    804a127 <submitr+0x7ba>
 804a11f:	80 7a 02 01          	cmpb   $0x1,0x2(%edx)
 804a123:	19 c0                	sbb    %eax,%eax
 804a125:	f7 d0                	not    %eax
 804a127:	8b 8c 24 6c a0 00 00 	mov    0xa06c(%esp),%ecx
 804a12e:	65 33 0d 14 00 00 00 	xor    %gs:0x14,%ecx
 804a135:	74 78                	je     804a1af <submitr+0x842>
 804a137:	eb 71                	jmp    804a1aa <submitr+0x83d>
 804a139:	8d 84 24 54 40 00 00 	lea    0x4054(%esp),%eax
 804a140:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804a144:	8b 44 24 38          	mov    0x38(%esp),%eax
 804a148:	89 44 24 18          	mov    %eax,0x18(%esp)
 804a14c:	8b 54 24 34          	mov    0x34(%esp),%edx
 804a150:	89 54 24 14          	mov    %edx,0x14(%esp)
 804a154:	8b 4c 24 30          	mov    0x30(%esp),%ecx
 804a158:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 804a15c:	c7 44 24 0c b4 b0 04 	movl   $0x804b0b4,0xc(%esp)
 804a163:	08 
 804a164:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 804a16b:	00 
 804a16c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a173:	00 
 804a174:	8d bc 24 54 20 00 00 	lea    0x2054(%esp),%edi
 804a17b:	89 3c 24             	mov    %edi,(%esp)
 804a17e:	e8 9d e8 ff ff       	call   8048a20 <__sprintf_chk@plt>
 804a183:	b8 00 00 00 00       	mov    $0x0,%eax
 804a188:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804a18d:	f2 ae                	repnz scas %es:(%edi),%al
 804a18f:	f7 d1                	not    %ecx
 804a191:	8d 79 ff             	lea    -0x1(%ecx),%edi
 804a194:	89 fb                	mov    %edi,%ebx
 804a196:	8d b4 24 54 20 00 00 	lea    0x2054(%esp),%esi
 804a19d:	85 ff                	test   %edi,%edi
 804a19f:	0f 85 2d fc ff ff    	jne    8049dd2 <submitr+0x465>
 804a1a5:	e9 c1 fc ff ff       	jmp    8049e6b <submitr+0x4fe>
 804a1aa:	e8 d1 e6 ff ff       	call   8048880 <__stack_chk_fail@plt>
 804a1af:	81 c4 7c a0 00 00    	add    $0xa07c,%esp
 804a1b5:	5b                   	pop    %ebx
 804a1b6:	5e                   	pop    %esi
 804a1b7:	5f                   	pop    %edi
 804a1b8:	5d                   	pop    %ebp
 804a1b9:	c3                   	ret    

0804a1ba <init_timeout>:
 804a1ba:	53                   	push   %ebx
 804a1bb:	83 ec 18             	sub    $0x18,%esp
 804a1be:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 804a1c2:	85 db                	test   %ebx,%ebx
 804a1c4:	74 26                	je     804a1ec <init_timeout+0x32>
 804a1c6:	c7 44 24 04 39 99 04 	movl   $0x8049939,0x4(%esp)
 804a1cd:	08 
 804a1ce:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 804a1d5:	e8 76 e6 ff ff       	call   8048850 <signal@plt>
 804a1da:	85 db                	test   %ebx,%ebx
 804a1dc:	b8 00 00 00 00       	mov    $0x0,%eax
 804a1e1:	0f 48 d8             	cmovs  %eax,%ebx
 804a1e4:	89 1c 24             	mov    %ebx,(%esp)
 804a1e7:	e8 84 e6 ff ff       	call   8048870 <alarm@plt>
 804a1ec:	83 c4 18             	add    $0x18,%esp
 804a1ef:	5b                   	pop    %ebx
 804a1f0:	c3                   	ret    

0804a1f1 <init_driver>:
 804a1f1:	57                   	push   %edi
 804a1f2:	56                   	push   %esi
 804a1f3:	53                   	push   %ebx
 804a1f4:	83 ec 40             	sub    $0x40,%esp
 804a1f7:	8b 74 24 50          	mov    0x50(%esp),%esi
 804a1fb:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 804a201:	89 44 24 3c          	mov    %eax,0x3c(%esp)
 804a205:	31 c0                	xor    %eax,%eax
 804a207:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a20e:	00 
 804a20f:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 804a216:	e8 35 e6 ff ff       	call   8048850 <signal@plt>
 804a21b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a222:	00 
 804a223:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 804a22a:	e8 21 e6 ff ff       	call   8048850 <signal@plt>
 804a22f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a236:	00 
 804a237:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 804a23e:	e8 0d e6 ff ff       	call   8048850 <signal@plt>
 804a243:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804a24a:	00 
 804a24b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a252:	00 
 804a253:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 804a25a:	e8 41 e7 ff ff       	call   80489a0 <socket@plt>
 804a25f:	89 c3                	mov    %eax,%ebx
 804a261:	85 c0                	test   %eax,%eax
 804a263:	79 4e                	jns    804a2b3 <init_driver+0xc2>
 804a265:	c7 06 45 72 72 6f    	movl   $0x6f727245,(%esi)
 804a26b:	c7 46 04 72 3a 20 43 	movl   $0x43203a72,0x4(%esi)
 804a272:	c7 46 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%esi)
 804a279:	c7 46 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%esi)
 804a280:	c7 46 10 61 62 6c 65 	movl   $0x656c6261,0x10(%esi)
 804a287:	c7 46 14 20 74 6f 20 	movl   $0x206f7420,0x14(%esi)
 804a28e:	c7 46 18 63 72 65 61 	movl   $0x61657263,0x18(%esi)
 804a295:	c7 46 1c 74 65 20 73 	movl   $0x73206574,0x1c(%esi)
 804a29c:	c7 46 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%esi)
 804a2a3:	66 c7 46 24 74 00    	movw   $0x74,0x24(%esi)
 804a2a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a2ae:	e9 0d 01 00 00       	jmp    804a3c0 <init_driver+0x1cf>
 804a2b3:	c7 04 24 68 b1 04 08 	movl   $0x804b168,(%esp)
 804a2ba:	e8 11 e7 ff ff       	call   80489d0 <gethostbyname@plt>
 804a2bf:	85 c0                	test   %eax,%eax
 804a2c1:	75 3a                	jne    804a2fd <init_driver+0x10c>
 804a2c3:	c7 44 24 10 68 b1 04 	movl   $0x804b168,0x10(%esp)
 804a2ca:	08 
 804a2cb:	c7 44 24 0c 00 b1 04 	movl   $0x804b100,0xc(%esp)
 804a2d2:	08 
 804a2d3:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 804a2da:	ff 
 804a2db:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a2e2:	00 
 804a2e3:	89 34 24             	mov    %esi,(%esp)
 804a2e6:	e8 35 e7 ff ff       	call   8048a20 <__sprintf_chk@plt>
 804a2eb:	89 1c 24             	mov    %ebx,(%esp)
 804a2ee:	e8 0d e7 ff ff       	call   8048a00 <close@plt>
 804a2f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a2f8:	e9 c3 00 00 00       	jmp    804a3c0 <init_driver+0x1cf>
 804a2fd:	8d 7c 24 2c          	lea    0x2c(%esp),%edi
 804a301:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 804a308:	00 
 804a309:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
 804a310:	00 
 804a311:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
 804a318:	00 
 804a319:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
 804a320:	00 
 804a321:	66 c7 44 24 2c 02 00 	movw   $0x2,0x2c(%esp)
 804a328:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 804a32f:	00 
 804a330:	8b 50 0c             	mov    0xc(%eax),%edx
 804a333:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a337:	8b 40 10             	mov    0x10(%eax),%eax
 804a33a:	8b 00                	mov    (%eax),%eax
 804a33c:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a340:	8d 44 24 30          	lea    0x30(%esp),%eax
 804a344:	89 04 24             	mov    %eax,(%esp)
 804a347:	e8 94 e5 ff ff       	call   80488e0 <__memmove_chk@plt>
 804a34c:	66 c7 44 24 2e 3b 6e 	movw   $0x6e3b,0x2e(%esp)
 804a353:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 804a35a:	00 
 804a35b:	89 7c 24 04          	mov    %edi,0x4(%esp)
 804a35f:	89 1c 24             	mov    %ebx,(%esp)
 804a362:	e8 89 e6 ff ff       	call   80489f0 <connect@plt>
 804a367:	85 c0                	test   %eax,%eax
 804a369:	79 3f                	jns    804a3aa <init_driver+0x1b9>
 804a36b:	c7 44 24 14 6e 3b 00 	movl   $0x3b6e,0x14(%esp)
 804a372:	00 
 804a373:	c7 44 24 10 68 b1 04 	movl   $0x804b168,0x10(%esp)
 804a37a:	08 
 804a37b:	c7 44 24 0c 24 b1 04 	movl   $0x804b124,0xc(%esp)
 804a382:	08 
 804a383:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 804a38a:	ff 
 804a38b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a392:	00 
 804a393:	89 34 24             	mov    %esi,(%esp)
 804a396:	e8 85 e6 ff ff       	call   8048a20 <__sprintf_chk@plt>
 804a39b:	89 1c 24             	mov    %ebx,(%esp)
 804a39e:	e8 5d e6 ff ff       	call   8048a00 <close@plt>
 804a3a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a3a8:	eb 16                	jmp    804a3c0 <init_driver+0x1cf>
 804a3aa:	89 1c 24             	mov    %ebx,(%esp)
 804a3ad:	e8 4e e6 ff ff       	call   8048a00 <close@plt>
 804a3b2:	66 c7 06 4f 4b       	movw   $0x4b4f,(%esi)
 804a3b7:	c6 46 02 00          	movb   $0x0,0x2(%esi)
 804a3bb:	b8 00 00 00 00       	mov    $0x0,%eax
 804a3c0:	8b 54 24 3c          	mov    0x3c(%esp),%edx
 804a3c4:	65 33 15 14 00 00 00 	xor    %gs:0x14,%edx
 804a3cb:	74 05                	je     804a3d2 <init_driver+0x1e1>
 804a3cd:	e8 ae e4 ff ff       	call   8048880 <__stack_chk_fail@plt>
 804a3d2:	83 c4 40             	add    $0x40,%esp
 804a3d5:	5b                   	pop    %ebx
 804a3d6:	5e                   	pop    %esi
 804a3d7:	5f                   	pop    %edi
 804a3d8:	c3                   	ret    

0804a3d9 <driver_post>:
 804a3d9:	53                   	push   %ebx
 804a3da:	83 ec 28             	sub    $0x28,%esp
 804a3dd:	8b 44 24 30          	mov    0x30(%esp),%eax
 804a3e1:	8b 54 24 34          	mov    0x34(%esp),%edx
 804a3e5:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
 804a3e9:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
 804a3ee:	74 28                	je     804a418 <driver_post+0x3f>
 804a3f0:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a3f4:	c7 44 24 04 7d b1 04 	movl   $0x804b17d,0x4(%esp)
 804a3fb:	08 
 804a3fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804a403:	e8 88 e5 ff ff       	call   8048990 <__printf_chk@plt>
 804a408:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 804a40d:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 804a411:	b8 00 00 00 00       	mov    $0x0,%eax
 804a416:	eb 49                	jmp    804a461 <driver_post+0x88>
 804a418:	85 c0                	test   %eax,%eax
 804a41a:	74 37                	je     804a453 <driver_post+0x7a>
 804a41c:	80 38 00             	cmpb   $0x0,(%eax)
 804a41f:	74 32                	je     804a453 <driver_post+0x7a>
 804a421:	89 5c 24 18          	mov    %ebx,0x18(%esp)
 804a425:	89 54 24 14          	mov    %edx,0x14(%esp)
 804a429:	c7 44 24 10 94 b1 04 	movl   $0x804b194,0x10(%esp)
 804a430:	08 
 804a431:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804a435:	c7 44 24 08 9f b1 04 	movl   $0x804b19f,0x8(%esp)
 804a43c:	08 
 804a43d:	c7 44 24 04 6e 3b 00 	movl   $0x3b6e,0x4(%esp)
 804a444:	00 
 804a445:	c7 04 24 68 b1 04 08 	movl   $0x804b168,(%esp)
 804a44c:	e8 1c f5 ff ff       	call   804996d <submitr>
 804a451:	eb 0e                	jmp    804a461 <driver_post+0x88>
 804a453:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 804a458:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 804a45c:	b8 00 00 00 00       	mov    $0x0,%eax
 804a461:	83 c4 28             	add    $0x28,%esp
 804a464:	5b                   	pop    %ebx
 804a465:	c3                   	ret    
 804a466:	90                   	nop
 804a467:	90                   	nop
 804a468:	90                   	nop
 804a469:	90                   	nop
 804a46a:	90                   	nop
 804a46b:	90                   	nop
 804a46c:	90                   	nop
 804a46d:	90                   	nop
 804a46e:	90                   	nop
 804a46f:	90                   	nop

0804a470 <__libc_csu_init>:
 804a470:	55                   	push   %ebp
 804a471:	57                   	push   %edi
 804a472:	56                   	push   %esi
 804a473:	53                   	push   %ebx
 804a474:	e8 69 00 00 00       	call   804a4e2 <__i686.get_pc_thunk.bx>
 804a479:	81 c3 7b 2b 00 00    	add    $0x2b7b,%ebx
 804a47f:	83 ec 1c             	sub    $0x1c,%esp
 804a482:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 804a486:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804a48c:	e8 47 e3 ff ff       	call   80487d8 <_init>
 804a491:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 804a497:	29 c7                	sub    %eax,%edi
 804a499:	c1 ff 02             	sar    $0x2,%edi
 804a49c:	85 ff                	test   %edi,%edi
 804a49e:	74 29                	je     804a4c9 <__libc_csu_init+0x59>
 804a4a0:	31 f6                	xor    %esi,%esi
 804a4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a4a8:	8b 44 24 38          	mov    0x38(%esp),%eax
 804a4ac:	89 2c 24             	mov    %ebp,(%esp)
 804a4af:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a4b3:	8b 44 24 34          	mov    0x34(%esp),%eax
 804a4b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a4bb:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804a4c2:	83 c6 01             	add    $0x1,%esi
 804a4c5:	39 fe                	cmp    %edi,%esi
 804a4c7:	75 df                	jne    804a4a8 <__libc_csu_init+0x38>
 804a4c9:	83 c4 1c             	add    $0x1c,%esp
 804a4cc:	5b                   	pop    %ebx
 804a4cd:	5e                   	pop    %esi
 804a4ce:	5f                   	pop    %edi
 804a4cf:	5d                   	pop    %ebp
 804a4d0:	c3                   	ret    
 804a4d1:	eb 0d                	jmp    804a4e0 <__libc_csu_fini>
 804a4d3:	90                   	nop
 804a4d4:	90                   	nop
 804a4d5:	90                   	nop
 804a4d6:	90                   	nop
 804a4d7:	90                   	nop
 804a4d8:	90                   	nop
 804a4d9:	90                   	nop
 804a4da:	90                   	nop
 804a4db:	90                   	nop
 804a4dc:	90                   	nop
 804a4dd:	90                   	nop
 804a4de:	90                   	nop
 804a4df:	90                   	nop

0804a4e0 <__libc_csu_fini>:
 804a4e0:	f3 c3                	repz ret 

0804a4e2 <__i686.get_pc_thunk.bx>:
 804a4e2:	8b 1c 24             	mov    (%esp),%ebx
 804a4e5:	c3                   	ret    
 804a4e6:	90                   	nop
 804a4e7:	90                   	nop
 804a4e8:	90                   	nop
 804a4e9:	90                   	nop
 804a4ea:	90                   	nop
 804a4eb:	90                   	nop
 804a4ec:	90                   	nop
 804a4ed:	90                   	nop
 804a4ee:	90                   	nop
 804a4ef:	90                   	nop

0804a4f0 <__do_global_ctors_aux>:
 804a4f0:	55                   	push   %ebp
 804a4f1:	89 e5                	mov    %esp,%ebp
 804a4f3:	53                   	push   %ebx
 804a4f4:	83 ec 04             	sub    $0x4,%esp
 804a4f7:	a1 14 cf 04 08       	mov    0x804cf14,%eax
 804a4fc:	83 f8 ff             	cmp    $0xffffffff,%eax
 804a4ff:	74 13                	je     804a514 <__do_global_ctors_aux+0x24>
 804a501:	bb 14 cf 04 08       	mov    $0x804cf14,%ebx
 804a506:	66 90                	xchg   %ax,%ax
 804a508:	83 eb 04             	sub    $0x4,%ebx
 804a50b:	ff d0                	call   *%eax
 804a50d:	8b 03                	mov    (%ebx),%eax
 804a50f:	83 f8 ff             	cmp    $0xffffffff,%eax
 804a512:	75 f4                	jne    804a508 <__do_global_ctors_aux+0x18>
 804a514:	83 c4 04             	add    $0x4,%esp
 804a517:	5b                   	pop    %ebx
 804a518:	5d                   	pop    %ebp
 804a519:	c3                   	ret    
 804a51a:	90                   	nop
 804a51b:	90                   	nop

Disassembly of section .fini:

0804a51c <_fini>:
 804a51c:	53                   	push   %ebx
 804a51d:	83 ec 08             	sub    $0x8,%esp
 804a520:	e8 00 00 00 00       	call   804a525 <_fini+0x9>
 804a525:	5b                   	pop    %ebx
 804a526:	81 c3 cf 2a 00 00    	add    $0x2acf,%ebx
 804a52c:	e8 2f e5 ff ff       	call   8048a60 <__do_global_dtors_aux>
 804a531:	83 c4 08             	add    $0x8,%esp
 804a534:	5b                   	pop    %ebx
 804a535:	c3                   	ret    
