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
	// __block id tmp = self;
	// blk_var = ^{
	// 	NSLog(@"%@",tmp);
	// 	tmp = nil;
	// };
	return self;
}

-(void)execBlock {
	blk_var();
}

- (void)dealloc {
    NSLog(@"dealloc MyClass");
}

@end;

int main()
{
	id mc = [[MyClass alloc] init];
	// [mc execBlock];
	return 0;
}