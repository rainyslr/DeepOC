#import "MyObj.h"

/*
@interface BaseObj(su)
- (void)visitVar;
@end

@implementation BaseObj(su)
- (void)visitVar {
	//即使是写了扩展，也不能访问MyObj.m中的变量
	//NSString *str = [NSString stringWithFormat:@"none_var_imp:%d,public_var_imp:%d,package_var_imp:%d",none_var_imp,public_var_imp,package_var_imp];
	
	//扩展可以访问MyObj中的protected,private变量
	NSString *str = [NSString stringWithFormat:@"none_var:%d,private_var:%d",none_var,private_var];

	NSLog(@"%@",str);
}
@end
*/

int main()
{
	BaseObj *obj = [[BaseObj alloc] init];

	// NSLog(@"************************************************");
	// NSLog(@"%@",obj);
	// // obj->none_var = 1;//不带标记的默认类型为protect,main中不能访问
	// // obj.private_var = 1;
	// obj->public_var = 1;
	// obj->package_var = 1;
	// NSLog(@"%@",obj);
	// NSLog(@"************************************************\n");

	/**
	不管implementation中变量的修饰符是什么，在main中均不能直接访问
	**/
	// obj->none_var_imp = 1;
	// obj->public_var_imp = 1;
	// obj->package_var_imp = 1;
	// [obj visitVar];
	// NSLog(@"************************************************\n");

	obj.name = @"sulirong";
	// NSLog(@"%@",obj.name_private);//无法调用，属性不可见，同理属性的getter也是不可见的

	// NSString *s1 = [obj performSelector:@selector(namePrivate)];

	SEL selector = NSSelectorFromString(@"namePrivate");
	IMP imp = [obj methodForSelector:selector];
	typedef NSString* (*func_t)(id, SEL);
	func_t func = (func_t)imp;
	NSString *s1 = func(obj, selector);

	NSLog(@"%@",s1);

	return 0;
}