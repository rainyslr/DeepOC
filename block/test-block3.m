#import <Foundation/Foundation.h>

// 任何时候都能运行
void exampleA() {
  char a = 'A';
  ^{
    printf("%c\n", a);
  }();
}

int main(int argc, char const *argv[])
{
	exampleA();
	return 0;
}