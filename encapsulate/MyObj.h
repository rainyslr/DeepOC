#import <Foundation/Foundation.h>

@interface BaseObj : NSObject
{
	int none_var;
@public 
	int  public_var;
@private 
	int private_var;
@package
	int package_var;
}
@property (nonatomic ,copy) NSString *name;
@end;

