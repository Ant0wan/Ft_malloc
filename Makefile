NAME		:= libft_malloc.so

HOSTLIB		:= libft_malloc_$(HOSTTYPE).so

include makefile.conf

OBJS		= $(SOURCE:.c=.o)
DEPS		= $(SOURCE:.c=.d)

-include ${DEPS}

all: $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -MMD -MP -c -o $@ $<

${NAME}: ${OBJS}
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

clean:
	rm -f ${OBJS} ${DEPS}

fclean: clean
	rm -f ${NAME}

format:
	clang-format -i --assume-filename=.clang-format *.c *.h

ctags:
	ctags -R *

help:
	-@echo "all:     build the shared library"
	-@echo "clean:   delete object files"
	-@echo "fclean:  execute make clean and delete shared library"
	-@echo "ctags:   generate Vim tags"
