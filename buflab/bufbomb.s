
bufbomb:     file format elf32-i386


Disassembly of section .init:

080487b8 <_init>:
 80487b8:	53                   	push   %ebx
 80487b9:	83 ec 08             	sub    $0x8,%esp
 80487bc:	e8 af 02 00 00       	call   8048a70 <__x86.get_pc_thunk.bx>
 80487c1:	81 c3 3f 38 00 00    	add    $0x383f,%ebx
 80487c7:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80487cd:	85 c0                	test   %eax,%eax
 80487cf:	74 05                	je     80487d6 <_init+0x1e>
 80487d1:	e8 3a 02 00 00       	call   8048a10 <__sprintf_chk@plt+0x10>
 80487d6:	83 c4 08             	add    $0x8,%esp
 80487d9:	5b                   	pop    %ebx
 80487da:	c3                   	ret    

Disassembly of section .plt:

080487e0 <read@plt-0x10>:
 80487e0:	ff 35 04 c0 04 08    	pushl  0x804c004
 80487e6:	ff 25 08 c0 04 08    	jmp    *0x804c008
 80487ec:	00 00                	add    %al,(%eax)
	...

080487f0 <read@plt>:
 80487f0:	ff 25 0c c0 04 08    	jmp    *0x804c00c
 80487f6:	68 00 00 00 00       	push   $0x0
 80487fb:	e9 e0 ff ff ff       	jmp    80487e0 <_init+0x28>

08048800 <srandom@plt>:
 8048800:	ff 25 10 c0 04 08    	jmp    *0x804c010
 8048806:	68 08 00 00 00       	push   $0x8
 804880b:	e9 d0 ff ff ff       	jmp    80487e0 <_init+0x28>

08048810 <strdup@plt>:
 8048810:	ff 25 14 c0 04 08    	jmp    *0x804c014
 8048816:	68 10 00 00 00       	push   $0x10
 804881b:	e9 c0 ff ff ff       	jmp    80487e0 <_init+0x28>

08048820 <signal@plt>:
 8048820:	ff 25 18 c0 04 08    	jmp    *0x804c018
 8048826:	68 18 00 00 00       	push   $0x18
 804882b:	e9 b0 ff ff ff       	jmp    80487e0 <_init+0x28>

08048830 <alarm@plt>:
 8048830:	ff 25 1c c0 04 08    	jmp    *0x804c01c
 8048836:	68 20 00 00 00       	push   $0x20
 804883b:	e9 a0 ff ff ff       	jmp    80487e0 <_init+0x28>

08048840 <_IO_getc@plt>:
 8048840:	ff 25 20 c0 04 08    	jmp    *0x804c020
 8048846:	68 28 00 00 00       	push   $0x28
 804884b:	e9 90 ff ff ff       	jmp    80487e0 <_init+0x28>

08048850 <fwrite@plt>:
 8048850:	ff 25 24 c0 04 08    	jmp    *0x804c024
 8048856:	68 30 00 00 00       	push   $0x30
 804885b:	e9 80 ff ff ff       	jmp    80487e0 <_init+0x28>

08048860 <strcpy@plt>:
 8048860:	ff 25 28 c0 04 08    	jmp    *0x804c028
 8048866:	68 38 00 00 00       	push   $0x38
 804886b:	e9 70 ff ff ff       	jmp    80487e0 <_init+0x28>

08048870 <getpid@plt>:
 8048870:	ff 25 2c c0 04 08    	jmp    *0x804c02c
 8048876:	68 40 00 00 00       	push   $0x40
 804887b:	e9 60 ff ff ff       	jmp    80487e0 <_init+0x28>

08048880 <gethostname@plt>:
 8048880:	ff 25 30 c0 04 08    	jmp    *0x804c030
 8048886:	68 48 00 00 00       	push   $0x48
 804888b:	e9 50 ff ff ff       	jmp    80487e0 <_init+0x28>

08048890 <puts@plt>:
 8048890:	ff 25 34 c0 04 08    	jmp    *0x804c034
 8048896:	68 50 00 00 00       	push   $0x50
 804889b:	e9 40 ff ff ff       	jmp    80487e0 <_init+0x28>

080488a0 <__memmove_chk@plt>:
 80488a0:	ff 25 38 c0 04 08    	jmp    *0x804c038
 80488a6:	68 58 00 00 00       	push   $0x58
 80488ab:	e9 30 ff ff ff       	jmp    80487e0 <_init+0x28>

080488b0 <__memcpy_chk@plt>:
 80488b0:	ff 25 3c c0 04 08    	jmp    *0x804c03c
 80488b6:	68 60 00 00 00       	push   $0x60
 80488bb:	e9 20 ff ff ff       	jmp    80487e0 <_init+0x28>

080488c0 <exit@plt>:
 80488c0:	ff 25 40 c0 04 08    	jmp    *0x804c040
 80488c6:	68 68 00 00 00       	push   $0x68
 80488cb:	e9 10 ff ff ff       	jmp    80487e0 <_init+0x28>

080488d0 <srand@plt>:
 80488d0:	ff 25 44 c0 04 08    	jmp    *0x804c044
 80488d6:	68 70 00 00 00       	push   $0x70
 80488db:	e9 00 ff ff ff       	jmp    80487e0 <_init+0x28>

080488e0 <mmap@plt>:
 80488e0:	ff 25 48 c0 04 08    	jmp    *0x804c048
 80488e6:	68 78 00 00 00       	push   $0x78
 80488eb:	e9 f0 fe ff ff       	jmp    80487e0 <_init+0x28>

080488f0 <__libc_start_main@plt>:
 80488f0:	ff 25 4c c0 04 08    	jmp    *0x804c04c
 80488f6:	68 80 00 00 00       	push   $0x80
 80488fb:	e9 e0 fe ff ff       	jmp    80487e0 <_init+0x28>

08048900 <write@plt>:
 8048900:	ff 25 50 c0 04 08    	jmp    *0x804c050
 8048906:	68 88 00 00 00       	push   $0x88
 804890b:	e9 d0 fe ff ff       	jmp    80487e0 <_init+0x28>

08048910 <getopt@plt>:
 8048910:	ff 25 54 c0 04 08    	jmp    *0x804c054
 8048916:	68 90 00 00 00       	push   $0x90
 804891b:	e9 c0 fe ff ff       	jmp    80487e0 <_init+0x28>

08048920 <__isoc99_sscanf@plt>:
 8048920:	ff 25 58 c0 04 08    	jmp    *0x804c058
 8048926:	68 98 00 00 00       	push   $0x98
 804892b:	e9 b0 fe ff ff       	jmp    80487e0 <_init+0x28>

08048930 <memset@plt>:
 8048930:	ff 25 5c c0 04 08    	jmp    *0x804c05c
 8048936:	68 a0 00 00 00       	push   $0xa0
 804893b:	e9 a0 fe ff ff       	jmp    80487e0 <_init+0x28>

08048940 <__errno_location@plt>:
 8048940:	ff 25 60 c0 04 08    	jmp    *0x804c060
 8048946:	68 a8 00 00 00       	push   $0xa8
 804894b:	e9 90 fe ff ff       	jmp    80487e0 <_init+0x28>

08048950 <rand@plt>:
 8048950:	ff 25 64 c0 04 08    	jmp    *0x804c064
 8048956:	68 b0 00 00 00       	push   $0xb0
 804895b:	e9 80 fe ff ff       	jmp    80487e0 <_init+0x28>

08048960 <__printf_chk@plt>:
 8048960:	ff 25 68 c0 04 08    	jmp    *0x804c068
 8048966:	68 b8 00 00 00       	push   $0xb8
 804896b:	e9 70 fe ff ff       	jmp    80487e0 <_init+0x28>

08048970 <munmap@plt>:
 8048970:	ff 25 6c c0 04 08    	jmp    *0x804c06c
 8048976:	68 c0 00 00 00       	push   $0xc0
 804897b:	e9 60 fe ff ff       	jmp    80487e0 <_init+0x28>

08048980 <socket@plt>:
 8048980:	ff 25 70 c0 04 08    	jmp    *0x804c070
 8048986:	68 c8 00 00 00       	push   $0xc8
 804898b:	e9 50 fe ff ff       	jmp    80487e0 <_init+0x28>

08048990 <__fprintf_chk@plt>:
 8048990:	ff 25 74 c0 04 08    	jmp    *0x804c074
 8048996:	68 d0 00 00 00       	push   $0xd0
 804899b:	e9 40 fe ff ff       	jmp    80487e0 <_init+0x28>

080489a0 <random@plt>:
 80489a0:	ff 25 78 c0 04 08    	jmp    *0x804c078
 80489a6:	68 d8 00 00 00       	push   $0xd8
 80489ab:	e9 30 fe ff ff       	jmp    80487e0 <_init+0x28>

080489b0 <gethostbyname@plt>:
 80489b0:	ff 25 7c c0 04 08    	jmp    *0x804c07c
 80489b6:	68 e0 00 00 00       	push   $0xe0
 80489bb:	e9 20 fe ff ff       	jmp    80487e0 <_init+0x28>

080489c0 <strtol@plt>:
 80489c0:	ff 25 80 c0 04 08    	jmp    *0x804c080
 80489c6:	68 e8 00 00 00       	push   $0xe8
 80489cb:	e9 10 fe ff ff       	jmp    80487e0 <_init+0x28>

080489d0 <connect@plt>:
 80489d0:	ff 25 84 c0 04 08    	jmp    *0x804c084
 80489d6:	68 f0 00 00 00       	push   $0xf0
 80489db:	e9 00 fe ff ff       	jmp    80487e0 <_init+0x28>

080489e0 <close@plt>:
 80489e0:	ff 25 88 c0 04 08    	jmp    *0x804c088
 80489e6:	68 f8 00 00 00       	push   $0xf8
 80489eb:	e9 f0 fd ff ff       	jmp    80487e0 <_init+0x28>

080489f0 <calloc@plt>:
 80489f0:	ff 25 8c c0 04 08    	jmp    *0x804c08c
 80489f6:	68 00 01 00 00       	push   $0x100
 80489fb:	e9 e0 fd ff ff       	jmp    80487e0 <_init+0x28>

08048a00 <__sprintf_chk@plt>:
 8048a00:	ff 25 90 c0 04 08    	jmp    *0x804c090
 8048a06:	68 08 01 00 00       	push   $0x108
 8048a0b:	e9 d0 fd ff ff       	jmp    80487e0 <_init+0x28>

Disassembly of section .plt.got:

08048a10 <.plt.got>:
 8048a10:	ff 25 fc bf 04 08    	jmp    *0x804bffc
 8048a16:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

08048a20 <_start>:
 8048a20:	31 ed                	xor    %ebp,%ebp
 8048a22:	5e                   	pop    %esi
 8048a23:	89 e1                	mov    %esp,%ecx
 8048a25:	83 e4 f0             	and    $0xfffffff0,%esp
 8048a28:	50                   	push   %eax
 8048a29:	54                   	push   %esp
 8048a2a:	52                   	push   %edx
 8048a2b:	e8 23 00 00 00       	call   8048a53 <_start+0x33>
 8048a30:	81 c3 d0 35 00 00    	add    $0x35d0,%ebx
 8048a36:	8d 83 d0 e0 ff ff    	lea    -0x1f30(%ebx),%eax
 8048a3c:	50                   	push   %eax
 8048a3d:	8d 83 70 e0 ff ff    	lea    -0x1f90(%ebx),%eax
 8048a43:	50                   	push   %eax
 8048a44:	51                   	push   %ecx
 8048a45:	56                   	push   %esi
 8048a46:	c7 c0 73 90 04 08    	mov    $0x8049073,%eax
 8048a4c:	50                   	push   %eax
 8048a4d:	e8 9e fe ff ff       	call   80488f0 <__libc_start_main@plt>
 8048a52:	f4                   	hlt    
 8048a53:	8b 1c 24             	mov    (%esp),%ebx
 8048a56:	c3                   	ret    
 8048a57:	66 90                	xchg   %ax,%ax
 8048a59:	66 90                	xchg   %ax,%ax
 8048a5b:	66 90                	xchg   %ax,%ax
 8048a5d:	66 90                	xchg   %ax,%ax
 8048a5f:	90                   	nop

08048a60 <_dl_relocate_static_pie>:
 8048a60:	f3 c3                	repz ret 
 8048a62:	66 90                	xchg   %ax,%ax
 8048a64:	66 90                	xchg   %ax,%ax
 8048a66:	66 90                	xchg   %ax,%ax
 8048a68:	66 90                	xchg   %ax,%ax
 8048a6a:	66 90                	xchg   %ax,%ax
 8048a6c:	66 90                	xchg   %ax,%ax
 8048a6e:	66 90                	xchg   %ax,%ax

08048a70 <__x86.get_pc_thunk.bx>:
 8048a70:	8b 1c 24             	mov    (%esp),%ebx
 8048a73:	c3                   	ret    
 8048a74:	66 90                	xchg   %ax,%ax
 8048a76:	66 90                	xchg   %ax,%ax
 8048a78:	66 90                	xchg   %ax,%ax
 8048a7a:	66 90                	xchg   %ax,%ax
 8048a7c:	66 90                	xchg   %ax,%ax
 8048a7e:	66 90                	xchg   %ax,%ax

08048a80 <deregister_tm_clones>:
 8048a80:	b8 e3 d0 04 08       	mov    $0x804d0e3,%eax
 8048a85:	2d e0 d0 04 08       	sub    $0x804d0e0,%eax
 8048a8a:	83 f8 06             	cmp    $0x6,%eax
 8048a8d:	77 01                	ja     8048a90 <deregister_tm_clones+0x10>
 8048a8f:	c3                   	ret    
 8048a90:	b8 00 00 00 00       	mov    $0x0,%eax
 8048a95:	85 c0                	test   %eax,%eax
 8048a97:	74 f6                	je     8048a8f <deregister_tm_clones+0xf>
 8048a99:	55                   	push   %ebp
 8048a9a:	89 e5                	mov    %esp,%ebp
 8048a9c:	83 ec 18             	sub    $0x18,%esp
 8048a9f:	c7 04 24 e0 d0 04 08 	movl   $0x804d0e0,(%esp)
 8048aa6:	ff d0                	call   *%eax
 8048aa8:	c9                   	leave  
 8048aa9:	c3                   	ret    
 8048aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048ab0 <register_tm_clones>:
 8048ab0:	b8 e0 d0 04 08       	mov    $0x804d0e0,%eax
 8048ab5:	2d e0 d0 04 08       	sub    $0x804d0e0,%eax
 8048aba:	c1 f8 02             	sar    $0x2,%eax
 8048abd:	89 c2                	mov    %eax,%edx
 8048abf:	c1 ea 1f             	shr    $0x1f,%edx
 8048ac2:	01 d0                	add    %edx,%eax
 8048ac4:	d1 f8                	sar    %eax
 8048ac6:	75 01                	jne    8048ac9 <register_tm_clones+0x19>
 8048ac8:	c3                   	ret    
 8048ac9:	ba 00 00 00 00       	mov    $0x0,%edx
 8048ace:	85 d2                	test   %edx,%edx
 8048ad0:	74 f6                	je     8048ac8 <register_tm_clones+0x18>
 8048ad2:	55                   	push   %ebp
 8048ad3:	89 e5                	mov    %esp,%ebp
 8048ad5:	83 ec 18             	sub    $0x18,%esp
 8048ad8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048adc:	c7 04 24 e0 d0 04 08 	movl   $0x804d0e0,(%esp)
 8048ae3:	ff d2                	call   *%edx
 8048ae5:	c9                   	leave  
 8048ae6:	c3                   	ret    
 8048ae7:	89 f6                	mov    %esi,%esi
 8048ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048af0 <__do_global_dtors_aux>:
 8048af0:	80 3d 0c d1 04 08 00 	cmpb   $0x0,0x804d10c
 8048af7:	75 13                	jne    8048b0c <__do_global_dtors_aux+0x1c>
 8048af9:	55                   	push   %ebp
 8048afa:	89 e5                	mov    %esp,%ebp
 8048afc:	83 ec 08             	sub    $0x8,%esp
 8048aff:	e8 7c ff ff ff       	call   8048a80 <deregister_tm_clones>
 8048b04:	c6 05 0c d1 04 08 01 	movb   $0x1,0x804d10c
 8048b0b:	c9                   	leave  
 8048b0c:	f3 c3                	repz ret 
 8048b0e:	66 90                	xchg   %ax,%ax

08048b10 <frame_dummy>:
 8048b10:	a1 10 bf 04 08       	mov    0x804bf10,%eax
 8048b15:	85 c0                	test   %eax,%eax
 8048b17:	74 1f                	je     8048b38 <frame_dummy+0x28>
 8048b19:	b8 00 00 00 00       	mov    $0x0,%eax
 8048b1e:	85 c0                	test   %eax,%eax
 8048b20:	74 16                	je     8048b38 <frame_dummy+0x28>
 8048b22:	55                   	push   %ebp
 8048b23:	89 e5                	mov    %esp,%ebp
 8048b25:	83 ec 18             	sub    $0x18,%esp
 8048b28:	c7 04 24 10 bf 04 08 	movl   $0x804bf10,(%esp)
 8048b2f:	ff d0                	call   *%eax
 8048b31:	c9                   	leave  
 8048b32:	e9 79 ff ff ff       	jmp    8048ab0 <register_tm_clones>
 8048b37:	90                   	nop
 8048b38:	e9 73 ff ff ff       	jmp    8048ab0 <register_tm_clones>
 8048b3d:	66 90                	xchg   %ax,%ax
 8048b3f:	90                   	nop

08048b40 <bushandler>:
 8048b40:	55                   	push   %ebp
 8048b41:	89 e5                	mov    %esp,%ebp
 8048b43:	83 ec 18             	sub    $0x18,%esp
 8048b46:	c7 04 24 f0 a0 04 08 	movl   $0x804a0f0,(%esp)
 8048b4d:	e8 3e fd ff ff       	call   8048890 <puts@plt>
 8048b52:	c7 04 24 fc a2 04 08 	movl   $0x804a2fc,(%esp)
 8048b59:	e8 32 fd ff ff       	call   8048890 <puts@plt>
 8048b5e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048b65:	e8 56 fd ff ff       	call   80488c0 <exit@plt>

08048b6a <seghandler>:
 8048b6a:	55                   	push   %ebp
 8048b6b:	89 e5                	mov    %esp,%ebp
 8048b6d:	83 ec 18             	sub    $0x18,%esp
 8048b70:	c7 04 24 10 a1 04 08 	movl   $0x804a110,(%esp)
 8048b77:	e8 14 fd ff ff       	call   8048890 <puts@plt>
 8048b7c:	c7 04 24 fc a2 04 08 	movl   $0x804a2fc,(%esp)
 8048b83:	e8 08 fd ff ff       	call   8048890 <puts@plt>
 8048b88:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048b8f:	e8 2c fd ff ff       	call   80488c0 <exit@plt>

08048b94 <illegalhandler>:
 8048b94:	55                   	push   %ebp
 8048b95:	89 e5                	mov    %esp,%ebp
 8048b97:	83 ec 18             	sub    $0x18,%esp
 8048b9a:	c7 04 24 38 a1 04 08 	movl   $0x804a138,(%esp)
 8048ba1:	e8 ea fc ff ff       	call   8048890 <puts@plt>
 8048ba6:	c7 04 24 fc a2 04 08 	movl   $0x804a2fc,(%esp)
 8048bad:	e8 de fc ff ff       	call   8048890 <puts@plt>
 8048bb2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048bb9:	e8 02 fd ff ff       	call   80488c0 <exit@plt>

08048bbe <usage>:
 8048bbe:	55                   	push   %ebp
 8048bbf:	89 e5                	mov    %esp,%ebp
 8048bc1:	83 ec 18             	sub    $0x18,%esp
 8048bc4:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048bc8:	c7 44 24 04 12 a3 04 	movl   $0x804a312,0x4(%esp)
 8048bcf:	08 
 8048bd0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048bd7:	e8 84 fd ff ff       	call   8048960 <__printf_chk@plt>
 8048bdc:	c7 04 24 30 a3 04 08 	movl   $0x804a330,(%esp)
 8048be3:	e8 a8 fc ff ff       	call   8048890 <puts@plt>
 8048be8:	c7 04 24 46 a3 04 08 	movl   $0x804a346,(%esp)
 8048bef:	e8 9c fc ff ff       	call   8048890 <puts@plt>
 8048bf4:	c7 04 24 64 a1 04 08 	movl   $0x804a164,(%esp)
 8048bfb:	e8 90 fc ff ff       	call   8048890 <puts@plt>
 8048c00:	c7 04 24 a0 a1 04 08 	movl   $0x804a1a0,(%esp)
 8048c07:	e8 84 fc ff ff       	call   8048890 <puts@plt>
 8048c0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048c13:	e8 a8 fc ff ff       	call   80488c0 <exit@plt>

08048c18 <smoke>:
 8048c18:	55                   	push   %ebp
 8048c19:	89 e5                	mov    %esp,%ebp
 8048c1b:	83 ec 18             	sub    $0x18,%esp
 8048c1e:	c7 04 24 5f a3 04 08 	movl   $0x804a35f,(%esp)
 8048c25:	e8 66 fc ff ff       	call   8048890 <puts@plt>
 8048c2a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048c31:	e8 ae 06 00 00       	call   80492e4 <validate>
 8048c36:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048c3d:	e8 7e fc ff ff       	call   80488c0 <exit@plt>

08048c42 <fizz>:
 8048c42:	55                   	push   %ebp
 8048c43:	89 e5                	mov    %esp,%ebp
 8048c45:	83 ec 18             	sub    $0x18,%esp
 8048c48:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c4b:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048c4e:	89 c1                	mov    %eax,%ecx
 8048c50:	f7 d1                	not    %ecx
 8048c52:	c1 e1 08             	shl    $0x8,%ecx
 8048c55:	23 0d 28 d1 04 08    	and    0x804d128,%ecx
 8048c5b:	39 d1                	cmp    %edx,%ecx
 8048c5d:	75 2a                	jne    8048c89 <fizz+0x47>
 8048c5f:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c63:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c67:	c7 44 24 04 c8 a1 04 	movl   $0x804a1c8,0x4(%esp)
 8048c6e:	08 
 8048c6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048c76:	e8 e5 fc ff ff       	call   8048960 <__printf_chk@plt>
 8048c7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048c82:	e8 5d 06 00 00       	call   80492e4 <validate>
 8048c87:	eb 1c                	jmp    8048ca5 <fizz+0x63>
 8048c89:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8048c8d:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c91:	c7 44 24 04 ec a1 04 	movl   $0x804a1ec,0x4(%esp)
 8048c98:	08 
 8048c99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048ca0:	e8 bb fc ff ff       	call   8048960 <__printf_chk@plt>
 8048ca5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048cac:	e8 0f fc ff ff       	call   80488c0 <exit@plt>

08048cb1 <bang>:
 8048cb1:	55                   	push   %ebp
 8048cb2:	89 e5                	mov    %esp,%ebp
 8048cb4:	83 ec 18             	sub    $0x18,%esp
 8048cb7:	a1 20 d1 04 08       	mov    0x804d120,%eax
 8048cbc:	8b 15 28 d1 04 08    	mov    0x804d128,%edx
 8048cc2:	81 e2 0f 0f 00 00    	and    $0xf0f,%edx
 8048cc8:	39 d0                	cmp    %edx,%eax
 8048cca:	75 26                	jne    8048cf2 <bang+0x41>
 8048ccc:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048cd0:	c7 44 24 04 14 a2 04 	movl   $0x804a214,0x4(%esp)
 8048cd7:	08 
 8048cd8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048cdf:	e8 7c fc ff ff       	call   8048960 <__printf_chk@plt>
 8048ce4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8048ceb:	e8 f4 05 00 00       	call   80492e4 <validate>
 8048cf0:	eb 18                	jmp    8048d0a <bang+0x59>
 8048cf2:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048cf6:	c7 44 24 04 7a a3 04 	movl   $0x804a37a,0x4(%esp)
 8048cfd:	08 
 8048cfe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048d05:	e8 56 fc ff ff       	call   8048960 <__printf_chk@plt>
 8048d0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048d11:	e8 aa fb ff ff       	call   80488c0 <exit@plt>

08048d16 <Gets>:
 8048d16:	55                   	push   %ebp
 8048d17:	89 e5                	mov    %esp,%ebp
 8048d19:	57                   	push   %edi
 8048d1a:	56                   	push   %esi
 8048d1b:	53                   	push   %ebx
 8048d1c:	83 ec 1c             	sub    $0x1c,%esp
 8048d1f:	8b 75 08             	mov    0x8(%ebp),%esi
 8048d22:	c7 05 1c d1 04 08 00 	movl   $0x0,0x804d11c
 8048d29:	00 00 00 
 8048d2c:	89 f3                	mov    %esi,%ebx
 8048d2e:	eb 49                	jmp    8048d79 <Gets+0x63>
 8048d30:	83 c3 01             	add    $0x1,%ebx
 8048d33:	88 53 ff             	mov    %dl,-0x1(%ebx)
 8048d36:	a1 1c d1 04 08       	mov    0x804d11c,%eax
 8048d3b:	3d ff 03 00 00       	cmp    $0x3ff,%eax
 8048d40:	7f 37                	jg     8048d79 <Gets+0x63>
 8048d42:	8d 3c 40             	lea    (%eax,%eax,2),%edi
 8048d45:	89 d1                	mov    %edx,%ecx
 8048d47:	c0 e9 04             	shr    $0x4,%cl
 8048d4a:	0f be c9             	movsbl %cl,%ecx
 8048d4d:	0f b6 89 19 a4 04 08 	movzbl 0x804a419(%ecx),%ecx
 8048d54:	88 8f 60 d1 04 08    	mov    %cl,0x804d160(%edi)
 8048d5a:	83 e2 0f             	and    $0xf,%edx
 8048d5d:	0f b6 92 19 a4 04 08 	movzbl 0x804a419(%edx),%edx
 8048d64:	88 97 61 d1 04 08    	mov    %dl,0x804d161(%edi)
 8048d6a:	c6 87 62 d1 04 08 20 	movb   $0x20,0x804d162(%edi)
 8048d71:	83 c0 01             	add    $0x1,%eax
 8048d74:	a3 1c d1 04 08       	mov    %eax,0x804d11c
 8048d79:	a1 2c d1 04 08       	mov    0x804d12c,%eax
 8048d7e:	89 04 24             	mov    %eax,(%esp)
 8048d81:	e8 ba fa ff ff       	call   8048840 <_IO_getc@plt>
 8048d86:	89 c2                	mov    %eax,%edx
 8048d88:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048d8b:	74 05                	je     8048d92 <Gets+0x7c>
 8048d8d:	83 f8 0a             	cmp    $0xa,%eax
 8048d90:	75 9e                	jne    8048d30 <Gets+0x1a>
 8048d92:	c6 03 00             	movb   $0x0,(%ebx)
 8048d95:	a1 1c d1 04 08       	mov    0x804d11c,%eax
 8048d9a:	c6 84 40 60 d1 04 08 	movb   $0x0,0x804d160(%eax,%eax,2)
 8048da1:	00 
 8048da2:	89 f0                	mov    %esi,%eax
 8048da4:	83 c4 1c             	add    $0x1c,%esp
 8048da7:	5b                   	pop    %ebx
 8048da8:	5e                   	pop    %esi
 8048da9:	5f                   	pop    %edi
 8048daa:	5d                   	pop    %ebp
 8048dab:	c3                   	ret    

08048dac <getbuf>:
 8048dac:	55                   	push   %ebp
 8048dad:	89 e5                	mov    %esp,%ebp
 8048daf:	53                   	push   %ebx
 8048db0:	83 ec 44             	sub    $0x44,%esp
 8048db3:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8048db6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8048dbd:	00 
 8048dbe:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048dc5:	00 
 8048dc6:	a1 34 d1 04 08       	mov    0x804d134,%eax
 8048dcb:	83 c0 05             	add    $0x5,%eax
 8048dce:	89 04 24             	mov    %eax,(%esp)
 8048dd1:	e8 ea fb ff ff       	call   80489c0 <strtol@plt>
 8048dd6:	99                   	cltd   
 8048dd7:	c1 ea 1c             	shr    $0x1c,%edx
 8048dda:	01 d0                	add    %edx,%eax
 8048ddc:	83 e0 0f             	and    $0xf,%eax
 8048ddf:	29 d0                	sub    %edx,%eax
 8048de1:	8d 44 05 d1          	lea    -0x2f(%ebp,%eax,1),%eax
 8048de5:	89 04 24             	mov    %eax,(%esp)
 8048de8:	e8 29 ff ff ff       	call   8048d16 <Gets>
 8048ded:	85 db                	test   %ebx,%ebx
 8048def:	74 06                	je     8048df7 <getbuf+0x4b>
 8048df1:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 8048df7:	83 c4 44             	add    $0x44,%esp
 8048dfa:	5b                   	pop    %ebx
 8048dfb:	5d                   	pop    %ebp
 8048dfc:	c3                   	ret    

08048dfd <getbufn>:
 8048dfd:	55                   	push   %ebp
 8048dfe:	89 e5                	mov    %esp,%ebp
 8048e00:	81 ec 18 02 00 00    	sub    $0x218,%esp
 8048e06:	8d 85 f8 fd ff ff    	lea    -0x208(%ebp),%eax
 8048e0c:	89 04 24             	mov    %eax,(%esp)
 8048e0f:	e8 02 ff ff ff       	call   8048d16 <Gets>
 8048e14:	b8 01 00 00 00       	mov    $0x1,%eax
 8048e19:	c9                   	leave  
 8048e1a:	c3                   	ret    

08048e1b <testn>:
 8048e1b:	55                   	push   %ebp
 8048e1c:	89 e5                	mov    %esp,%ebp
 8048e1e:	83 ec 28             	sub    $0x28,%esp
 8048e21:	c7 45 f4 ef be ad de 	movl   $0xdeadbeef,-0xc(%ebp)
 8048e28:	e8 d0 ff ff ff       	call   8048dfd <getbufn>
 8048e2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048e30:	81 fa ef be ad de    	cmp    $0xdeadbeef,%edx
 8048e36:	74 0e                	je     8048e46 <testn+0x2b>
 8048e38:	c7 04 24 3c a2 04 08 	movl   $0x804a23c,(%esp)
 8048e3f:	e8 4c fa ff ff       	call   8048890 <puts@plt>
 8048e44:	eb 46                	jmp    8048e8c <testn+0x71>
 8048e46:	3b 05 28 d1 04 08    	cmp    0x804d128,%eax
 8048e4c:	75 26                	jne    8048e74 <testn+0x59>
 8048e4e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048e52:	c7 44 24 04 68 a2 04 	movl   $0x804a268,0x4(%esp)
 8048e59:	08 
 8048e5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048e61:	e8 fa fa ff ff       	call   8048960 <__printf_chk@plt>
 8048e66:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 8048e6d:	e8 72 04 00 00       	call   80492e4 <validate>
 8048e72:	eb 18                	jmp    8048e8c <testn+0x71>
 8048e74:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048e78:	c7 44 24 04 98 a3 04 	movl   $0x804a398,0x4(%esp)
 8048e7f:	08 
 8048e80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048e87:	e8 d4 fa ff ff       	call   8048960 <__printf_chk@plt>
 8048e8c:	c9                   	leave  
 8048e8d:	c3                   	ret    

08048e8e <uniqueval>:
 8048e8e:	55                   	push   %ebp
 8048e8f:	89 e5                	mov    %esp,%ebp
 8048e91:	83 ec 18             	sub    $0x18,%esp
 8048e94:	e8 d7 f9 ff ff       	call   8048870 <getpid@plt>
 8048e99:	89 04 24             	mov    %eax,(%esp)
 8048e9c:	e8 5f f9 ff ff       	call   8048800 <srandom@plt>
 8048ea1:	e8 fa fa ff ff       	call   80489a0 <random@plt>
 8048ea6:	c9                   	leave  
 8048ea7:	c3                   	ret    

08048ea8 <test>:
 8048ea8:	55                   	push   %ebp
 8048ea9:	89 e5                	mov    %esp,%ebp
 8048eab:	83 ec 28             	sub    $0x28,%esp
 8048eae:	e8 db ff ff ff       	call   8048e8e <uniqueval>
 8048eb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048eb6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048eb9:	89 04 24             	mov    %eax,(%esp)
 8048ebc:	e8 eb fe ff ff       	call   8048dac <getbuf>
 8048ec1:	e8 c8 ff ff ff       	call   8048e8e <uniqueval>
 8048ec6:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048ec9:	39 d0                	cmp    %edx,%eax
 8048ecb:	74 0e                	je     8048edb <test+0x33>
 8048ecd:	c7 04 24 3c a2 04 08 	movl   $0x804a23c,(%esp)
 8048ed4:	e8 b7 f9 ff ff       	call   8048890 <puts@plt>
 8048ed9:	eb 49                	jmp    8048f24 <test+0x7c>
 8048edb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ede:	3b 05 28 d1 04 08    	cmp    0x804d128,%eax
 8048ee4:	75 26                	jne    8048f0c <test+0x64>
 8048ee6:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048eea:	c7 44 24 04 b4 a3 04 	movl   $0x804a3b4,0x4(%esp)
 8048ef1:	08 
 8048ef2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048ef9:	e8 62 fa ff ff       	call   8048960 <__printf_chk@plt>
 8048efe:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048f05:	e8 da 03 00 00       	call   80492e4 <validate>
 8048f0a:	eb 18                	jmp    8048f24 <test+0x7c>
 8048f0c:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f10:	c7 44 24 04 d1 a3 04 	movl   $0x804a3d1,0x4(%esp)
 8048f17:	08 
 8048f18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048f1f:	e8 3c fa ff ff       	call   8048960 <__printf_chk@plt>
 8048f24:	c9                   	leave  
 8048f25:	c3                   	ret    

08048f26 <launch>:
 8048f26:	55                   	push   %ebp
 8048f27:	89 e5                	mov    %esp,%ebp
 8048f29:	53                   	push   %ebx
 8048f2a:	83 ec 54             	sub    $0x54,%esp
 8048f2d:	89 c3                	mov    %eax,%ebx
 8048f2f:	8d 4d b8             	lea    -0x48(%ebp),%ecx
 8048f32:	81 e1 f0 3f 00 00    	and    $0x3ff0,%ecx
 8048f38:	8d 44 11 1e          	lea    0x1e(%ecx,%edx,1),%eax
 8048f3c:	83 e0 f0             	and    $0xfffffff0,%eax
 8048f3f:	29 c4                	sub    %eax,%esp
 8048f41:	8d 44 24 1b          	lea    0x1b(%esp),%eax
 8048f45:	83 e0 f0             	and    $0xfffffff0,%eax
 8048f48:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048f4c:	c7 44 24 04 f4 00 00 	movl   $0xf4,0x4(%esp)
 8048f53:	00 
 8048f54:	89 04 24             	mov    %eax,(%esp)
 8048f57:	e8 d4 f9 ff ff       	call   8048930 <memset@plt>
 8048f5c:	c7 44 24 04 ec a3 04 	movl   $0x804a3ec,0x4(%esp)
 8048f63:	08 
 8048f64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048f6b:	e8 f0 f9 ff ff       	call   8048960 <__printf_chk@plt>
 8048f70:	85 db                	test   %ebx,%ebx
 8048f72:	74 07                	je     8048f7b <launch+0x55>
 8048f74:	e8 a2 fe ff ff       	call   8048e1b <testn>
 8048f79:	eb 0a                	jmp    8048f85 <launch+0x5f>
 8048f7b:	90                   	nop
 8048f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048f80:	e8 23 ff ff ff       	call   8048ea8 <test>
 8048f85:	83 3d 24 d1 04 08 00 	cmpl   $0x0,0x804d124
 8048f8c:	75 16                	jne    8048fa4 <launch+0x7e>
 8048f8e:	c7 04 24 fc a2 04 08 	movl   $0x804a2fc,(%esp)
 8048f95:	e8 f6 f8 ff ff       	call   8048890 <puts@plt>
 8048f9a:	c7 05 24 d1 04 08 00 	movl   $0x0,0x804d124
 8048fa1:	00 00 00 
 8048fa4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048fa7:	c9                   	leave  
 8048fa8:	c3                   	ret    

08048fa9 <launcher>:
 8048fa9:	55                   	push   %ebp
 8048faa:	89 e5                	mov    %esp,%ebp
 8048fac:	83 ec 28             	sub    $0x28,%esp
 8048faf:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fb2:	a3 18 d1 04 08       	mov    %eax,0x804d118
 8048fb7:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048fba:	a3 14 d1 04 08       	mov    %eax,0x804d114
 8048fbf:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 8048fc6:	00 
 8048fc7:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
 8048fce:	00 
 8048fcf:	c7 44 24 0c 32 01 00 	movl   $0x132,0xc(%esp)
 8048fd6:	00 
 8048fd7:	c7 44 24 08 07 00 00 	movl   $0x7,0x8(%esp)
 8048fde:	00 
 8048fdf:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
 8048fe6:	00 
 8048fe7:	c7 04 24 00 60 58 55 	movl   $0x55586000,(%esp)
 8048fee:	e8 ed f8 ff ff       	call   80488e0 <mmap@plt>
 8048ff3:	3d 00 60 58 55       	cmp    $0x55586000,%eax
 8048ff8:	74 31                	je     804902b <launcher+0x82>
 8048ffa:	a1 e0 d0 04 08       	mov    0x804d0e0,%eax
 8048fff:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049003:	c7 44 24 08 47 00 00 	movl   $0x47,0x8(%esp)
 804900a:	00 
 804900b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049012:	00 
 8049013:	c7 04 24 88 a2 04 08 	movl   $0x804a288,(%esp)
 804901a:	e8 31 f8 ff ff       	call   8048850 <fwrite@plt>
 804901f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049026:	e8 95 f8 ff ff       	call   80488c0 <exit@plt>
 804902b:	c7 05 40 d1 04 08 f8 	movl   $0x55685ff8,0x804d140
 8049032:	5f 68 55 
 8049035:	ba f8 5f 68 55       	mov    $0x55685ff8,%edx
 804903a:	89 e0                	mov    %esp,%eax
 804903c:	89 d4                	mov    %edx,%esp
 804903e:	89 c2                	mov    %eax,%edx
 8049040:	89 15 10 d1 04 08    	mov    %edx,0x804d110
 8049046:	8b 15 14 d1 04 08    	mov    0x804d114,%edx
 804904c:	a1 18 d1 04 08       	mov    0x804d118,%eax
 8049051:	e8 d0 fe ff ff       	call   8048f26 <launch>
 8049056:	a1 10 d1 04 08       	mov    0x804d110,%eax
 804905b:	89 c4                	mov    %eax,%esp
 804905d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
 8049064:	00 
 8049065:	c7 04 24 00 60 58 55 	movl   $0x55586000,(%esp)
 804906c:	e8 ff f8 ff ff       	call   8048970 <munmap@plt>
 8049071:	c9                   	leave  
 8049072:	c3                   	ret    

08049073 <main>:
 8049073:	55                   	push   %ebp
 8049074:	89 e5                	mov    %esp,%ebp
 8049076:	57                   	push   %edi
 8049077:	56                   	push   %esi
 8049078:	53                   	push   %ebx
 8049079:	83 e4 f0             	and    $0xfffffff0,%esp
 804907c:	83 ec 20             	sub    $0x20,%esp
 804907f:	8b 75 08             	mov    0x8(%ebp),%esi
 8049082:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8049085:	c7 44 24 04 6a 8b 04 	movl   $0x8048b6a,0x4(%esp)
 804908c:	08 
 804908d:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
 8049094:	e8 87 f7 ff ff       	call   8048820 <signal@plt>
 8049099:	c7 44 24 04 40 8b 04 	movl   $0x8048b40,0x4(%esp)
 80490a0:	08 
 80490a1:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
 80490a8:	e8 73 f7 ff ff       	call   8048820 <signal@plt>
 80490ad:	c7 44 24 04 94 8b 04 	movl   $0x8048b94,0x4(%esp)
 80490b4:	08 
 80490b5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
 80490bc:	e8 5f f7 ff ff       	call   8048820 <signal@plt>
 80490c1:	a1 00 d1 04 08       	mov    0x804d100,%eax
 80490c6:	a3 2c d1 04 08       	mov    %eax,0x804d12c
 80490cb:	bf 01 00 00 00       	mov    $0x1,%edi
 80490d0:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 80490d7:	00 
 80490d8:	eb 69                	jmp    8049143 <main+0xd0>
 80490da:	3c 6e                	cmp    $0x6e,%al
 80490dc:	74 1b                	je     80490f9 <main+0x86>
 80490de:	80 fa 6e             	cmp    $0x6e,%dl
 80490e1:	7f 07                	jg     80490ea <main+0x77>
 80490e3:	80 fa 68             	cmp    $0x68,%dl
 80490e6:	74 20                	je     8049108 <main+0x95>
 80490e8:	eb 52                	jmp    804913c <main+0xc9>
 80490ea:	80 fa 73             	cmp    $0x73,%dl
 80490ed:	8d 76 00             	lea    0x0(%esi),%esi
 80490f0:	74 3e                	je     8049130 <main+0xbd>
 80490f2:	80 fa 75             	cmp    $0x75,%dl
 80490f5:	74 18                	je     804910f <main+0x9c>
 80490f7:	eb 43                	jmp    804913c <main+0xc9>
 80490f9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 8049100:	00 
 8049101:	bf 05 00 00 00       	mov    $0x5,%edi
 8049106:	eb 3b                	jmp    8049143 <main+0xd0>
 8049108:	8b 03                	mov    (%ebx),%eax
 804910a:	e8 af fa ff ff       	call   8048bbe <usage>
 804910f:	a1 08 d1 04 08       	mov    0x804d108,%eax
 8049114:	89 04 24             	mov    %eax,(%esp)
 8049117:	e8 f4 f6 ff ff       	call   8048810 <strdup@plt>
 804911c:	a3 34 d1 04 08       	mov    %eax,0x804d134
 8049121:	89 04 24             	mov    %eax,(%esp)
 8049124:	e8 03 0f 00 00       	call   804a02c <gencookie>
 8049129:	a3 28 d1 04 08       	mov    %eax,0x804d128
 804912e:	eb 13                	jmp    8049143 <main+0xd0>
 8049130:	c7 05 30 d1 04 08 01 	movl   $0x1,0x804d130
 8049137:	00 00 00 
 804913a:	eb 07                	jmp    8049143 <main+0xd0>
 804913c:	8b 03                	mov    (%ebx),%eax
 804913e:	e8 7b fa ff ff       	call   8048bbe <usage>
 8049143:	c7 44 24 08 f9 a3 04 	movl   $0x804a3f9,0x8(%esp)
 804914a:	08 
 804914b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804914f:	89 34 24             	mov    %esi,(%esp)
 8049152:	e8 b9 f7 ff ff       	call   8048910 <getopt@plt>
 8049157:	89 c2                	mov    %eax,%edx
 8049159:	3c ff                	cmp    $0xff,%al
 804915b:	0f 85 79 ff ff ff    	jne    80490da <main+0x67>
 8049161:	83 3d 34 d1 04 08 00 	cmpl   $0x0,0x804d134
 8049168:	75 21                	jne    804918b <main+0x118>
 804916a:	8b 03                	mov    (%ebx),%eax
 804916c:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049170:	c7 44 24 04 d0 a2 04 	movl   $0x804a2d0,0x4(%esp)
 8049177:	08 
 8049178:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804917f:	e8 dc f7 ff ff       	call   8048960 <__printf_chk@plt>
 8049184:	8b 03                	mov    (%ebx),%eax
 8049186:	e8 33 fa ff ff       	call   8048bbe <usage>
 804918b:	e8 c6 00 00 00       	call   8049256 <initialize_bomb>
 8049190:	a1 34 d1 04 08       	mov    0x804d134,%eax
 8049195:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049199:	c7 44 24 04 ff a3 04 	movl   $0x804a3ff,0x4(%esp)
 80491a0:	08 
 80491a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80491a8:	e8 b3 f7 ff ff       	call   8048960 <__printf_chk@plt>
 80491ad:	a1 28 d1 04 08       	mov    0x804d128,%eax
 80491b2:	89 44 24 08          	mov    %eax,0x8(%esp)
 80491b6:	c7 44 24 04 0b a4 04 	movl   $0x804a40b,0x4(%esp)
 80491bd:	08 
 80491be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80491c5:	e8 96 f7 ff ff       	call   8048960 <__printf_chk@plt>
 80491ca:	a1 28 d1 04 08       	mov    0x804d128,%eax
 80491cf:	89 04 24             	mov    %eax,(%esp)
 80491d2:	e8 29 f6 ff ff       	call   8048800 <srandom@plt>
 80491d7:	e8 c4 f7 ff ff       	call   80489a0 <random@plt>
 80491dc:	25 f0 0f 00 00       	and    $0xff0,%eax
 80491e1:	05 00 01 00 00       	add    $0x100,%eax
 80491e6:	89 44 24 18          	mov    %eax,0x18(%esp)
 80491ea:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 80491f1:	00 
 80491f2:	89 3c 24             	mov    %edi,(%esp)
 80491f5:	e8 f6 f7 ff ff       	call   80489f0 <calloc@plt>
 80491fa:	89 c6                	mov    %eax,%esi
 80491fc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8049202:	bb 01 00 00 00       	mov    $0x1,%ebx
 8049207:	eb 17                	jmp    8049220 <main+0x1ad>
 8049209:	e8 92 f7 ff ff       	call   80489a0 <random@plt>
 804920e:	25 f0 00 00 00       	and    $0xf0,%eax
 8049213:	b9 80 00 00 00       	mov    $0x80,%ecx
 8049218:	29 c1                	sub    %eax,%ecx
 804921a:	89 0c 9e             	mov    %ecx,(%esi,%ebx,4)
 804921d:	83 c3 01             	add    $0x1,%ebx
 8049220:	39 fb                	cmp    %edi,%ebx
 8049222:	7c e5                	jl     8049209 <main+0x196>
 8049224:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049229:	eb 1a                	jmp    8049245 <main+0x1d2>
 804922b:	8b 44 24 18          	mov    0x18(%esp),%eax
 804922f:	03 04 9e             	add    (%esi,%ebx,4),%eax
 8049232:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049236:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 804923a:	89 04 24             	mov    %eax,(%esp)
 804923d:	e8 67 fd ff ff       	call   8048fa9 <launcher>
 8049242:	83 c3 01             	add    $0x1,%ebx
 8049245:	39 fb                	cmp    %edi,%ebx
 8049247:	7c e2                	jl     804922b <main+0x1b8>
 8049249:	b8 00 00 00 00       	mov    $0x0,%eax
 804924e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8049251:	5b                   	pop    %ebx
 8049252:	5e                   	pop    %esi
 8049253:	5f                   	pop    %edi
 8049254:	5d                   	pop    %ebp
 8049255:	c3                   	ret    

08049256 <initialize_bomb>:
 8049256:	55                   	push   %ebp
 8049257:	89 e5                	mov    %esp,%ebp
 8049259:	81 ec 18 24 00 00    	sub    $0x2418,%esp
 804925f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049266:	e8 c0 0a 00 00       	call   8049d2b <init_timeout>
 804926b:	83 3d 30 d1 04 08 00 	cmpl   $0x0,0x804d130
 8049272:	74 6e                	je     80492e2 <initialize_bomb+0x8c>
 8049274:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
 804927b:	00 
 804927c:	8d 85 f8 fb ff ff    	lea    -0x408(%ebp),%eax
 8049282:	89 04 24             	mov    %eax,(%esp)
 8049285:	e8 f6 f5 ff ff       	call   8048880 <gethostname@plt>
 804928a:	85 c0                	test   %eax,%eax
 804928c:	74 18                	je     80492a6 <initialize_bomb+0x50>
 804928e:	c7 04 24 2c a4 04 08 	movl   $0x804a42c,(%esp)
 8049295:	e8 f6 f5 ff ff       	call   8048890 <puts@plt>
 804929a:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80492a1:	e8 1a f6 ff ff       	call   80488c0 <exit@plt>
 80492a6:	8d 85 f8 db ff ff    	lea    -0x2408(%ebp),%eax
 80492ac:	89 04 24             	mov    %eax,(%esp)
 80492af:	e8 b1 0a 00 00       	call   8049d65 <init_driver>
 80492b4:	85 c0                	test   %eax,%eax
 80492b6:	79 2a                	jns    80492e2 <initialize_bomb+0x8c>
 80492b8:	8d 85 f8 db ff ff    	lea    -0x2408(%ebp),%eax
 80492be:	89 44 24 08          	mov    %eax,0x8(%esp)
 80492c2:	c7 44 24 04 5e a5 04 	movl   $0x804a55e,0x4(%esp)
 80492c9:	08 
 80492ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80492d1:	e8 8a f6 ff ff       	call   8048960 <__printf_chk@plt>
 80492d6:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80492dd:	e8 de f5 ff ff       	call   80488c0 <exit@plt>
 80492e2:	c9                   	leave  
 80492e3:	c3                   	ret    

080492e4 <validate>:
 80492e4:	55                   	push   %ebp
 80492e5:	89 e5                	mov    %esp,%ebp
 80492e7:	57                   	push   %edi
 80492e8:	53                   	push   %ebx
 80492e9:	81 ec 20 40 00 00    	sub    $0x4020,%esp
 80492ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80492f2:	83 3d 34 d1 04 08 00 	cmpl   $0x0,0x804d134
 80492f9:	75 11                	jne    804930c <validate+0x28>
 80492fb:	c7 04 24 64 a4 04 08 	movl   $0x804a464,(%esp)
 8049302:	e8 89 f5 ff ff       	call   8048890 <puts@plt>
 8049307:	e9 2c 01 00 00       	jmp    8049438 <validate+0x154>
 804930c:	83 fb 04             	cmp    $0x4,%ebx
 804930f:	76 11                	jbe    8049322 <validate+0x3e>
 8049311:	c7 04 24 90 a4 04 08 	movl   $0x804a490,(%esp)
 8049318:	e8 73 f5 ff ff       	call   8048890 <puts@plt>
 804931d:	e9 16 01 00 00       	jmp    8049438 <validate+0x154>
 8049322:	c7 05 24 d1 04 08 01 	movl   $0x1,0x804d124
 8049329:	00 00 00 
 804932c:	8b 04 9d c0 c0 04 08 	mov    0x804c0c0(,%ebx,4),%eax
 8049333:	83 e8 01             	sub    $0x1,%eax
 8049336:	89 04 9d c0 c0 04 08 	mov    %eax,0x804c0c0(,%ebx,4)
 804933d:	85 c0                	test   %eax,%eax
 804933f:	7e 11                	jle    8049352 <validate+0x6e>
 8049341:	c7 04 24 73 a5 04 08 	movl   $0x804a573,(%esp)
 8049348:	e8 43 f5 ff ff       	call   8048890 <puts@plt>
 804934d:	e9 e6 00 00 00       	jmp    8049438 <validate+0x154>
 8049352:	c7 04 24 7e a5 04 08 	movl   $0x804a57e,(%esp)
 8049359:	e8 32 f5 ff ff       	call   8048890 <puts@plt>
 804935e:	83 3d 30 d1 04 08 00 	cmpl   $0x0,0x804d130
 8049365:	0f 84 c1 00 00 00    	je     804942c <validate+0x148>
 804936b:	bf 60 d1 04 08       	mov    $0x804d160,%edi
 8049370:	b8 00 00 00 00       	mov    $0x0,%eax
 8049375:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804937a:	f2 ae                	repnz scas %es:(%edi),%al
 804937c:	89 ca                	mov    %ecx,%edx
 804937e:	f7 d2                	not    %edx
 8049380:	89 d1                	mov    %edx,%ecx
 8049382:	83 c1 1f             	add    $0x1f,%ecx
 8049385:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
 804938b:	76 11                	jbe    804939e <validate+0xba>
 804938d:	c7 04 24 b8 a4 04 08 	movl   $0x804a4b8,(%esp)
 8049394:	e8 f7 f4 ff ff       	call   8048890 <puts@plt>
 8049399:	e9 9a 00 00 00       	jmp    8049438 <validate+0x154>
 804939e:	c7 44 24 18 60 d1 04 	movl   $0x804d160,0x18(%esp)
 80493a5:	08 
 80493a6:	a1 28 d1 04 08       	mov    0x804d128,%eax
 80493ab:	89 44 24 14          	mov    %eax,0x14(%esp)
 80493af:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 80493b3:	c7 44 24 0c 84 a5 04 	movl   $0x804a584,0xc(%esp)
 80493ba:	08 
 80493bb:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 80493c2:	00 
 80493c3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80493ca:	00 
 80493cb:	8d 9d f8 df ff ff    	lea    -0x2008(%ebp),%ebx
 80493d1:	89 1c 24             	mov    %ebx,(%esp)
 80493d4:	e8 27 f6 ff ff       	call   8048a00 <__sprintf_chk@plt>
 80493d9:	8d 85 f8 bf ff ff    	lea    -0x4008(%ebp),%eax
 80493df:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80493e3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80493ea:	00 
 80493eb:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80493ef:	a1 34 d1 04 08       	mov    0x804d134,%eax
 80493f4:	89 04 24             	mov    %eax,(%esp)
 80493f7:	e8 2e 0b 00 00       	call   8049f2a <driver_post>
 80493fc:	85 c0                	test   %eax,%eax
 80493fe:	75 0e                	jne    804940e <validate+0x12a>
 8049400:	c7 04 24 f0 a4 04 08 	movl   $0x804a4f0,(%esp)
 8049407:	e8 84 f4 ff ff       	call   8048890 <puts@plt>
 804940c:	eb 1e                	jmp    804942c <validate+0x148>
 804940e:	8d 85 f8 bf ff ff    	lea    -0x4008(%ebp),%eax
 8049414:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049418:	c7 44 24 04 20 a5 04 	movl   $0x804a520,0x4(%esp)
 804941f:	08 
 8049420:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049427:	e8 34 f5 ff ff       	call   8048960 <__printf_chk@plt>
 804942c:	c7 04 24 8d a5 04 08 	movl   $0x804a58d,(%esp)
 8049433:	e8 58 f4 ff ff       	call   8048890 <puts@plt>
 8049438:	81 c4 20 40 00 00    	add    $0x4020,%esp
 804943e:	5b                   	pop    %ebx
 804943f:	5f                   	pop    %edi
 8049440:	5d                   	pop    %ebp
 8049441:	c3                   	ret    
 8049442:	66 90                	xchg   %ax,%ax
 8049444:	66 90                	xchg   %ax,%ax
 8049446:	66 90                	xchg   %ax,%ax
 8049448:	66 90                	xchg   %ax,%ax
 804944a:	66 90                	xchg   %ax,%ax
 804944c:	66 90                	xchg   %ax,%ax
 804944e:	66 90                	xchg   %ax,%ax

08049450 <sigalrm_handler>:
 8049450:	55                   	push   %ebp
 8049451:	89 e5                	mov    %esp,%ebp
 8049453:	83 ec 18             	sub    $0x18,%esp
 8049456:	c7 44 24 0c 05 00 00 	movl   $0x5,0xc(%esp)
 804945d:	00 
 804945e:	c7 44 24 08 b0 a5 04 	movl   $0x804a5b0,0x8(%esp)
 8049465:	08 
 8049466:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804946d:	00 
 804946e:	a1 e0 d0 04 08       	mov    0x804d0e0,%eax
 8049473:	89 04 24             	mov    %eax,(%esp)
 8049476:	e8 15 f5 ff ff       	call   8048990 <__fprintf_chk@plt>
 804947b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049482:	e8 39 f4 ff ff       	call   80488c0 <exit@plt>

08049487 <rio_readlineb>:
 8049487:	55                   	push   %ebp
 8049488:	89 e5                	mov    %esp,%ebp
 804948a:	57                   	push   %edi
 804948b:	56                   	push   %esi
 804948c:	53                   	push   %ebx
 804948d:	83 ec 4c             	sub    $0x4c,%esp
 8049490:	89 55 d0             	mov    %edx,-0x30(%ebp)
 8049493:	83 f9 01             	cmp    $0x1,%ecx
 8049496:	0f 86 c8 00 00 00    	jbe    8049564 <rio_readlineb+0xdd>
 804949c:	89 c3                	mov    %eax,%ebx
 804949e:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
 80494a1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 80494a8:	8d 78 0c             	lea    0xc(%eax),%edi
 80494ab:	eb 38                	jmp    80494e5 <rio_readlineb+0x5e>
 80494ad:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 80494b4:	00 
 80494b5:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80494b9:	8b 03                	mov    (%ebx),%eax
 80494bb:	89 04 24             	mov    %eax,(%esp)
 80494be:	e8 2d f3 ff ff       	call   80487f0 <read@plt>
 80494c3:	89 43 04             	mov    %eax,0x4(%ebx)
 80494c6:	85 c0                	test   %eax,%eax
 80494c8:	79 0f                	jns    80494d9 <rio_readlineb+0x52>
 80494ca:	e8 71 f4 ff ff       	call   8048940 <__errno_location@plt>
 80494cf:	83 38 04             	cmpl   $0x4,(%eax)
 80494d2:	74 11                	je     80494e5 <rio_readlineb+0x5e>
 80494d4:	e9 9d 00 00 00       	jmp    8049576 <rio_readlineb+0xef>
 80494d9:	85 c0                	test   %eax,%eax
 80494db:	90                   	nop
 80494dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80494e0:	74 6a                	je     804954c <rio_readlineb+0xc5>
 80494e2:	89 7b 08             	mov    %edi,0x8(%ebx)
 80494e5:	8b 73 04             	mov    0x4(%ebx),%esi
 80494e8:	85 f6                	test   %esi,%esi
 80494ea:	7e c1                	jle    80494ad <rio_readlineb+0x26>
 80494ec:	85 f6                	test   %esi,%esi
 80494ee:	0f 95 c0             	setne  %al
 80494f1:	0f b6 c0             	movzbl %al,%eax
 80494f4:	89 45 cc             	mov    %eax,-0x34(%ebp)
 80494f7:	8b 4b 08             	mov    0x8(%ebx),%ecx
 80494fa:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8049501:	00 
 8049502:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049506:	89 4d c8             	mov    %ecx,-0x38(%ebp)
 8049509:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804950d:	8d 55 e7             	lea    -0x19(%ebp),%edx
 8049510:	89 14 24             	mov    %edx,(%esp)
 8049513:	e8 98 f3 ff ff       	call   80488b0 <__memcpy_chk@plt>
 8049518:	8b 4d c8             	mov    -0x38(%ebp),%ecx
 804951b:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804951e:	01 d1                	add    %edx,%ecx
 8049520:	89 4b 08             	mov    %ecx,0x8(%ebx)
 8049523:	29 d6                	sub    %edx,%esi
 8049525:	89 73 04             	mov    %esi,0x4(%ebx)
 8049528:	83 fa 01             	cmp    $0x1,%edx
 804952b:	75 14                	jne    8049541 <rio_readlineb+0xba>
 804952d:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
 8049531:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 8049535:	8b 55 d0             	mov    -0x30(%ebp),%edx
 8049538:	88 42 ff             	mov    %al,-0x1(%edx)
 804953b:	3c 0a                	cmp    $0xa,%al
 804953d:	75 17                	jne    8049556 <rio_readlineb+0xcf>
 804953f:	eb 2a                	jmp    804956b <rio_readlineb+0xe4>
 8049541:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
 8049545:	75 36                	jne    804957d <rio_readlineb+0xf6>
 8049547:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804954a:	eb 03                	jmp    804954f <rio_readlineb+0xc8>
 804954c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804954f:	83 f8 01             	cmp    $0x1,%eax
 8049552:	75 17                	jne    804956b <rio_readlineb+0xe4>
 8049554:	eb 2e                	jmp    8049584 <rio_readlineb+0xfd>
 8049556:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
 804955a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804955d:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
 8049560:	74 09                	je     804956b <rio_readlineb+0xe4>
 8049562:	eb 81                	jmp    80494e5 <rio_readlineb+0x5e>
 8049564:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 804956b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804956e:	c6 00 00             	movb   $0x0,(%eax)
 8049571:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8049574:	eb 13                	jmp    8049589 <rio_readlineb+0x102>
 8049576:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804957b:	eb 0c                	jmp    8049589 <rio_readlineb+0x102>
 804957d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049582:	eb 05                	jmp    8049589 <rio_readlineb+0x102>
 8049584:	b8 00 00 00 00       	mov    $0x0,%eax
 8049589:	83 c4 4c             	add    $0x4c,%esp
 804958c:	5b                   	pop    %ebx
 804958d:	5e                   	pop    %esi
 804958e:	5f                   	pop    %edi
 804958f:	5d                   	pop    %ebp
 8049590:	c3                   	ret    

08049591 <submitr>:
 8049591:	55                   	push   %ebp
 8049592:	89 e5                	mov    %esp,%ebp
 8049594:	57                   	push   %edi
 8049595:	56                   	push   %esi
 8049596:	53                   	push   %ebx
 8049597:	81 ec 6c a0 00 00    	sub    $0xa06c,%esp
 804959d:	8b 7d 08             	mov    0x8(%ebp),%edi
 80495a0:	8b 75 1c             	mov    0x1c(%ebp),%esi
 80495a3:	c7 85 c8 7f ff ff 00 	movl   $0x0,-0x8038(%ebp)
 80495aa:	00 00 00 
 80495ad:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80495b4:	00 
 80495b5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80495bc:	00 
 80495bd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80495c4:	e8 b7 f3 ff ff       	call   8048980 <socket@plt>
 80495c9:	89 85 b4 5f ff ff    	mov    %eax,-0xa04c(%ebp)
 80495cf:	85 c0                	test   %eax,%eax
 80495d1:	79 51                	jns    8049624 <submitr+0x93>
 80495d3:	8b 45 20             	mov    0x20(%ebp),%eax
 80495d6:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 80495dc:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 80495e3:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 80495ea:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 80495f1:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 80495f8:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 80495ff:	c7 40 18 63 72 65 61 	movl   $0x61657263,0x18(%eax)
 8049606:	c7 40 1c 74 65 20 73 	movl   $0x73206574,0x1c(%eax)
 804960d:	c7 40 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%eax)
 8049614:	66 c7 40 24 74 00    	movw   $0x74,0x24(%eax)
 804961a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804961f:	e9 fc 06 00 00       	jmp    8049d20 <submitr+0x78f>
 8049624:	89 3c 24             	mov    %edi,(%esp)
 8049627:	e8 84 f3 ff ff       	call   80489b0 <gethostbyname@plt>
 804962c:	85 c0                	test   %eax,%eax
 804962e:	75 3f                	jne    804966f <submitr+0xde>
 8049630:	89 7c 24 10          	mov    %edi,0x10(%esp)
 8049634:	c7 44 24 0c d4 a5 04 	movl   $0x804a5d4,0xc(%esp)
 804963b:	08 
 804963c:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 8049643:	ff 
 8049644:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804964b:	00 
 804964c:	8b 45 20             	mov    0x20(%ebp),%eax
 804964f:	89 04 24             	mov    %eax,(%esp)
 8049652:	e8 a9 f3 ff ff       	call   8048a00 <__sprintf_chk@plt>
 8049657:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 804965d:	89 04 24             	mov    %eax,(%esp)
 8049660:	e8 7b f3 ff ff       	call   80489e0 <close@plt>
 8049665:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804966a:	e9 b1 06 00 00       	jmp    8049d20 <submitr+0x78f>
 804966f:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 8049672:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 8049679:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8049680:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8049687:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804968e:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
 8049694:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 804969b:	00 
 804969c:	8b 50 0c             	mov    0xc(%eax),%edx
 804969f:	89 54 24 08          	mov    %edx,0x8(%esp)
 80496a3:	8b 40 10             	mov    0x10(%eax),%eax
 80496a6:	8b 00                	mov    (%eax),%eax
 80496a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80496ac:	8d 45 dc             	lea    -0x24(%ebp),%eax
 80496af:	89 04 24             	mov    %eax,(%esp)
 80496b2:	e8 e9 f1 ff ff       	call   80488a0 <__memmove_chk@plt>
 80496b7:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
 80496bb:	66 c1 c8 08          	ror    $0x8,%ax
 80496bf:	66 89 45 da          	mov    %ax,-0x26(%ebp)
 80496c3:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 80496ca:	00 
 80496cb:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80496cf:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 80496d5:	89 04 24             	mov    %eax,(%esp)
 80496d8:	e8 f3 f2 ff ff       	call   80489d0 <connect@plt>
 80496dd:	85 c0                	test   %eax,%eax
 80496df:	79 3f                	jns    8049720 <submitr+0x18f>
 80496e1:	89 7c 24 10          	mov    %edi,0x10(%esp)
 80496e5:	c7 44 24 0c 00 a6 04 	movl   $0x804a600,0xc(%esp)
 80496ec:	08 
 80496ed:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 80496f4:	ff 
 80496f5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80496fc:	00 
 80496fd:	8b 45 20             	mov    0x20(%ebp),%eax
 8049700:	89 04 24             	mov    %eax,(%esp)
 8049703:	e8 f8 f2 ff ff       	call   8048a00 <__sprintf_chk@plt>
 8049708:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 804970e:	89 04 24             	mov    %eax,(%esp)
 8049711:	e8 ca f2 ff ff       	call   80489e0 <close@plt>
 8049716:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804971b:	e9 00 06 00 00       	jmp    8049d20 <submitr+0x78f>
 8049720:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 8049725:	89 f7                	mov    %esi,%edi
 8049727:	b8 00 00 00 00       	mov    $0x0,%eax
 804972c:	89 d1                	mov    %edx,%ecx
 804972e:	f2 ae                	repnz scas %es:(%edi),%al
 8049730:	f7 d1                	not    %ecx
 8049732:	89 8d b0 5f ff ff    	mov    %ecx,-0xa050(%ebp)
 8049738:	8b 7d 10             	mov    0x10(%ebp),%edi
 804973b:	89 d1                	mov    %edx,%ecx
 804973d:	f2 ae                	repnz scas %es:(%edi),%al
 804973f:	89 8d ac 5f ff ff    	mov    %ecx,-0xa054(%ebp)
 8049745:	8b 7d 14             	mov    0x14(%ebp),%edi
 8049748:	89 d1                	mov    %edx,%ecx
 804974a:	f2 ae                	repnz scas %es:(%edi),%al
 804974c:	89 cb                	mov    %ecx,%ebx
 804974e:	f7 d3                	not    %ebx
 8049750:	8b 7d 18             	mov    0x18(%ebp),%edi
 8049753:	89 d1                	mov    %edx,%ecx
 8049755:	f2 ae                	repnz scas %es:(%edi),%al
 8049757:	2b 9d ac 5f ff ff    	sub    -0xa054(%ebp),%ebx
 804975d:	29 cb                	sub    %ecx,%ebx
 804975f:	8b 8d b0 5f ff ff    	mov    -0xa050(%ebp),%ecx
 8049765:	8d 44 49 fd          	lea    -0x3(%ecx,%ecx,2),%eax
 8049769:	8d 44 03 7b          	lea    0x7b(%ebx,%eax,1),%eax
 804976d:	3d 00 20 00 00       	cmp    $0x2000,%eax
 8049772:	76 7c                	jbe    80497f0 <submitr+0x25f>
 8049774:	8b 45 20             	mov    0x20(%ebp),%eax
 8049777:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 804977d:	c7 40 04 72 3a 20 52 	movl   $0x52203a72,0x4(%eax)
 8049784:	c7 40 08 65 73 75 6c 	movl   $0x6c757365,0x8(%eax)
 804978b:	c7 40 0c 74 20 73 74 	movl   $0x74732074,0xc(%eax)
 8049792:	c7 40 10 72 69 6e 67 	movl   $0x676e6972,0x10(%eax)
 8049799:	c7 40 14 20 74 6f 6f 	movl   $0x6f6f7420,0x14(%eax)
 80497a0:	c7 40 18 20 6c 61 72 	movl   $0x72616c20,0x18(%eax)
 80497a7:	c7 40 1c 67 65 2e 20 	movl   $0x202e6567,0x1c(%eax)
 80497ae:	c7 40 20 49 6e 63 72 	movl   $0x72636e49,0x20(%eax)
 80497b5:	c7 40 24 65 61 73 65 	movl   $0x65736165,0x24(%eax)
 80497bc:	c7 40 28 20 53 55 42 	movl   $0x42555320,0x28(%eax)
 80497c3:	c7 40 2c 4d 49 54 52 	movl   $0x5254494d,0x2c(%eax)
 80497ca:	c7 40 30 5f 4d 41 58 	movl   $0x58414d5f,0x30(%eax)
 80497d1:	c7 40 34 42 55 46 00 	movl   $0x465542,0x34(%eax)
 80497d8:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 80497de:	89 04 24             	mov    %eax,(%esp)
 80497e1:	e8 fa f1 ff ff       	call   80489e0 <close@plt>
 80497e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80497eb:	e9 30 05 00 00       	jmp    8049d20 <submitr+0x78f>
 80497f0:	8d 95 cc 9f ff ff    	lea    -0x6034(%ebp),%edx
 80497f6:	b9 00 08 00 00       	mov    $0x800,%ecx
 80497fb:	b8 00 00 00 00       	mov    $0x0,%eax
 8049800:	89 d7                	mov    %edx,%edi
 8049802:	f3 ab                	rep stos %eax,%es:(%edi)
 8049804:	89 f7                	mov    %esi,%edi
 8049806:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 804980b:	f2 ae                	repnz scas %es:(%edi),%al
 804980d:	f7 d1                	not    %ecx
 804980f:	83 e9 01             	sub    $0x1,%ecx
 8049812:	89 cb                	mov    %ecx,%ebx
 8049814:	0f 84 13 04 00 00    	je     8049c2d <submitr+0x69c>
 804981a:	89 d7                	mov    %edx,%edi
 804981c:	0f b6 06             	movzbl (%esi),%eax
 804981f:	3c 2a                	cmp    $0x2a,%al
 8049821:	74 21                	je     8049844 <submitr+0x2b3>
 8049823:	8d 50 d3             	lea    -0x2d(%eax),%edx
 8049826:	80 fa 01             	cmp    $0x1,%dl
 8049829:	76 19                	jbe    8049844 <submitr+0x2b3>
 804982b:	3c 5f                	cmp    $0x5f,%al
 804982d:	74 15                	je     8049844 <submitr+0x2b3>
 804982f:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049832:	80 fa 09             	cmp    $0x9,%dl
 8049835:	76 0d                	jbe    8049844 <submitr+0x2b3>
 8049837:	89 c2                	mov    %eax,%edx
 8049839:	83 e2 df             	and    $0xffffffdf,%edx
 804983c:	83 ea 41             	sub    $0x41,%edx
 804983f:	80 fa 19             	cmp    $0x19,%dl
 8049842:	77 07                	ja     804984b <submitr+0x2ba>
 8049844:	8d 57 01             	lea    0x1(%edi),%edx
 8049847:	88 07                	mov    %al,(%edi)
 8049849:	eb 69                	jmp    80498b4 <submitr+0x323>
 804984b:	3c 20                	cmp    $0x20,%al
 804984d:	75 08                	jne    8049857 <submitr+0x2c6>
 804984f:	8d 57 01             	lea    0x1(%edi),%edx
 8049852:	c6 07 2b             	movb   $0x2b,(%edi)
 8049855:	eb 5d                	jmp    80498b4 <submitr+0x323>
 8049857:	8d 50 e0             	lea    -0x20(%eax),%edx
 804985a:	80 fa 5f             	cmp    $0x5f,%dl
 804985d:	76 08                	jbe    8049867 <submitr+0x2d6>
 804985f:	3c 09                	cmp    $0x9,%al
 8049861:	0f 85 3b 04 00 00    	jne    8049ca2 <submitr+0x711>
 8049867:	0f b6 c0             	movzbl %al,%eax
 804986a:	89 44 24 10          	mov    %eax,0x10(%esp)
 804986e:	c7 44 24 0c 14 a7 04 	movl   $0x804a714,0xc(%esp)
 8049875:	08 
 8049876:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 804987d:	00 
 804987e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049885:	00 
 8049886:	8d 85 c0 5f ff ff    	lea    -0xa040(%ebp),%eax
 804988c:	89 04 24             	mov    %eax,(%esp)
 804988f:	e8 6c f1 ff ff       	call   8048a00 <__sprintf_chk@plt>
 8049894:	0f b6 85 c0 5f ff ff 	movzbl -0xa040(%ebp),%eax
 804989b:	88 07                	mov    %al,(%edi)
 804989d:	0f b6 85 c1 5f ff ff 	movzbl -0xa03f(%ebp),%eax
 80498a4:	88 47 01             	mov    %al,0x1(%edi)
 80498a7:	8d 57 03             	lea    0x3(%edi),%edx
 80498aa:	0f b6 85 c2 5f ff ff 	movzbl -0xa03e(%ebp),%eax
 80498b1:	88 47 02             	mov    %al,0x2(%edi)
 80498b4:	83 c6 01             	add    $0x1,%esi
 80498b7:	83 eb 01             	sub    $0x1,%ebx
 80498ba:	0f 84 6d 03 00 00    	je     8049c2d <submitr+0x69c>
 80498c0:	89 d7                	mov    %edx,%edi
 80498c2:	e9 55 ff ff ff       	jmp    804981c <submitr+0x28b>
 80498c7:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80498cb:	89 74 24 04          	mov    %esi,0x4(%esp)
 80498cf:	89 3c 24             	mov    %edi,(%esp)
 80498d2:	e8 29 f0 ff ff       	call   8048900 <write@plt>
 80498d7:	85 c0                	test   %eax,%eax
 80498d9:	7f 0f                	jg     80498ea <submitr+0x359>
 80498db:	e8 60 f0 ff ff       	call   8048940 <__errno_location@plt>
 80498e0:	83 38 04             	cmpl   $0x4,(%eax)
 80498e3:	75 15                	jne    80498fa <submitr+0x369>
 80498e5:	b8 00 00 00 00       	mov    $0x0,%eax
 80498ea:	01 c6                	add    %eax,%esi
 80498ec:	29 c3                	sub    %eax,%ebx
 80498ee:	75 d7                	jne    80498c7 <submitr+0x336>
 80498f0:	8b bd b0 5f ff ff    	mov    -0xa050(%ebp),%edi
 80498f6:	85 ff                	test   %edi,%edi
 80498f8:	79 67                	jns    8049961 <submitr+0x3d0>
 80498fa:	8b 45 20             	mov    0x20(%ebp),%eax
 80498fd:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049903:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 804990a:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049911:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049918:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 804991f:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049926:	c7 40 18 77 72 69 74 	movl   $0x74697277,0x18(%eax)
 804992d:	c7 40 1c 65 20 74 6f 	movl   $0x6f742065,0x1c(%eax)
 8049934:	c7 40 20 20 74 68 65 	movl   $0x65687420,0x20(%eax)
 804993b:	c7 40 24 20 73 65 72 	movl   $0x72657320,0x24(%eax)
 8049942:	c7 40 28 76 65 72 00 	movl   $0x726576,0x28(%eax)
 8049949:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 804994f:	89 04 24             	mov    %eax,(%esp)
 8049952:	e8 89 f0 ff ff       	call   80489e0 <close@plt>
 8049957:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804995c:	e9 bf 03 00 00       	jmp    8049d20 <submitr+0x78f>
 8049961:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 8049967:	89 85 cc df ff ff    	mov    %eax,-0x2034(%ebp)
 804996d:	c7 85 d0 df ff ff 00 	movl   $0x0,-0x2030(%ebp)
 8049974:	00 00 00 
 8049977:	8d 85 d8 df ff ff    	lea    -0x2028(%ebp),%eax
 804997d:	89 85 d4 df ff ff    	mov    %eax,-0x202c(%ebp)
 8049983:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049988:	8d 95 cc bf ff ff    	lea    -0x4034(%ebp),%edx
 804998e:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
 8049994:	e8 ee fa ff ff       	call   8049487 <rio_readlineb>
 8049999:	85 c0                	test   %eax,%eax
 804999b:	7f 7b                	jg     8049a18 <submitr+0x487>
 804999d:	8b 45 20             	mov    0x20(%ebp),%eax
 80499a0:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 80499a6:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 80499ad:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 80499b4:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 80499bb:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 80499c2:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 80499c9:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 80499d0:	c7 40 1c 20 66 69 72 	movl   $0x72696620,0x1c(%eax)
 80499d7:	c7 40 20 73 74 20 68 	movl   $0x68207473,0x20(%eax)
 80499de:	c7 40 24 65 61 64 65 	movl   $0x65646165,0x24(%eax)
 80499e5:	c7 40 28 72 20 66 72 	movl   $0x72662072,0x28(%eax)
 80499ec:	c7 40 2c 6f 6d 20 73 	movl   $0x73206d6f,0x2c(%eax)
 80499f3:	c7 40 30 65 72 76 65 	movl   $0x65767265,0x30(%eax)
 80499fa:	66 c7 40 34 72 00    	movw   $0x72,0x34(%eax)
 8049a00:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 8049a06:	89 04 24             	mov    %eax,(%esp)
 8049a09:	e8 d2 ef ff ff       	call   80489e0 <close@plt>
 8049a0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049a13:	e9 08 03 00 00       	jmp    8049d20 <submitr+0x78f>
 8049a18:	8d 85 c8 5f ff ff    	lea    -0xa038(%ebp),%eax
 8049a1e:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049a22:	8d 85 c8 7f ff ff    	lea    -0x8038(%ebp),%eax
 8049a28:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049a2c:	8d 85 cc 7f ff ff    	lea    -0x8034(%ebp),%eax
 8049a32:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049a36:	c7 44 24 04 1b a7 04 	movl   $0x804a71b,0x4(%esp)
 8049a3d:	08 
 8049a3e:	8d 85 cc bf ff ff    	lea    -0x4034(%ebp),%eax
 8049a44:	89 04 24             	mov    %eax,(%esp)
 8049a47:	e8 d4 ee ff ff       	call   8048920 <__isoc99_sscanf@plt>
 8049a4c:	8b 85 c8 7f ff ff    	mov    -0x8038(%ebp),%eax
 8049a52:	8d 9d cc bf ff ff    	lea    -0x4034(%ebp),%ebx
 8049a58:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8049a5d:	0f 84 d1 00 00 00    	je     8049b34 <submitr+0x5a3>
 8049a63:	8d 95 c8 5f ff ff    	lea    -0xa038(%ebp),%edx
 8049a69:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049a6d:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049a71:	c7 44 24 0c 28 a6 04 	movl   $0x804a628,0xc(%esp)
 8049a78:	08 
 8049a79:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 8049a80:	ff 
 8049a81:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049a88:	00 
 8049a89:	8b 45 20             	mov    0x20(%ebp),%eax
 8049a8c:	89 04 24             	mov    %eax,(%esp)
 8049a8f:	e8 6c ef ff ff       	call   8048a00 <__sprintf_chk@plt>
 8049a94:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 8049a9a:	89 04 24             	mov    %eax,(%esp)
 8049a9d:	e8 3e ef ff ff       	call   80489e0 <close@plt>
 8049aa2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049aa7:	e9 74 02 00 00       	jmp    8049d20 <submitr+0x78f>
 8049aac:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049ab1:	89 da                	mov    %ebx,%edx
 8049ab3:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
 8049ab9:	e8 c9 f9 ff ff       	call   8049487 <rio_readlineb>
 8049abe:	85 c0                	test   %eax,%eax
 8049ac0:	7f 72                	jg     8049b34 <submitr+0x5a3>
 8049ac2:	8b 45 20             	mov    0x20(%ebp),%eax
 8049ac5:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049acb:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049ad2:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049ad9:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049ae0:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049ae7:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049aee:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049af5:	c7 40 1c 20 68 65 61 	movl   $0x61656820,0x1c(%eax)
 8049afc:	c7 40 20 64 65 72 73 	movl   $0x73726564,0x20(%eax)
 8049b03:	c7 40 24 20 66 72 6f 	movl   $0x6f726620,0x24(%eax)
 8049b0a:	c7 40 28 6d 20 73 65 	movl   $0x6573206d,0x28(%eax)
 8049b11:	c7 40 2c 72 76 65 72 	movl   $0x72657672,0x2c(%eax)
 8049b18:	c6 40 30 00          	movb   $0x0,0x30(%eax)
 8049b1c:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 8049b22:	89 04 24             	mov    %eax,(%esp)
 8049b25:	e8 b6 ee ff ff       	call   80489e0 <close@plt>
 8049b2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049b2f:	e9 ec 01 00 00       	jmp    8049d20 <submitr+0x78f>
 8049b34:	bf 2c a7 04 08       	mov    $0x804a72c,%edi
 8049b39:	b9 03 00 00 00       	mov    $0x3,%ecx
 8049b3e:	89 de                	mov    %ebx,%esi
 8049b40:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 8049b42:	0f 97 c2             	seta   %dl
 8049b45:	0f 92 c0             	setb   %al
 8049b48:	38 c2                	cmp    %al,%dl
 8049b4a:	0f 85 5c ff ff ff    	jne    8049aac <submitr+0x51b>
 8049b50:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049b55:	8d 95 cc bf ff ff    	lea    -0x4034(%ebp),%edx
 8049b5b:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
 8049b61:	e8 21 f9 ff ff       	call   8049487 <rio_readlineb>
 8049b66:	85 c0                	test   %eax,%eax
 8049b68:	7f 7c                	jg     8049be6 <submitr+0x655>
 8049b6a:	8b 45 20             	mov    0x20(%ebp),%eax
 8049b6d:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049b73:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049b7a:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049b81:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049b88:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049b8f:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049b96:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049b9d:	c7 40 1c 20 73 74 61 	movl   $0x61747320,0x1c(%eax)
 8049ba4:	c7 40 20 74 75 73 20 	movl   $0x20737574,0x20(%eax)
 8049bab:	c7 40 24 6d 65 73 73 	movl   $0x7373656d,0x24(%eax)
 8049bb2:	c7 40 28 61 67 65 20 	movl   $0x20656761,0x28(%eax)
 8049bb9:	c7 40 2c 66 72 6f 6d 	movl   $0x6d6f7266,0x2c(%eax)
 8049bc0:	c7 40 30 20 73 65 72 	movl   $0x72657320,0x30(%eax)
 8049bc7:	c7 40 34 76 65 72 00 	movl   $0x726576,0x34(%eax)
 8049bce:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 8049bd4:	89 04 24             	mov    %eax,(%esp)
 8049bd7:	e8 04 ee ff ff       	call   80489e0 <close@plt>
 8049bdc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049be1:	e9 3a 01 00 00       	jmp    8049d20 <submitr+0x78f>
 8049be6:	8d 85 cc bf ff ff    	lea    -0x4034(%ebp),%eax
 8049bec:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bf0:	8b 45 20             	mov    0x20(%ebp),%eax
 8049bf3:	89 04 24             	mov    %eax,(%esp)
 8049bf6:	e8 65 ec ff ff       	call   8048860 <strcpy@plt>
 8049bfb:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 8049c01:	89 04 24             	mov    %eax,(%esp)
 8049c04:	e8 d7 ed ff ff       	call   80489e0 <close@plt>
 8049c09:	bf 2f a7 04 08       	mov    $0x804a72f,%edi
 8049c0e:	b9 03 00 00 00       	mov    $0x3,%ecx
 8049c13:	8b 75 20             	mov    0x20(%ebp),%esi
 8049c16:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
 8049c18:	0f 97 c2             	seta   %dl
 8049c1b:	0f 92 c0             	setb   %al
 8049c1e:	38 c2                	cmp    %al,%dl
 8049c20:	0f 95 c0             	setne  %al
 8049c23:	0f b6 c0             	movzbl %al,%eax
 8049c26:	f7 d8                	neg    %eax
 8049c28:	e9 f3 00 00 00       	jmp    8049d20 <submitr+0x78f>
 8049c2d:	8d 85 cc 9f ff ff    	lea    -0x6034(%ebp),%eax
 8049c33:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8049c37:	8b 45 18             	mov    0x18(%ebp),%eax
 8049c3a:	89 44 24 18          	mov    %eax,0x18(%esp)
 8049c3e:	8b 45 14             	mov    0x14(%ebp),%eax
 8049c41:	89 44 24 14          	mov    %eax,0x14(%esp)
 8049c45:	8b 45 10             	mov    0x10(%ebp),%eax
 8049c48:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049c4c:	c7 44 24 0c 58 a6 04 	movl   $0x804a658,0xc(%esp)
 8049c53:	08 
 8049c54:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 8049c5b:	00 
 8049c5c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049c63:	00 
 8049c64:	8d bd cc bf ff ff    	lea    -0x4034(%ebp),%edi
 8049c6a:	89 3c 24             	mov    %edi,(%esp)
 8049c6d:	e8 8e ed ff ff       	call   8048a00 <__sprintf_chk@plt>
 8049c72:	b8 00 00 00 00       	mov    $0x0,%eax
 8049c77:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049c7c:	f2 ae                	repnz scas %es:(%edi),%al
 8049c7e:	f7 d1                	not    %ecx
 8049c80:	83 e9 01             	sub    $0x1,%ecx
 8049c83:	0f 84 d8 fc ff ff    	je     8049961 <submitr+0x3d0>
 8049c89:	89 cb                	mov    %ecx,%ebx
 8049c8b:	8d b5 cc bf ff ff    	lea    -0x4034(%ebp),%esi
 8049c91:	89 8d b0 5f ff ff    	mov    %ecx,-0xa050(%ebp)
 8049c97:	8b bd b4 5f ff ff    	mov    -0xa04c(%ebp),%edi
 8049c9d:	e9 25 fc ff ff       	jmp    80498c7 <submitr+0x336>
 8049ca2:	8b 7d 20             	mov    0x20(%ebp),%edi
 8049ca5:	be a4 a6 04 08       	mov    $0x804a6a4,%esi
 8049caa:	b8 43 00 00 00       	mov    $0x43,%eax
 8049caf:	f7 c7 01 00 00 00    	test   $0x1,%edi
 8049cb5:	74 19                	je     8049cd0 <submitr+0x73f>
 8049cb7:	0f b6 05 a4 a6 04 08 	movzbl 0x804a6a4,%eax
 8049cbe:	88 07                	mov    %al,(%edi)
 8049cc0:	8b 45 20             	mov    0x20(%ebp),%eax
 8049cc3:	8d 78 01             	lea    0x1(%eax),%edi
 8049cc6:	be a5 a6 04 08       	mov    $0x804a6a5,%esi
 8049ccb:	b8 42 00 00 00       	mov    $0x42,%eax
 8049cd0:	f7 c7 02 00 00 00    	test   $0x2,%edi
 8049cd6:	74 0f                	je     8049ce7 <submitr+0x756>
 8049cd8:	0f b7 16             	movzwl (%esi),%edx
 8049cdb:	66 89 17             	mov    %dx,(%edi)
 8049cde:	83 c7 02             	add    $0x2,%edi
 8049ce1:	83 c6 02             	add    $0x2,%esi
 8049ce4:	83 e8 02             	sub    $0x2,%eax
 8049ce7:	89 c1                	mov    %eax,%ecx
 8049ce9:	c1 e9 02             	shr    $0x2,%ecx
 8049cec:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049cee:	ba 00 00 00 00       	mov    $0x0,%edx
 8049cf3:	a8 02                	test   $0x2,%al
 8049cf5:	74 0b                	je     8049d02 <submitr+0x771>
 8049cf7:	0f b7 16             	movzwl (%esi),%edx
 8049cfa:	66 89 17             	mov    %dx,(%edi)
 8049cfd:	ba 02 00 00 00       	mov    $0x2,%edx
 8049d02:	a8 01                	test   $0x1,%al
 8049d04:	74 07                	je     8049d0d <submitr+0x77c>
 8049d06:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 8049d0a:	88 04 17             	mov    %al,(%edi,%edx,1)
 8049d0d:	8b 85 b4 5f ff ff    	mov    -0xa04c(%ebp),%eax
 8049d13:	89 04 24             	mov    %eax,(%esp)
 8049d16:	e8 c5 ec ff ff       	call   80489e0 <close@plt>
 8049d1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049d20:	81 c4 6c a0 00 00    	add    $0xa06c,%esp
 8049d26:	5b                   	pop    %ebx
 8049d27:	5e                   	pop    %esi
 8049d28:	5f                   	pop    %edi
 8049d29:	5d                   	pop    %ebp
 8049d2a:	c3                   	ret    

08049d2b <init_timeout>:
 8049d2b:	55                   	push   %ebp
 8049d2c:	89 e5                	mov    %esp,%ebp
 8049d2e:	53                   	push   %ebx
 8049d2f:	83 ec 14             	sub    $0x14,%esp
 8049d32:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8049d35:	85 db                	test   %ebx,%ebx
 8049d37:	74 26                	je     8049d5f <init_timeout+0x34>
 8049d39:	85 db                	test   %ebx,%ebx
 8049d3b:	b8 05 00 00 00       	mov    $0x5,%eax
 8049d40:	0f 48 d8             	cmovs  %eax,%ebx
 8049d43:	c7 44 24 04 50 94 04 	movl   $0x8049450,0x4(%esp)
 8049d4a:	08 
 8049d4b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 8049d52:	e8 c9 ea ff ff       	call   8048820 <signal@plt>
 8049d57:	89 1c 24             	mov    %ebx,(%esp)
 8049d5a:	e8 d1 ea ff ff       	call   8048830 <alarm@plt>
 8049d5f:	83 c4 14             	add    $0x14,%esp
 8049d62:	5b                   	pop    %ebx
 8049d63:	5d                   	pop    %ebp
 8049d64:	c3                   	ret    

08049d65 <init_driver>:
 8049d65:	55                   	push   %ebp
 8049d66:	89 e5                	mov    %esp,%ebp
 8049d68:	57                   	push   %edi
 8049d69:	56                   	push   %esi
 8049d6a:	53                   	push   %ebx
 8049d6b:	83 ec 3c             	sub    $0x3c,%esp
 8049d6e:	8b 75 08             	mov    0x8(%ebp),%esi
 8049d71:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049d78:	00 
 8049d79:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 8049d80:	e8 9b ea ff ff       	call   8048820 <signal@plt>
 8049d85:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049d8c:	00 
 8049d8d:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 8049d94:	e8 87 ea ff ff       	call   8048820 <signal@plt>
 8049d99:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049da0:	00 
 8049da1:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 8049da8:	e8 73 ea ff ff       	call   8048820 <signal@plt>
 8049dad:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049db4:	00 
 8049db5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049dbc:	00 
 8049dbd:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049dc4:	e8 b7 eb ff ff       	call   8048980 <socket@plt>
 8049dc9:	89 c3                	mov    %eax,%ebx
 8049dcb:	85 c0                	test   %eax,%eax
 8049dcd:	79 4e                	jns    8049e1d <init_driver+0xb8>
 8049dcf:	c7 06 45 72 72 6f    	movl   $0x6f727245,(%esi)
 8049dd5:	c7 46 04 72 3a 20 43 	movl   $0x43203a72,0x4(%esi)
 8049ddc:	c7 46 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%esi)
 8049de3:	c7 46 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%esi)
 8049dea:	c7 46 10 61 62 6c 65 	movl   $0x656c6261,0x10(%esi)
 8049df1:	c7 46 14 20 74 6f 20 	movl   $0x206f7420,0x14(%esi)
 8049df8:	c7 46 18 63 72 65 61 	movl   $0x61657263,0x18(%esi)
 8049dff:	c7 46 1c 74 65 20 73 	movl   $0x73206574,0x1c(%esi)
 8049e06:	c7 46 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%esi)
 8049e0d:	66 c7 46 24 74 00    	movw   $0x74,0x24(%esi)
 8049e13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049e18:	e9 05 01 00 00       	jmp    8049f22 <init_driver+0x1bd>
 8049e1d:	c7 04 24 97 a5 04 08 	movl   $0x804a597,(%esp)
 8049e24:	e8 87 eb ff ff       	call   80489b0 <gethostbyname@plt>
 8049e29:	85 c0                	test   %eax,%eax
 8049e2b:	75 3a                	jne    8049e67 <init_driver+0x102>
 8049e2d:	c7 44 24 10 97 a5 04 	movl   $0x804a597,0x10(%esp)
 8049e34:	08 
 8049e35:	c7 44 24 0c d4 a5 04 	movl   $0x804a5d4,0xc(%esp)
 8049e3c:	08 
 8049e3d:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 8049e44:	ff 
 8049e45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049e4c:	00 
 8049e4d:	89 34 24             	mov    %esi,(%esp)
 8049e50:	e8 ab eb ff ff       	call   8048a00 <__sprintf_chk@plt>
 8049e55:	89 1c 24             	mov    %ebx,(%esp)
 8049e58:	e8 83 eb ff ff       	call   80489e0 <close@plt>
 8049e5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049e62:	e9 bb 00 00 00       	jmp    8049f22 <init_driver+0x1bd>
 8049e67:	8d 7d d8             	lea    -0x28(%ebp),%edi
 8049e6a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 8049e71:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8049e78:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8049e7f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 8049e86:	66 c7 45 d8 02 00    	movw   $0x2,-0x28(%ebp)
 8049e8c:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 8049e93:	00 
 8049e94:	8b 50 0c             	mov    0xc(%eax),%edx
 8049e97:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049e9b:	8b 40 10             	mov    0x10(%eax),%eax
 8049e9e:	8b 00                	mov    (%eax),%eax
 8049ea0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ea4:	8d 45 dc             	lea    -0x24(%ebp),%eax
 8049ea7:	89 04 24             	mov    %eax,(%esp)
 8049eaa:	e8 f1 e9 ff ff       	call   80488a0 <__memmove_chk@plt>
 8049eaf:	66 c7 45 da fb 42    	movw   $0x42fb,-0x26(%ebp)
 8049eb5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8049ebc:	00 
 8049ebd:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049ec1:	89 1c 24             	mov    %ebx,(%esp)
 8049ec4:	e8 07 eb ff ff       	call   80489d0 <connect@plt>
 8049ec9:	85 c0                	test   %eax,%eax
 8049ecb:	79 3f                	jns    8049f0c <init_driver+0x1a7>
 8049ecd:	c7 44 24 14 42 fb 00 	movl   $0xfb42,0x14(%esp)
 8049ed4:	00 
 8049ed5:	c7 44 24 10 97 a5 04 	movl   $0x804a597,0x10(%esp)
 8049edc:	08 
 8049edd:	c7 44 24 0c e8 a6 04 	movl   $0x804a6e8,0xc(%esp)
 8049ee4:	08 
 8049ee5:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 8049eec:	ff 
 8049eed:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049ef4:	00 
 8049ef5:	89 34 24             	mov    %esi,(%esp)
 8049ef8:	e8 03 eb ff ff       	call   8048a00 <__sprintf_chk@plt>
 8049efd:	89 1c 24             	mov    %ebx,(%esp)
 8049f00:	e8 db ea ff ff       	call   80489e0 <close@plt>
 8049f05:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049f0a:	eb 16                	jmp    8049f22 <init_driver+0x1bd>
 8049f0c:	89 1c 24             	mov    %ebx,(%esp)
 8049f0f:	e8 cc ea ff ff       	call   80489e0 <close@plt>
 8049f14:	66 c7 06 4f 4b       	movw   $0x4b4f,(%esi)
 8049f19:	c6 46 02 00          	movb   $0x0,0x2(%esi)
 8049f1d:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f22:	83 c4 3c             	add    $0x3c,%esp
 8049f25:	5b                   	pop    %ebx
 8049f26:	5e                   	pop    %esi
 8049f27:	5f                   	pop    %edi
 8049f28:	5d                   	pop    %ebp
 8049f29:	c3                   	ret    

08049f2a <driver_post>:
 8049f2a:	55                   	push   %ebp
 8049f2b:	89 e5                	mov    %esp,%ebp
 8049f2d:	53                   	push   %ebx
 8049f2e:	83 ec 24             	sub    $0x24,%esp
 8049f31:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f34:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8049f37:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049f3b:	74 2b                	je     8049f68 <driver_post+0x3e>
 8049f3d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049f40:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049f44:	c7 44 24 04 32 a7 04 	movl   $0x804a732,0x4(%esp)
 8049f4b:	08 
 8049f4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049f53:	e8 08 ea ff ff       	call   8048960 <__printf_chk@plt>
 8049f58:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 8049f5d:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 8049f61:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f66:	eb 4c                	jmp    8049fb4 <driver_post+0x8a>
 8049f68:	85 c0                	test   %eax,%eax
 8049f6a:	74 3a                	je     8049fa6 <driver_post+0x7c>
 8049f6c:	80 38 00             	cmpb   $0x0,(%eax)
 8049f6f:	74 35                	je     8049fa6 <driver_post+0x7c>
 8049f71:	89 5c 24 18          	mov    %ebx,0x18(%esp)
 8049f75:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049f78:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049f7c:	c7 44 24 10 49 a7 04 	movl   $0x804a749,0x10(%esp)
 8049f83:	08 
 8049f84:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049f88:	c7 44 24 08 50 a7 04 	movl   $0x804a750,0x8(%esp)
 8049f8f:	08 
 8049f90:	c7 44 24 04 42 fb 00 	movl   $0xfb42,0x4(%esp)
 8049f97:	00 
 8049f98:	c7 04 24 97 a5 04 08 	movl   $0x804a597,(%esp)
 8049f9f:	e8 ed f5 ff ff       	call   8049591 <submitr>
 8049fa4:	eb 0e                	jmp    8049fb4 <driver_post+0x8a>
 8049fa6:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 8049fab:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 8049faf:	b8 00 00 00 00       	mov    $0x0,%eax
 8049fb4:	83 c4 24             	add    $0x24,%esp
 8049fb7:	5b                   	pop    %ebx
 8049fb8:	5d                   	pop    %ebp
 8049fb9:	c3                   	ret    

08049fba <hash>:
 8049fba:	55                   	push   %ebp
 8049fbb:	89 e5                	mov    %esp,%ebp
 8049fbd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049fc0:	0f b6 11             	movzbl (%ecx),%edx
 8049fc3:	84 d2                	test   %dl,%dl
 8049fc5:	74 19                	je     8049fe0 <hash+0x26>
 8049fc7:	b8 00 00 00 00       	mov    $0x0,%eax
 8049fcc:	6b c0 67             	imul   $0x67,%eax,%eax
 8049fcf:	83 c1 01             	add    $0x1,%ecx
 8049fd2:	0f be d2             	movsbl %dl,%edx
 8049fd5:	01 d0                	add    %edx,%eax
 8049fd7:	0f b6 11             	movzbl (%ecx),%edx
 8049fda:	84 d2                	test   %dl,%dl
 8049fdc:	75 ee                	jne    8049fcc <hash+0x12>
 8049fde:	eb 05                	jmp    8049fe5 <hash+0x2b>
 8049fe0:	b8 00 00 00 00       	mov    $0x0,%eax
 8049fe5:	5d                   	pop    %ebp
 8049fe6:	c3                   	ret    

08049fe7 <check>:
 8049fe7:	55                   	push   %ebp
 8049fe8:	89 e5                	mov    %esp,%ebp
 8049fea:	8b 55 08             	mov    0x8(%ebp),%edx
 8049fed:	89 d1                	mov    %edx,%ecx
 8049fef:	c1 e9 1c             	shr    $0x1c,%ecx
 8049ff2:	b8 00 00 00 00       	mov    $0x0,%eax
 8049ff7:	85 c9                	test   %ecx,%ecx
 8049ff9:	74 2f                	je     804a02a <check+0x43>
 8049ffb:	80 fa 0a             	cmp    $0xa,%dl
 8049ffe:	74 17                	je     804a017 <check+0x30>
 804a000:	b9 08 00 00 00       	mov    $0x8,%ecx
 804a005:	89 d0                	mov    %edx,%eax
 804a007:	d3 e8                	shr    %cl,%eax
 804a009:	3c 0a                	cmp    $0xa,%al
 804a00b:	74 11                	je     804a01e <check+0x37>
 804a00d:	83 c1 08             	add    $0x8,%ecx
 804a010:	83 f9 20             	cmp    $0x20,%ecx
 804a013:	75 f0                	jne    804a005 <check+0x1e>
 804a015:	eb 0e                	jmp    804a025 <check+0x3e>
 804a017:	b8 00 00 00 00       	mov    $0x0,%eax
 804a01c:	eb 0c                	jmp    804a02a <check+0x43>
 804a01e:	b8 00 00 00 00       	mov    $0x0,%eax
 804a023:	eb 05                	jmp    804a02a <check+0x43>
 804a025:	b8 01 00 00 00       	mov    $0x1,%eax
 804a02a:	5d                   	pop    %ebp
 804a02b:	c3                   	ret    

0804a02c <gencookie>:
 804a02c:	55                   	push   %ebp
 804a02d:	89 e5                	mov    %esp,%ebp
 804a02f:	53                   	push   %ebx
 804a030:	83 ec 14             	sub    $0x14,%esp
 804a033:	8b 45 08             	mov    0x8(%ebp),%eax
 804a036:	89 04 24             	mov    %eax,(%esp)
 804a039:	e8 7c ff ff ff       	call   8049fba <hash>
 804a03e:	89 04 24             	mov    %eax,(%esp)
 804a041:	e8 8a e8 ff ff       	call   80488d0 <srand@plt>
 804a046:	e8 05 e9 ff ff       	call   8048950 <rand@plt>
 804a04b:	89 c3                	mov    %eax,%ebx
 804a04d:	89 04 24             	mov    %eax,(%esp)
 804a050:	e8 92 ff ff ff       	call   8049fe7 <check>
 804a055:	85 c0                	test   %eax,%eax
 804a057:	74 ed                	je     804a046 <gencookie+0x1a>
 804a059:	89 d8                	mov    %ebx,%eax
 804a05b:	83 c4 14             	add    $0x14,%esp
 804a05e:	5b                   	pop    %ebx
 804a05f:	5d                   	pop    %ebp
 804a060:	c3                   	ret    
 804a061:	66 90                	xchg   %ax,%ax
 804a063:	66 90                	xchg   %ax,%ax
 804a065:	66 90                	xchg   %ax,%ax
 804a067:	66 90                	xchg   %ax,%ax
 804a069:	66 90                	xchg   %ax,%ax
 804a06b:	66 90                	xchg   %ax,%ax
 804a06d:	66 90                	xchg   %ax,%ax
 804a06f:	90                   	nop

0804a070 <__libc_csu_init>:
 804a070:	55                   	push   %ebp
 804a071:	57                   	push   %edi
 804a072:	56                   	push   %esi
 804a073:	53                   	push   %ebx
 804a074:	e8 f7 e9 ff ff       	call   8048a70 <__x86.get_pc_thunk.bx>
 804a079:	81 c3 87 1f 00 00    	add    $0x1f87,%ebx
 804a07f:	83 ec 0c             	sub    $0xc,%esp
 804a082:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 804a086:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 804a08c:	e8 27 e7 ff ff       	call   80487b8 <_init>
 804a091:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 804a097:	29 c6                	sub    %eax,%esi
 804a099:	c1 fe 02             	sar    $0x2,%esi
 804a09c:	85 f6                	test   %esi,%esi
 804a09e:	74 25                	je     804a0c5 <__libc_csu_init+0x55>
 804a0a0:	31 ff                	xor    %edi,%edi
 804a0a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a0a8:	83 ec 04             	sub    $0x4,%esp
 804a0ab:	55                   	push   %ebp
 804a0ac:	ff 74 24 2c          	pushl  0x2c(%esp)
 804a0b0:	ff 74 24 2c          	pushl  0x2c(%esp)
 804a0b4:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804a0bb:	83 c7 01             	add    $0x1,%edi
 804a0be:	83 c4 10             	add    $0x10,%esp
 804a0c1:	39 fe                	cmp    %edi,%esi
 804a0c3:	75 e3                	jne    804a0a8 <__libc_csu_init+0x38>
 804a0c5:	83 c4 0c             	add    $0xc,%esp
 804a0c8:	5b                   	pop    %ebx
 804a0c9:	5e                   	pop    %esi
 804a0ca:	5f                   	pop    %edi
 804a0cb:	5d                   	pop    %ebp
 804a0cc:	c3                   	ret    
 804a0cd:	8d 76 00             	lea    0x0(%esi),%esi

0804a0d0 <__libc_csu_fini>:
 804a0d0:	f3 c3                	repz ret 

Disassembly of section .fini:

0804a0d4 <_fini>:
 804a0d4:	53                   	push   %ebx
 804a0d5:	83 ec 08             	sub    $0x8,%esp
 804a0d8:	e8 93 e9 ff ff       	call   8048a70 <__x86.get_pc_thunk.bx>
 804a0dd:	81 c3 23 1f 00 00    	add    $0x1f23,%ebx
 804a0e3:	83 c4 08             	add    $0x8,%esp
 804a0e6:	5b                   	pop    %ebx
 804a0e7:	c3                   	ret    
