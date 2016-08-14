#import <Foundation/Foundation.h>

typedef int (^MyBlock)(int); 

MyBlock genBlock(); 

@interface MyObject : NSObject
{ 
	NSString * title; 
	void (^ myLog) (NSString * deco); 
} 

-(void) logName; 
@end 

@implementation MyObject 
-(id) initWithTitle:(NSString * ) newTitle
{ 
    if(self = [super init]){ 
            title = newTitle; 
             __weak __typeof(self)weakSelf = self;//为什么这个地方用的是weak但是输出计数值的时候还是2呢
            myLog = [^(NSString * deco) { NSLog(@" %@%@%@",deco,weakSelf->title, deco ); }copy]; 
            // myLog = ^(NSString * deco) { NSLog(@" %@%@%@",deco, title, deco ); }; 
    } 
    return self; 
} 

-(void) logName
{ 
	 NSLog(@"result is %d",[myLog retainCount] ); 
	 myLog(@"su");
} 

-(void ) dealloc{ 

	[myLog release];
	[title release]; 
	[super dealloc]; 
} 
@end

int main()
{
	// typedef void (^str_block)(void);
	// NSMutableString *String1 = [[NSMutableString alloc] initWithString:@"NSMutableString"];
	// // void (^myfun)(void) = ^(void){
	// // 	[String1 appendString:@"character"];
	// // };
	// str_block myfun = ^(void){
	// 	[String1 appendString:@"character"];
	// };
	// myfun();
	// str_block fun2 = ^(void){
	// 	NSLog(@"fun2");
	// };
	// NSLog(@"%@",String1);
	// myfun = Block_copy(fun2);
	// myfun();

	// MyBlock outBlock = genBlock(); 
 //    int result = outBlock(5); 

 //    NSLog(@"result is %d",[outBlock retainCount] ); // segmentation fault 
 //    NSLog(@"result is %d",result  ); 

	MyObject * mObj = [[MyObject alloc] initWithTitle:@"Car"]; 
  	NSLog(@"retainCount of MyObject is  %d",[mObj retainCount]  ); 
  	[mObj logName];
    return 0 ; 

}

MyBlock genBlock() { 
    int a = 3; 
    NSMutableString * myString = [NSMutableString string];
    NSLog(@"retain count of string %d",[myString retainCount]); 
    MyBlock inBlock = ^(int n) { 
    	NSLog(@"retain count of string %d",[myString retainCount]);
            return n*a; 

    }; 
    return [[inBlock copy] autorelease];
        // return [inBlock copy]; 
}
