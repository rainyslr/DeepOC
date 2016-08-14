#import <Foundation/Foundation.h>

void PrintArray(NSArray *arr)
{

	NSLog(@"array address:%p",arr);
	NSLog(@"%@",arr);

}

int main()
{

	@autoreleasepool {
		NSObject *obj = [[NSObject alloc] init];
		NSObject *obj1 = [[NSObject alloc] init];
		[obj1 retain];
		[obj1 release];
		// NSObject *obj2 = [obj copy];
		NSArray *arr = [NSArray arrayWithObjects:obj,obj1,nil];
		NSArray *arr1 = [arr copy];
		PrintArray(arr);
		PrintArray(arr1);
		NSMutableArray *arr2 = [arr mutableCopy];
		PrintArray(arr2);
		// NSArray *arr3 = [[NSArray alloc] initWithArray:arr copyItems:YES];
		// PrintArray(arr3);

	}

	return 0;
}