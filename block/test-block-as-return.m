#import<Foundation/Foundation.h>

int fun1(int arg)
{
	return arg + 1;
}

int fun2(int arg)
{
	return arg + 100;
}

int(*generateFun(const char *name))(int)
{
	if (name == "fun1")
		return fun1;
	else
		return fun2;
}

// int (^func())(int)
// {
// 	return ^(int count){return count*2;};
// }

typedef int (^blk_type)(int);

blk_type func()
{
	return ^(int count){return count*2;};
}


int main()
{

	int (*fun_ptr)(int) = generateFun("fun2");
	int ret = fun_ptr(30);
	printf("%d\n",ret);

	int (^blk)(int) = func();
	int result = blk(12);
	printf("%d\n",result);


	return 0;
}