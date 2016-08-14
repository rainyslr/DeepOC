#import <Foundation/Foundation.h>
#import "MyObj.h"

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
		self.namePrivate = @"tangT";
	}
	return self;
}

- (NSString*)description {
	NSString *str = [NSString stringWithFormat:@"none_var:%d,public_var:%d,private_var:%d,package_var:%d",none_var,public_var,private_var,package_var];
	// NSString *str = namePrivate;
	return str;
}

@end