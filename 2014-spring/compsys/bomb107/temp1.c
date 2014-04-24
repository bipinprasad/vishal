#include <stdio.h>

int main(){
   int i;
	char buf[BUFSIZ];
	i = sscanf("1", "%s", buf);
	printf("sscanf %%s returned %d\n", i);
	return 0;
}
