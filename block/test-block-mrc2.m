#import <Foundation/Foundation.h>
// 测试ARC Block对objc变量的内存管理
typedef void(^blk_t)(void);

@interface MyClass : NSObject
{
	blk_t blk_var;
}
@end
 
@implementation MyClass

- (id)init {
	self = [super init];
	// id tmp = self;
	__block id tmp = self;
	blk_var = [^{
		// NSLog(@"%@.%lu",self,self.retainCount);
		NSLog(@"%@",tmp);
		// tmp = nil;
	} copy];
	// blk_var();
	return self;
}

-(void)execBlock {
	blk_var();
}

- (void)dealloc {
	[super dealloc];
    NSLog(@"dealloc MyClass");
}

@end;

int main()
{
	id mc = [[MyClass alloc] init];
	[mc release];
	// [mc execBlock];
	return 0;
}