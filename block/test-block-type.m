#import <Foundation/Foundation.h>
// 测试Block类型

void (^global_blk)(void) = ^{printf("global_blk\n");};

int main()
{
    /***************************MRC 情况下***************************/
 //     NSLog(@"global_blk is %@", global_blk); //block is <__NSGlobalBlock__: 0x47d0>

	// float (^sum)(float, float) = ^(float a, float b){
 //        return a + b;
 //    };
 //    NSLog(@"block is %@", sum); //block is <__NSGlobalBlock__: 0x47d0>

 //    int rate = 3;
 //    typedef int(^blk_int)(int);
 //    blk_int blk_int_val1 = ^(int count){return rate * count;};
 //    blk_int blk_int_val2 = ^(int count){return count;};

 //    NSLog(@"blk_int_val1 is %@", blk_int_val1); // <__NSStackBlock__: 0x7fff53980838>
 //    NSLog(@"blk_int_val2 is %@", blk_int_val2); //block is <__NSGlobalBlock__: 0x47d0>

 //    NSArray *testArr = @[@"1", @"2"];
 //    void (^TestBlock)(void) = ^{
 //        NSLog(@"testArr :%@", testArr);
 //    };
 //    void (^copyBlock)(void) = [[TestBlock copy] autorelease];
 //    NSLog(@"TestBlock block is %@",TestBlock); //<__NSStackBlock__: 0x7fff539807f8>
 //    NSLog(@"copyBlock block is %@",copyBlock);//<__NSMallocBlock__: 0x7ff9b2507a50>
    /*****************************************************************/


    /***************************ARC 情况下***************************/
     NSLog(@"global_blk is %@", global_blk); //block is <__NSGlobalBlock__: 0x47d0>

    float (^sum)(float, float) = ^(float a, float b){
        return a + b;
    };
    NSLog(@"block is %@", sum); //block is <__NSGlobalBlock__: 0x47d0>

    int rate = 3;
    typedef int(^blk_int)(int);
    blk_int blk_int_val1 = ^(int count){return rate * count;};
    blk_int blk_int_val2 = ^(int count){return count;};

    NSLog(@"blk_int_val1 is %@", blk_int_val1); // __NSMallocBlock__
    NSLog(@"blk_int_val2 is %@", blk_int_val2); //block is <__NSGlobalBlock__: 0x47d0>

    NSArray *testArr = @[@"1", @"2"];
    void (^TestBlock)(void) = ^{
        NSLog(@"testArr :%@", testArr);
    };
    void (^copyBlock)(void) = [TestBlock copy];
    NSLog(@"TestBlock block is %@",TestBlock); //<__NSMallocBlock__666: 0x7fff539807f8>
    NSLog(@"copyBlock block is %@",copyBlock);//<__NSMallocBlock__: 0x7ff9b2507a50>
    /*****************************************************************/

}