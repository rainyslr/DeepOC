#import <Foundation/Foundation.h>
// 测试ARC Block对objc变量的内存管理
NSString *__globalString = nil;

@interface MyClass : NSObject 
- (void)testGlobalObj;
- (void)testStaticObj;
- (void)testLocalObj;
- (void)testBlockObj;
- (void)testWeakObj;
@end
 
@implementation MyClass

- (void)dealloc {
    NSLog(@"dealloc MyClass");
}

- (void)testGlobalObj
{
    __globalString = @"1";
    void (^TestBlock)(void) = ^{
        NSLog(@"testGlobalObj:%@", __globalString); // testGlobalObj:(null)
    };
    __globalString = nil;
    TestBlock();
}

- (void)testStaticObj
{
    // static NSString *__staticString = nil;
    // __staticString = @"1";
    // printf("static address: %p\n", &__staticString);    //static address: 0x6a8c
    // void (^TestBlock)(void) = ^{
    //     printf("static address: %p\n", &__staticString); //static address: 0x6a8c
    //     NSLog(@"testStaticObj is : %@", __staticString); //testStaticObj is : (null)
    // __staticString = nil;
    // TestBlock();
}

- (void)testLocalObj
{
    NSString *__localString = nil;
    __localString = @"1";
    printf("local address: %p\n", &__localString); //local address: 0xbfffd9c0
    void (^TestBlock)(void) = ^{
        printf("local address: %p\n", &__localString); //local address: 0x71723e4
        NSLog(@"testLocalObj is : %@", __localString); //testLocalObj is : 1
    };
    __localString = nil;
    TestBlock();
}

- (void)testBlockObj
{
    __block NSString *_blockString = @"1";
    void (^TestBlock)(void) = ^{
        NSLog(@"testBlockObj is : %@", _blockString); //testBlockObj is : (null)
    };
    _blockString = nil;
    TestBlock();
}

- (void)testWeakObj
{
    NSString *__localString = @"1";
    __weak NSString *weakString = __localString;
    printf("weak address: %p\n", &weakString);  //weak address: 0xbfffd9c4
    printf("weak str address: %p\n", weakString); //weak str address: 0x684c
    void (^TestBlock)(void) = ^{
        printf("weak address: %p\n", &weakString); //weak address: 0x7144324
        printf("weak str address: %p\n", weakString); //weak str address: 0x684c
        NSLog(@"testWeakObj is : %@", weakString); // testWeakObj is : 1
    };
    __localString = nil;
    TestBlock();
}
@end

int main()
{
	MyClass* m_cla = [[MyClass alloc] init];
	[m_cla testGlobalObj];
	[m_cla testStaticObj];
	[m_cla testLocalObj];
	[m_cla testBlockObj];
	[m_cla testWeakObj];
	return 0;

}