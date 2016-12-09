# export FILENAME=test ; as $FILENAME.s -o $FILENAME.o && ld -macosx_version_min 10.7.0 $FILENAME.o -e _main -o $FILENAME && ./$FILENAME

.section __DATA,__data
str:
  .asciz "Hello world!\n"

.section __TEXT,__text
.globl _main
_main:
  movl $0x2000004, %eax           # preparing system call 4
  movl $1, %edi                    # STDOUT file descriptor is 1
  movq str@GOTPCREL(%rip), %rsi   # The value to print
  movq $100, %rdx                 # the size of the value to print
  syscall

  movl $0, %ebx
  movl $0x2000001, %eax           # exit 0
  syscall
