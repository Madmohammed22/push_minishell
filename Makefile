NAME = minishell

SRC = $(wildcard *.c)
SRC_libft = $(wildcard libft/*.c)
OBJECTS = $(SRC:.c=.o)
OBJECTS_LIBFT = $(SRC_libft:.c=.o)

CC = cc

# CFLAGS = -Wall -Wextra -Werror  -g3 #-fsanitize=address #-no-pie
CFLAGS = -Wall -Wextra -Werror  -g3  #-fsanitize=address #-no-pie

all: $(NAME) 
	@rm -rf *.o
$(NAME): $(OBJECTS)  $(OBJECTS_LIBFT)
	@$(CC) $(CFLAGS) $(OBJECTS)  $(OBJECTS_LIBFT) $(libft) -lreadline  -o $(NAME)

%.o: %.c 
	@$(CC) $(CFLAGS) -c -o $@ $< 

clean:
	@rm -f   $(OBJECTS)  $(OBJECTS_LIBFT) && rm -rf *.o > /dev/null
fclean: clean
	@rm -rf ./minishell

re: fclean all
run:all
	python3 -m c_formatter_42 *.c && clear && ./minishell
.PHONY: all clean  fclean re bonus

.SECONDARY: $(OBJECTS)  $(OBJECTS_LIBFT)
