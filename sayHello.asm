
_sayHello:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
   printf(1, "hello world!\n");
   9:	c7 44 24 04 d6 07 00 	movl   $0x7d6,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 ed 03 00 00       	call   40a <printf>
   exit();
  1d:	e8 68 02 00 00       	call   28a <exit>

00000022 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  22:	55                   	push   %ebp
  23:	89 e5                	mov    %esp,%ebp
  25:	57                   	push   %edi
  26:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  27:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2a:	8b 55 10             	mov    0x10(%ebp),%edx
  2d:	8b 45 0c             	mov    0xc(%ebp),%eax
  30:	89 cb                	mov    %ecx,%ebx
  32:	89 df                	mov    %ebx,%edi
  34:	89 d1                	mov    %edx,%ecx
  36:	fc                   	cld    
  37:	f3 aa                	rep stos %al,%es:(%edi)
  39:	89 ca                	mov    %ecx,%edx
  3b:	89 fb                	mov    %edi,%ebx
  3d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  40:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  43:	5b                   	pop    %ebx
  44:	5f                   	pop    %edi
  45:	5d                   	pop    %ebp
  46:	c3                   	ret    

00000047 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  47:	55                   	push   %ebp
  48:	89 e5                	mov    %esp,%ebp
  4a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4d:	8b 45 08             	mov    0x8(%ebp),%eax
  50:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  53:	90                   	nop
  54:	8b 45 08             	mov    0x8(%ebp),%eax
  57:	8d 50 01             	lea    0x1(%eax),%edx
  5a:	89 55 08             	mov    %edx,0x8(%ebp)
  5d:	8b 55 0c             	mov    0xc(%ebp),%edx
  60:	8d 4a 01             	lea    0x1(%edx),%ecx
  63:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  66:	0f b6 12             	movzbl (%edx),%edx
  69:	88 10                	mov    %dl,(%eax)
  6b:	0f b6 00             	movzbl (%eax),%eax
  6e:	84 c0                	test   %al,%al
  70:	75 e2                	jne    54 <strcpy+0xd>
    ;
  return os;
  72:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  75:	c9                   	leave  
  76:	c3                   	ret    

00000077 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  77:	55                   	push   %ebp
  78:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7a:	eb 08                	jmp    84 <strcmp+0xd>
    p++, q++;
  7c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  80:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  84:	8b 45 08             	mov    0x8(%ebp),%eax
  87:	0f b6 00             	movzbl (%eax),%eax
  8a:	84 c0                	test   %al,%al
  8c:	74 10                	je     9e <strcmp+0x27>
  8e:	8b 45 08             	mov    0x8(%ebp),%eax
  91:	0f b6 10             	movzbl (%eax),%edx
  94:	8b 45 0c             	mov    0xc(%ebp),%eax
  97:	0f b6 00             	movzbl (%eax),%eax
  9a:	38 c2                	cmp    %al,%dl
  9c:	74 de                	je     7c <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	0f b6 00             	movzbl (%eax),%eax
  a4:	0f b6 d0             	movzbl %al,%edx
  a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  aa:	0f b6 00             	movzbl (%eax),%eax
  ad:	0f b6 c0             	movzbl %al,%eax
  b0:	29 c2                	sub    %eax,%edx
  b2:	89 d0                	mov    %edx,%eax
}
  b4:	5d                   	pop    %ebp
  b5:	c3                   	ret    

000000b6 <strlen>:

uint
strlen(const char *s)
{
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c3:	eb 04                	jmp    c9 <strlen+0x13>
  c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cc:	8b 45 08             	mov    0x8(%ebp),%eax
  cf:	01 d0                	add    %edx,%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	84 c0                	test   %al,%al
  d6:	75 ed                	jne    c5 <strlen+0xf>
    ;
  return n;
  d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  db:	c9                   	leave  
  dc:	c3                   	ret    

000000dd <memset>:

void*
memset(void *dst, int c, uint n)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e3:	8b 45 10             	mov    0x10(%ebp),%eax
  e6:	89 44 24 08          	mov    %eax,0x8(%esp)
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	89 04 24             	mov    %eax,(%esp)
  f7:	e8 26 ff ff ff       	call   22 <stosb>
  return dst;
  fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ff:	c9                   	leave  
 100:	c3                   	ret    

00000101 <strchr>:

char*
strchr(const char *s, char c)
{
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	83 ec 04             	sub    $0x4,%esp
 107:	8b 45 0c             	mov    0xc(%ebp),%eax
 10a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10d:	eb 14                	jmp    123 <strchr+0x22>
    if(*s == c)
 10f:	8b 45 08             	mov    0x8(%ebp),%eax
 112:	0f b6 00             	movzbl (%eax),%eax
 115:	3a 45 fc             	cmp    -0x4(%ebp),%al
 118:	75 05                	jne    11f <strchr+0x1e>
      return (char*)s;
 11a:	8b 45 08             	mov    0x8(%ebp),%eax
 11d:	eb 13                	jmp    132 <strchr+0x31>
  for(; *s; s++)
 11f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	0f b6 00             	movzbl (%eax),%eax
 129:	84 c0                	test   %al,%al
 12b:	75 e2                	jne    10f <strchr+0xe>
  return 0;
 12d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <gets>:

char*
gets(char *buf, int max)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 141:	eb 4c                	jmp    18f <gets+0x5b>
    cc = read(0, &c, 1);
 143:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14a:	00 
 14b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14e:	89 44 24 04          	mov    %eax,0x4(%esp)
 152:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 159:	e8 44 01 00 00       	call   2a2 <read>
 15e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 161:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 165:	7f 02                	jg     169 <gets+0x35>
      break;
 167:	eb 31                	jmp    19a <gets+0x66>
    buf[i++] = c;
 169:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16c:	8d 50 01             	lea    0x1(%eax),%edx
 16f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 172:	89 c2                	mov    %eax,%edx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	01 c2                	add    %eax,%edx
 179:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 17f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 183:	3c 0a                	cmp    $0xa,%al
 185:	74 13                	je     19a <gets+0x66>
 187:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18b:	3c 0d                	cmp    $0xd,%al
 18d:	74 0b                	je     19a <gets+0x66>
  for(i=0; i+1 < max; ){
 18f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 192:	83 c0 01             	add    $0x1,%eax
 195:	3b 45 0c             	cmp    0xc(%ebp),%eax
 198:	7c a9                	jl     143 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 19a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	01 d0                	add    %edx,%eax
 1a2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a8:	c9                   	leave  
 1a9:	c3                   	ret    

000001aa <stat>:

int
stat(const char *n, struct stat *st)
{
 1aa:	55                   	push   %ebp
 1ab:	89 e5                	mov    %esp,%ebp
 1ad:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b7:	00 
 1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 1bb:	89 04 24             	mov    %eax,(%esp)
 1be:	e8 07 01 00 00       	call   2ca <open>
 1c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ca:	79 07                	jns    1d3 <stat+0x29>
    return -1;
 1cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d1:	eb 23                	jmp    1f6 <stat+0x4c>
  r = fstat(fd, st);
 1d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dd:	89 04 24             	mov    %eax,(%esp)
 1e0:	e8 fd 00 00 00       	call   2e2 <fstat>
 1e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1eb:	89 04 24             	mov    %eax,(%esp)
 1ee:	e8 bf 00 00 00       	call   2b2 <close>
  return r;
 1f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f6:	c9                   	leave  
 1f7:	c3                   	ret    

000001f8 <atoi>:

int
atoi(const char *s)
{
 1f8:	55                   	push   %ebp
 1f9:	89 e5                	mov    %esp,%ebp
 1fb:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1fe:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 205:	eb 25                	jmp    22c <atoi+0x34>
    n = n*10 + *s++ - '0';
 207:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20a:	89 d0                	mov    %edx,%eax
 20c:	c1 e0 02             	shl    $0x2,%eax
 20f:	01 d0                	add    %edx,%eax
 211:	01 c0                	add    %eax,%eax
 213:	89 c1                	mov    %eax,%ecx
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	8d 50 01             	lea    0x1(%eax),%edx
 21b:	89 55 08             	mov    %edx,0x8(%ebp)
 21e:	0f b6 00             	movzbl (%eax),%eax
 221:	0f be c0             	movsbl %al,%eax
 224:	01 c8                	add    %ecx,%eax
 226:	83 e8 30             	sub    $0x30,%eax
 229:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 22c:	8b 45 08             	mov    0x8(%ebp),%eax
 22f:	0f b6 00             	movzbl (%eax),%eax
 232:	3c 2f                	cmp    $0x2f,%al
 234:	7e 0a                	jle    240 <atoi+0x48>
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	3c 39                	cmp    $0x39,%al
 23e:	7e c7                	jle    207 <atoi+0xf>
  return n;
 240:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 243:	c9                   	leave  
 244:	c3                   	ret    

00000245 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 245:	55                   	push   %ebp
 246:	89 e5                	mov    %esp,%ebp
 248:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 24b:	8b 45 08             	mov    0x8(%ebp),%eax
 24e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 251:	8b 45 0c             	mov    0xc(%ebp),%eax
 254:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 257:	eb 17                	jmp    270 <memmove+0x2b>
    *dst++ = *src++;
 259:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25c:	8d 50 01             	lea    0x1(%eax),%edx
 25f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 262:	8b 55 f8             	mov    -0x8(%ebp),%edx
 265:	8d 4a 01             	lea    0x1(%edx),%ecx
 268:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26b:	0f b6 12             	movzbl (%edx),%edx
 26e:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 270:	8b 45 10             	mov    0x10(%ebp),%eax
 273:	8d 50 ff             	lea    -0x1(%eax),%edx
 276:	89 55 10             	mov    %edx,0x10(%ebp)
 279:	85 c0                	test   %eax,%eax
 27b:	7f dc                	jg     259 <memmove+0x14>
  return vdst;
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 280:	c9                   	leave  
 281:	c3                   	ret    

00000282 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 282:	b8 01 00 00 00       	mov    $0x1,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <exit>:
SYSCALL(exit)
 28a:	b8 02 00 00 00       	mov    $0x2,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <wait>:
SYSCALL(wait)
 292:	b8 03 00 00 00       	mov    $0x3,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <pipe>:
SYSCALL(pipe)
 29a:	b8 04 00 00 00       	mov    $0x4,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <read>:
SYSCALL(read)
 2a2:	b8 05 00 00 00       	mov    $0x5,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <write>:
SYSCALL(write)
 2aa:	b8 10 00 00 00       	mov    $0x10,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <close>:
SYSCALL(close)
 2b2:	b8 15 00 00 00       	mov    $0x15,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <kill>:
SYSCALL(kill)
 2ba:	b8 06 00 00 00       	mov    $0x6,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <exec>:
SYSCALL(exec)
 2c2:	b8 07 00 00 00       	mov    $0x7,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <open>:
SYSCALL(open)
 2ca:	b8 0f 00 00 00       	mov    $0xf,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <mknod>:
SYSCALL(mknod)
 2d2:	b8 11 00 00 00       	mov    $0x11,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <unlink>:
SYSCALL(unlink)
 2da:	b8 12 00 00 00       	mov    $0x12,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <fstat>:
SYSCALL(fstat)
 2e2:	b8 08 00 00 00       	mov    $0x8,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <link>:
SYSCALL(link)
 2ea:	b8 13 00 00 00       	mov    $0x13,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <mkdir>:
SYSCALL(mkdir)
 2f2:	b8 14 00 00 00       	mov    $0x14,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <chdir>:
SYSCALL(chdir)
 2fa:	b8 09 00 00 00       	mov    $0x9,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <dup>:
SYSCALL(dup)
 302:	b8 0a 00 00 00       	mov    $0xa,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <getpid>:
SYSCALL(getpid)
 30a:	b8 0b 00 00 00       	mov    $0xb,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <sbrk>:
SYSCALL(sbrk)
 312:	b8 0c 00 00 00       	mov    $0xc,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <sleep>:
SYSCALL(sleep)
 31a:	b8 0d 00 00 00       	mov    $0xd,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <uptime>:
SYSCALL(uptime)
 322:	b8 0e 00 00 00       	mov    $0xe,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 32a:	55                   	push   %ebp
 32b:	89 e5                	mov    %esp,%ebp
 32d:	83 ec 18             	sub    $0x18,%esp
 330:	8b 45 0c             	mov    0xc(%ebp),%eax
 333:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 336:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 33d:	00 
 33e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 341:	89 44 24 04          	mov    %eax,0x4(%esp)
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	89 04 24             	mov    %eax,(%esp)
 34b:	e8 5a ff ff ff       	call   2aa <write>
}
 350:	c9                   	leave  
 351:	c3                   	ret    

00000352 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 352:	55                   	push   %ebp
 353:	89 e5                	mov    %esp,%ebp
 355:	56                   	push   %esi
 356:	53                   	push   %ebx
 357:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 35a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 361:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 365:	74 17                	je     37e <printint+0x2c>
 367:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 36b:	79 11                	jns    37e <printint+0x2c>
    neg = 1;
 36d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 374:	8b 45 0c             	mov    0xc(%ebp),%eax
 377:	f7 d8                	neg    %eax
 379:	89 45 ec             	mov    %eax,-0x14(%ebp)
 37c:	eb 06                	jmp    384 <printint+0x32>
  } else {
    x = xx;
 37e:	8b 45 0c             	mov    0xc(%ebp),%eax
 381:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 384:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 38b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 38e:	8d 41 01             	lea    0x1(%ecx),%eax
 391:	89 45 f4             	mov    %eax,-0xc(%ebp)
 394:	8b 5d 10             	mov    0x10(%ebp),%ebx
 397:	8b 45 ec             	mov    -0x14(%ebp),%eax
 39a:	ba 00 00 00 00       	mov    $0x0,%edx
 39f:	f7 f3                	div    %ebx
 3a1:	89 d0                	mov    %edx,%eax
 3a3:	0f b6 80 30 0a 00 00 	movzbl 0xa30(%eax),%eax
 3aa:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3ae:	8b 75 10             	mov    0x10(%ebp),%esi
 3b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3b4:	ba 00 00 00 00       	mov    $0x0,%edx
 3b9:	f7 f6                	div    %esi
 3bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3be:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3c2:	75 c7                	jne    38b <printint+0x39>
  if(neg)
 3c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3c8:	74 10                	je     3da <printint+0x88>
    buf[i++] = '-';
 3ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3cd:	8d 50 01             	lea    0x1(%eax),%edx
 3d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3d3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3d8:	eb 1f                	jmp    3f9 <printint+0xa7>
 3da:	eb 1d                	jmp    3f9 <printint+0xa7>
    putc(fd, buf[i]);
 3dc:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e2:	01 d0                	add    %edx,%eax
 3e4:	0f b6 00             	movzbl (%eax),%eax
 3e7:	0f be c0             	movsbl %al,%eax
 3ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ee:	8b 45 08             	mov    0x8(%ebp),%eax
 3f1:	89 04 24             	mov    %eax,(%esp)
 3f4:	e8 31 ff ff ff       	call   32a <putc>
  while(--i >= 0)
 3f9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 3fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 401:	79 d9                	jns    3dc <printint+0x8a>
}
 403:	83 c4 30             	add    $0x30,%esp
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5d                   	pop    %ebp
 409:	c3                   	ret    

0000040a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 410:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 417:	8d 45 0c             	lea    0xc(%ebp),%eax
 41a:	83 c0 04             	add    $0x4,%eax
 41d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 420:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 427:	e9 7c 01 00 00       	jmp    5a8 <printf+0x19e>
    c = fmt[i] & 0xff;
 42c:	8b 55 0c             	mov    0xc(%ebp),%edx
 42f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 432:	01 d0                	add    %edx,%eax
 434:	0f b6 00             	movzbl (%eax),%eax
 437:	0f be c0             	movsbl %al,%eax
 43a:	25 ff 00 00 00       	and    $0xff,%eax
 43f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 442:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 446:	75 2c                	jne    474 <printf+0x6a>
      if(c == '%'){
 448:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 44c:	75 0c                	jne    45a <printf+0x50>
        state = '%';
 44e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 455:	e9 4a 01 00 00       	jmp    5a4 <printf+0x19a>
      } else {
        putc(fd, c);
 45a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 45d:	0f be c0             	movsbl %al,%eax
 460:	89 44 24 04          	mov    %eax,0x4(%esp)
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	89 04 24             	mov    %eax,(%esp)
 46a:	e8 bb fe ff ff       	call   32a <putc>
 46f:	e9 30 01 00 00       	jmp    5a4 <printf+0x19a>
      }
    } else if(state == '%'){
 474:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 478:	0f 85 26 01 00 00    	jne    5a4 <printf+0x19a>
      if(c == 'd'){
 47e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 482:	75 2d                	jne    4b1 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 484:	8b 45 e8             	mov    -0x18(%ebp),%eax
 487:	8b 00                	mov    (%eax),%eax
 489:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 490:	00 
 491:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 498:	00 
 499:	89 44 24 04          	mov    %eax,0x4(%esp)
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
 4a0:	89 04 24             	mov    %eax,(%esp)
 4a3:	e8 aa fe ff ff       	call   352 <printint>
        ap++;
 4a8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4ac:	e9 ec 00 00 00       	jmp    59d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4b1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4b5:	74 06                	je     4bd <printf+0xb3>
 4b7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4bb:	75 2d                	jne    4ea <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c0:	8b 00                	mov    (%eax),%eax
 4c2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4c9:	00 
 4ca:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4d1:	00 
 4d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	89 04 24             	mov    %eax,(%esp)
 4dc:	e8 71 fe ff ff       	call   352 <printint>
        ap++;
 4e1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e5:	e9 b3 00 00 00       	jmp    59d <printf+0x193>
      } else if(c == 's'){
 4ea:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4ee:	75 45                	jne    535 <printf+0x12b>
        s = (char*)*ap;
 4f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f3:	8b 00                	mov    (%eax),%eax
 4f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4f8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 500:	75 09                	jne    50b <printf+0x101>
          s = "(null)";
 502:	c7 45 f4 e4 07 00 00 	movl   $0x7e4,-0xc(%ebp)
        while(*s != 0){
 509:	eb 1e                	jmp    529 <printf+0x11f>
 50b:	eb 1c                	jmp    529 <printf+0x11f>
          putc(fd, *s);
 50d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 510:	0f b6 00             	movzbl (%eax),%eax
 513:	0f be c0             	movsbl %al,%eax
 516:	89 44 24 04          	mov    %eax,0x4(%esp)
 51a:	8b 45 08             	mov    0x8(%ebp),%eax
 51d:	89 04 24             	mov    %eax,(%esp)
 520:	e8 05 fe ff ff       	call   32a <putc>
          s++;
 525:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 529:	8b 45 f4             	mov    -0xc(%ebp),%eax
 52c:	0f b6 00             	movzbl (%eax),%eax
 52f:	84 c0                	test   %al,%al
 531:	75 da                	jne    50d <printf+0x103>
 533:	eb 68                	jmp    59d <printf+0x193>
        }
      } else if(c == 'c'){
 535:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 539:	75 1d                	jne    558 <printf+0x14e>
        putc(fd, *ap);
 53b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 53e:	8b 00                	mov    (%eax),%eax
 540:	0f be c0             	movsbl %al,%eax
 543:	89 44 24 04          	mov    %eax,0x4(%esp)
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	89 04 24             	mov    %eax,(%esp)
 54d:	e8 d8 fd ff ff       	call   32a <putc>
        ap++;
 552:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 556:	eb 45                	jmp    59d <printf+0x193>
      } else if(c == '%'){
 558:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 55c:	75 17                	jne    575 <printf+0x16b>
        putc(fd, c);
 55e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 561:	0f be c0             	movsbl %al,%eax
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	89 04 24             	mov    %eax,(%esp)
 56e:	e8 b7 fd ff ff       	call   32a <putc>
 573:	eb 28                	jmp    59d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 575:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 57c:	00 
 57d:	8b 45 08             	mov    0x8(%ebp),%eax
 580:	89 04 24             	mov    %eax,(%esp)
 583:	e8 a2 fd ff ff       	call   32a <putc>
        putc(fd, c);
 588:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58b:	0f be c0             	movsbl %al,%eax
 58e:	89 44 24 04          	mov    %eax,0x4(%esp)
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	89 04 24             	mov    %eax,(%esp)
 598:	e8 8d fd ff ff       	call   32a <putc>
      }
      state = 0;
 59d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ae:	01 d0                	add    %edx,%eax
 5b0:	0f b6 00             	movzbl (%eax),%eax
 5b3:	84 c0                	test   %al,%al
 5b5:	0f 85 71 fe ff ff    	jne    42c <printf+0x22>
    }
  }
}
 5bb:	c9                   	leave  
 5bc:	c3                   	ret    

000005bd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	83 e8 08             	sub    $0x8,%eax
 5c9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5cc:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 5d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5d4:	eb 24                	jmp    5fa <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5d9:	8b 00                	mov    (%eax),%eax
 5db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5de:	77 12                	ja     5f2 <free+0x35>
 5e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5e6:	77 24                	ja     60c <free+0x4f>
 5e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5eb:	8b 00                	mov    (%eax),%eax
 5ed:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5f0:	77 1a                	ja     60c <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f5:	8b 00                	mov    (%eax),%eax
 5f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 600:	76 d4                	jbe    5d6 <free+0x19>
 602:	8b 45 fc             	mov    -0x4(%ebp),%eax
 605:	8b 00                	mov    (%eax),%eax
 607:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 60a:	76 ca                	jbe    5d6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 60c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60f:	8b 40 04             	mov    0x4(%eax),%eax
 612:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 619:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61c:	01 c2                	add    %eax,%edx
 61e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 621:	8b 00                	mov    (%eax),%eax
 623:	39 c2                	cmp    %eax,%edx
 625:	75 24                	jne    64b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 627:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62a:	8b 50 04             	mov    0x4(%eax),%edx
 62d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 630:	8b 00                	mov    (%eax),%eax
 632:	8b 40 04             	mov    0x4(%eax),%eax
 635:	01 c2                	add    %eax,%edx
 637:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 63d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 640:	8b 00                	mov    (%eax),%eax
 642:	8b 10                	mov    (%eax),%edx
 644:	8b 45 f8             	mov    -0x8(%ebp),%eax
 647:	89 10                	mov    %edx,(%eax)
 649:	eb 0a                	jmp    655 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 10                	mov    (%eax),%edx
 650:	8b 45 f8             	mov    -0x8(%ebp),%eax
 653:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 40 04             	mov    0x4(%eax),%eax
 65b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	01 d0                	add    %edx,%eax
 667:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66a:	75 20                	jne    68c <free+0xcf>
    p->s.size += bp->s.size;
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 50 04             	mov    0x4(%eax),%edx
 672:	8b 45 f8             	mov    -0x8(%ebp),%eax
 675:	8b 40 04             	mov    0x4(%eax),%eax
 678:	01 c2                	add    %eax,%edx
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 680:	8b 45 f8             	mov    -0x8(%ebp),%eax
 683:	8b 10                	mov    (%eax),%edx
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	89 10                	mov    %edx,(%eax)
 68a:	eb 08                	jmp    694 <free+0xd7>
  } else
    p->s.ptr = bp;
 68c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 692:	89 10                	mov    %edx,(%eax)
  freep = p;
 694:	8b 45 fc             	mov    -0x4(%ebp),%eax
 697:	a3 4c 0a 00 00       	mov    %eax,0xa4c
}
 69c:	c9                   	leave  
 69d:	c3                   	ret    

0000069e <morecore>:

static Header*
morecore(uint nu)
{
 69e:	55                   	push   %ebp
 69f:	89 e5                	mov    %esp,%ebp
 6a1:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6a4:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6ab:	77 07                	ja     6b4 <morecore+0x16>
    nu = 4096;
 6ad:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	c1 e0 03             	shl    $0x3,%eax
 6ba:	89 04 24             	mov    %eax,(%esp)
 6bd:	e8 50 fc ff ff       	call   312 <sbrk>
 6c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6c5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6c9:	75 07                	jne    6d2 <morecore+0x34>
    return 0;
 6cb:	b8 00 00 00 00       	mov    $0x0,%eax
 6d0:	eb 22                	jmp    6f4 <morecore+0x56>
  hp = (Header*)p;
 6d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6db:	8b 55 08             	mov    0x8(%ebp),%edx
 6de:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e4:	83 c0 08             	add    $0x8,%eax
 6e7:	89 04 24             	mov    %eax,(%esp)
 6ea:	e8 ce fe ff ff       	call   5bd <free>
  return freep;
 6ef:	a1 4c 0a 00 00       	mov    0xa4c,%eax
}
 6f4:	c9                   	leave  
 6f5:	c3                   	ret    

000006f6 <malloc>:

void*
malloc(uint nbytes)
{
 6f6:	55                   	push   %ebp
 6f7:	89 e5                	mov    %esp,%ebp
 6f9:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	83 c0 07             	add    $0x7,%eax
 702:	c1 e8 03             	shr    $0x3,%eax
 705:	83 c0 01             	add    $0x1,%eax
 708:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 70b:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 710:	89 45 f0             	mov    %eax,-0x10(%ebp)
 713:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 717:	75 23                	jne    73c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 719:	c7 45 f0 44 0a 00 00 	movl   $0xa44,-0x10(%ebp)
 720:	8b 45 f0             	mov    -0x10(%ebp),%eax
 723:	a3 4c 0a 00 00       	mov    %eax,0xa4c
 728:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 72d:	a3 44 0a 00 00       	mov    %eax,0xa44
    base.s.size = 0;
 732:	c7 05 48 0a 00 00 00 	movl   $0x0,0xa48
 739:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 73c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73f:	8b 00                	mov    (%eax),%eax
 741:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 744:	8b 45 f4             	mov    -0xc(%ebp),%eax
 747:	8b 40 04             	mov    0x4(%eax),%eax
 74a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 74d:	72 4d                	jb     79c <malloc+0xa6>
      if(p->s.size == nunits)
 74f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 752:	8b 40 04             	mov    0x4(%eax),%eax
 755:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 758:	75 0c                	jne    766 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 75a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75d:	8b 10                	mov    (%eax),%edx
 75f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 762:	89 10                	mov    %edx,(%eax)
 764:	eb 26                	jmp    78c <malloc+0x96>
      else {
        p->s.size -= nunits;
 766:	8b 45 f4             	mov    -0xc(%ebp),%eax
 769:	8b 40 04             	mov    0x4(%eax),%eax
 76c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 76f:	89 c2                	mov    %eax,%edx
 771:	8b 45 f4             	mov    -0xc(%ebp),%eax
 774:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 777:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77a:	8b 40 04             	mov    0x4(%eax),%eax
 77d:	c1 e0 03             	shl    $0x3,%eax
 780:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 783:	8b 45 f4             	mov    -0xc(%ebp),%eax
 786:	8b 55 ec             	mov    -0x14(%ebp),%edx
 789:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 78c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78f:	a3 4c 0a 00 00       	mov    %eax,0xa4c
      return (void*)(p + 1);
 794:	8b 45 f4             	mov    -0xc(%ebp),%eax
 797:	83 c0 08             	add    $0x8,%eax
 79a:	eb 38                	jmp    7d4 <malloc+0xde>
    }
    if(p == freep)
 79c:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 7a1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7a4:	75 1b                	jne    7c1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a9:	89 04 24             	mov    %eax,(%esp)
 7ac:	e8 ed fe ff ff       	call   69e <morecore>
 7b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7b8:	75 07                	jne    7c1 <malloc+0xcb>
        return 0;
 7ba:	b8 00 00 00 00       	mov    $0x0,%eax
 7bf:	eb 13                	jmp    7d4 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 7cf:	e9 70 ff ff ff       	jmp    744 <malloc+0x4e>
}
 7d4:	c9                   	leave  
 7d5:	c3                   	ret    
