#import <objc/objc-runtime.h>
#import <Foundation/Foundation.h>

void PrintObjMethods(Class a_class) 
{
	unsigned int count = 0;
	Methods *methods = class_copyMethodList(a_class,&count);
	for(int i = 0;I < count;++i)
	{
		SEL sel = method_getName(methods[i]);
		const char *method_name = sel_getName(sel);
		printf("%s\n",method_name);
	}

}

int main()
{
	const char *name = class_getName([NSObject class]);
	printf("%s\n",name);
	PrintObjMethods([NSObject class]);
}