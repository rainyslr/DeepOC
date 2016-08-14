#import <Foundation/Foundation.h>

@interface MyObj : NSObject<NSCopying>
@end

@implementation MyObj
- (id)copyWithZone:(NSZone *)zone {
    MyObj *item = [[[self class] allocWithZone:zone] init];
    return  item;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
	NSString *sel_name = NSStringFromSelector(aSelector);
	NSLog(@"rainySue call %@ fail",sel_name);
}

- (NSString*)test:(int)var {
	NSString *ret = [NSString stringWithFormat:@"input variable:%d",var];
	return ret;
}
@end

void PrintArray(NSArray *arr)
{

	NSLog(@"array address:%p",arr);
	NSLog(@"%@",arr);

}

void PrintArray2Dim(NSArray *arr)
{
	NSLog(@"array address:%p",arr);
	for (id obj in arr) {
		NSLog(@"subarr address:%p",obj);
		NSLog(@"%@",obj);
	}
}

void testObjct()
{
	@autoreleasepool {
		MyObj *obj = [[MyObj alloc] init];
		Class ns_class = [NSObject class];
		BOOL ret = [obj isKindOfClass:ns_class];
		NSLog(@"[obj isKindOfClass:ns_class]: %hhd",ret);
		ret = [obj isMemberOfClass:ns_class];
		NSLog(@"[obj isMemberOfClass:ns_class]: %hhd",ret);
		Class b_cla = [MyObj superclass];
		NSLog(@"[MyObj superclass]: %@",b_cla);
		ret = [MyObj isSubclassOfClass:ns_class];
		NSLog(@"[MyObj isSubclassOfClass:ns_class]: %hhd",ret);

		NSLog(@"*******************************************************");
		NSObject *n_obj = [[NSObject alloc] init];
		SEL aSel = @selector(copyWithZone:);
		ret = [n_obj respondsToSelector:aSel];
		NSLog(@"[n_obj respondsToSelector:aSel]: %hhd",ret);

		ret = [obj respondsToSelector:aSel];
		NSLog(@"[obj respondsToSelector:aSel]: %hhd",ret);

		Protocol *p = @protocol(NSCopying);
		ret = [n_obj conformsToProtocol:p];
		NSLog(@"[n_obj conformsToProtocol:p]: %hhd",ret);

		ret = [obj conformsToProtocol:p];
		NSLog(@"[obj conformsToProtocol:p]: %hhd",ret);
	}
}
void testSelector()
{
	MyObj *obj = [[MyObj alloc] init];
	IMP func1 = [obj methodForSelector:@selector(test:)];
	IMP func2 = [obj methodForSelector:@selector(fake:)];
	IMP func3 = [MyObj instanceMethodForSelector:@selector(test:)];
	// NSLog(@"func1:%@,func2:%@,func3:%@",func1,func2,func3);
	[obj wawa];
}

int main(int argc, char const *argv[])
{
	// testObjct();
	testSelector();


	return 0;
}