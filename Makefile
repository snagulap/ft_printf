# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: snagulap <snagulap@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/28 12:43:21 by snagulap          #+#    #+#              #
#    Updated: 2023/02/21 20:03:18 by snagulap         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRCS =	ft_printf.c\
		ft_printdec.c\
		ft_printstr.c\
		ft_printhex.c

OBJS = $(SRCS:.c=.o)
	
CC = cc
CFLAGS = -Werror -Wall -Wextra 

all: $(NAME)

$(NAME): $(OBJS)
	make -C libft
	mv libft/libft.a $(NAME)
	ar -rcs $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) $(SRCS) -c
	
clean:
	make clean -C libft
	rm -f $(OBJS)

fclean: clean
	make fclean -C libft
	rm -f $(NAME)

re: fclean all

.PHONY: all fclean clean re 

