#import<Foundation/Foundation.h>

typedef  void (^blk_t)(id obj);

int main()
{
	//ARC case
	id __weak array = [[NSMutableArray alloc] init];
	blk_t blk = [^(id obj){
		[array addObject:obj];
		// NSLog(@"array count:%ld",[array count]);
		NSLog(@"%@",array);
	} copy];
	// blk_t blk = ^(id obj){
	// 	[array addObject:obj];
	// 	NSLog(@"array count:%ld",[array count]);
	// } ;
	blk([[NSObject alloc] init]);
	blk([[NSObject alloc] init]);
	blk([[NSObject alloc] init]);
	return 0;
}