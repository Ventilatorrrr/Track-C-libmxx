LIBRARY_NAME = libmx.a

COMPILER_FLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic -g
CC = clang

SOURCE_DIR = src
INCLUDE_DIR = inc
OBJECT_DIR = obj

HEADER = libmx.h
HEADER_PATH = $(addprefix $(INCLUDE_DIR)/, $(HEADER))

SOURCE_FILES = \
    mx_binary_search.c mx_bubble_sort.c mx_count_substr.c mx_count_words.c mx_create_node.c \
    mx_del_extra_spaces.c mx_del_strarr.c mx_file_to_str.c mx_foreach.c mx_get_char_index.c \
    mx_get_substr_index.c mx_hex_to_nbr.c mx_isalpha.c mx_isdigit.c mx_islower.c mx_itoa.c \
    mx_isspace.c mx_isupper.c mx_list_size.c mx_memccpy.c mx_memchr.c mx_memcmp.c mx_memcpy.c \
    mx_memmem.c mx_memmove.c mx_memrchr.c mx_memset.c mx_nbr_to_hex.c mx_pop_back.c mx_pop_front.c \
    mx_pow.c mx_print_strarr.c mx_print_unicode.c mx_printchar.c mx_printint.c mx_printstr.c \
    mx_push_back.c mx_push_front.c mx_quicksort.c mx_read_line.c mx_realloc.c mx_replace_substr.c \
    mx_sort_list.c mx_sqrt.c mx_str_reverse.c mx_strcat.c mx_strcmp.c mx_strcpy.c mx_strdel.c \
    mx_strdup.c mx_strjoin.c mx_strlen.c mx_strncmp.c mx_strncpy.c mx_strndup.c mx_strnew.c \
    mx_strsplit.c mx_strstr.c mx_strtrim.c mx_swap_char.c mx_filelen.c mx_atoi.c 
 
SOURCE_FILES_PATH = $(addprefix $(SOURCE_DIR)/, $(SOURCE_FILES))
OBJECT_FILES = $(addprefix $(OBJECT_DIR)/, $(SOURCE_FILES:%.c=%.o))

all: build

build: $(LIBRARY_NAME)

$(LIBRARY_NAME): $(OBJECT_FILES)
	@ar rcs $@ $^
	@echo "$@ was created."

$(OBJECT_DIR)/%.o: $(SOURCE_DIR)/%.c $(HEADER_PATH)
	@mkdir -p $(OBJECT_DIR)  # створюємо директорію для об'єктів
	@$(CC) $(COMPILER_FLAGS) -c $< -o $@
	@echo "Compiled: $<"

clean:
	@rm -rf $(OBJECT_DIR)
	@echo "Removed object files."

fclean: clean
	@rm -f $(LIBRARY_NAME)
	@echo "Removed library: $(LIBRARY_NAME)."

re: fclean all

.PHONY: all build clean fclean re

