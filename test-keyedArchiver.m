#import <Foundation/Foundation.h>

@interface MyObj : NSObject<NSCopying,NSCoding>
@end

@implementation MyObj
- (id)copyWithZone:(NSZone *)zone {
    MyObj *item = [[[self class] allocWithZone:zone] init];
    return  item;
}

- (id)intiWithCoder:(NSCoder*)coder {
	[coder decoder]
}
@end

int main()
{

}
@end