#import <Foundation/Foundation.h>
// 测试MRC Block对objc变量的内存管理
@interface MyClass : NSObject {
    NSObject* _instanceObj;
}
- (void) TestInstance;
- (void) DoSomething;
@end

@implementation MyClass
NSObject* __globalObj = nil;
- (id) init {
    if (self = [super init]) {
        _instanceObj = [[NSObject alloc] init];
    }
    return self;
}
- (void)dealloc
{
    [super dealloc];
    NSLog(@"no cycle retain");
}

- (void) DoSomething
{
     NSLog(@"do DoSomething");
}

- (void) TestInstance
{
    NSObject __block *block_instanceVar = _instanceObj;
     __block MyClass *__blockSelf = self;
    NSLog(@"self retainCount:%lu", [self retainCount]);//1
    typedef void (^MyBlock)(void) ;
     MyBlock aBlock = ^{
        // NSLog(@"%@", self);
        // [self DoSomething];
        NSLog(@"%@", _instanceObj);
         // NSLog(@"%@", __blockSelf);
        // NSLog(@"%@", block_instanceVar);

    };
    NSLog(@"self retainCount:%lu", [self retainCount]);//1
    aBlock = [[aBlock copy] autorelease];
    NSLog(@"self retainCount:%lu", [self retainCount]);//2
    NSLog(@"_instanceObj retainCount:%lu", [_instanceObj retainCount]);
    aBlock();
    NSLog(@"self retainCount:%lu", [self retainCount]);//2

}

- (void) test {
    static NSObject* __staticObj = nil;
    __globalObj = [[NSObject alloc] init];
    __staticObj = [[NSObject alloc] init];
    NSObject* localObj = [[NSObject alloc] init];
    __block NSObject* blockObj = [[NSObject alloc] init];
    typedef void (^MyBlock)(void) ;
    MyBlock aBlock = ^{
        NSLog(@"%@", __globalObj);
        NSLog(@"%@", __staticObj);
        NSLog(@"%@", _instanceObj);
        NSLog(@"%@", localObj);
        NSLog(@"%@", blockObj);
    };

    NSLog(@"%lu", [__globalObj retainCount]);//1
    NSLog(@"%lu", [__staticObj retainCount]);//1
    NSLog(@"%lu", [_instanceObj retainCount]);//1
    NSLog(@"%lu", [localObj retainCount]);//1
    NSLog(@"%lu", [blockObj retainCount]);//1
    NSLog(@"self retainCount:%lu", [self retainCount]);//1
    aBlock = [[aBlock copy] autorelease];
    NSLog(@"self retainCount:%lu", [self retainCount]);//2
    aBlock();
    NSLog(@"self retainCount:%lu", [self retainCount]);//2
    NSLog(@"%lu", [__globalObj retainCount]);//1
    NSLog(@"%lu", [__staticObj retainCount]);//1
    NSLog(@"%lu", [_instanceObj retainCount]);//1
    NSLog(@"%lu", [localObj retainCount]);//2
    NSLog(@"%lu", [blockObj retainCount]);//1
}
@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
        MyClass* obj = [[[MyClass alloc] init] autorelease];
        // [obj test];
        [obj TestInstance];
        return 0;
    }
}