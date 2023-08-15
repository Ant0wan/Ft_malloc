#include <unistd.h>

#include "malloc.h" // Include the library's header file

// Tests
int main(void)
{
	char *p;

	p = malloc(10);
	if (p == NULL) {
		write(1, "NO\n", 4);
	}
	return 0;
}
