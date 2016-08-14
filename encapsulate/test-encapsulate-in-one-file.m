#import <Foundation/Foundation.h>

@interface BaseObj : NSObject
{
	int none_var;
@public 
	int  public_var;
@private 
	int private_var;
@package
	int package_var;
}
@end;

@interface BaseObj()
{

}
@property (nonatomic ,copy) NSString *namePrivate;
@end


@implementation BaseObj
{
	int none_var_imp;
@public 
	int  public_var_imp;
@package
	int package_var_imp;
}

- (id)init {
	self = [super init];
	if (self) {
		none_var = 100;
		public_var  = 100;
		private_var  = 100;
		package_var  = 100;
	}
	return self;
}

- (void)test {
	NSLog(@"what will be your answer");
}

- (NSString*)description {
	return [NSString stringWithFormat:@"none_var:%d,public_var:%d,private_var:%d,package_var:%d",none_var,public_var,private_var,package_var];
}

@end

// @interface BaseObj(su)
// - (void)visitVar;
// @end

// @implementation BaseObj(su)
// - (void)visitVar {
// 	//即使是写了扩展，也不能访问MyObj.m中的变量
// 	NSString *str = [NSString stringWithFormat:@"none_var_imp:%d,public_var_imp:%d,package_var_imp:%d",none_var_imp,public_var_imp,package_var_imp];
// 	NSLog(@"%@",str);
// }
// @end

int main()
{
	BaseObj *obj = [[BaseObj alloc] init];

	// obj->none_var_imp = 1;//privete变量，不可访问
	obj->public_var_imp = 1;
	obj->package_var_imp = 1;
	// [obj visitVar];
	NSLog(@"************************************************\n");

	NSLog(@"%@",obj.namePrivate);
	[obj test];
	return 0;
}