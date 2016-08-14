#import <Foundation/Foundation.h>

@interface MyObj : NSObject<NSCopying>
@end

@implementation MyObj
- (id)copyWithZone:(NSZone *)zone {
    MyObj *item = [[[self class] allocWithZone:zone] init];
    return  item;
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

int main()
{
	MyObj *obj1 = [[MyObj alloc] init];
	MyObj *obj2 = [[MyObj alloc] init];
	MyObj *obj3 = [[MyObj alloc] init];

	MyObj *obj4 = [[MyObj alloc] init];
	MyObj *obj5 = [obj4 copy];
	// NSLog(@"%@",obj4);
	// NSLog(@"%@",obj5);

	NSArray *arr  = [NSArray arrayWithObjects:obj1,obj2,obj3,nil];
	PrintArray(arr);

	// //指针复制，arr_cpy地址与arr_cpy相同
	// NSArray *arr_cpy = [arr copy];
	// PrintArray(arr_cpy);

	// //对象复制，arr_cpy1!=arr_cpy，但是arr_cpy1[i] == arr_cpy[i]
	// NSMutableArray *arr_cpy1 = [arr mutableCopy];
	// PrintArray(arr_cpy1);

	// //对象复制，arr_cpy4!=arr_cpy，但是arr_cpy4[i] == arr_cpy[i]
	// NSArray *arr_cpy4 = [NSArray arrayWithArray:arr];
	// PrintArray(arr_cpy4);

	// //对象复制，arr_cpy2!=arr_cpy，但是arr_cpy2[i] == arr_cpy[i]
	// NSArray *arr_cpy2 = [[NSArray alloc] initWithArray:arr];
	// PrintArray(arr_cpy2);

	//对象复制，arr_cpy3!=arr_cpy，但是arr_cpy3[i] == arr_cpy[i]
	NSArray *arr_cpy3 = [[NSArray alloc] initWithArray:arr copyItems:YES];
	PrintArray(arr_cpy3);



	NSLog(@"************************************************************************************");

	NSMutableArray *m_arr = [NSMutableArray arrayWithObjects:obj3,obj4,nil];
	PrintArray(m_arr);
	
	// //对象复制，marr_cpy != m_arr，marr_cpy[i] == m_arr[i]
	// NSArray *marr_cpy = [m_arr copy];
	// PrintArray(marr_cpy);

	// //对象复制，marr_cpy1 != m_arr，marr_cpy1[i] == m_arr[i]
	// NSMutableArray *marr_cpy1 = [m_arr mutableCopy];
	// PrintArray(marr_cpy1);

	// //对象复制，marr_cpy2 != m_arr，marr_cpy2[i] == m_arr[i]
	// NSArray *marr_cpy2 = [[NSArray alloc] initWithArray:m_arr];
	// PrintArray(marr_cpy2);

	//对象复制，marr_cpy3 != m_arr，marr_cpy[i] != m_arr[i]
	NSArray *marr_cpy3 = [[NSArray alloc] initWithArray:m_arr copyItems:YES];
	PrintArray(marr_cpy3);



	// NSLog(@"arr_2dim************************************************************************");
	// NSArray *arr_2dim = [NSArray arrayWithObjects:arr,m_arr,nil];
	// PrintArray2Dim(arr_2dim);

	// /**
	// marr_2dim_cpy != arr_2dim不同
	// arr_2dim_cpy[0] == arr_2dim[0]，（因为他们是NSArray，所以即便是指定copyItems，所以进行指针复制）
	// arr_2dim_cpy[1] != arr_2dim[1]
	// **/
	// NSLog(@"initWithArray:arr_2dim copyItems:YES************************************************************************");
	// NSArray *arr_2dim_cpy = [[NSArray alloc] initWithArray:arr_2dim copyItems:YES];
	// PrintArray2Dim(arr_2dim_cpy);

	// //marr_2dim_cpy1 == arr_2dim
	// NSLog(@"arr_2dim copy************************************************************************");
	// NSArray *arr_2dim_cpy1 = [arr_2dim copy];
	// PrintArray2Dim(arr_2dim_cpy1);

	// //marr_2dim_cpy2 != arr_2dim,marr_2dim_cpy2[i] == arr_2dim[i]
	// NSLog(@"arr_2dim mutableCopy************************************************************************");
	// NSArray *arr_2dim_cpy2 = [arr_2dim mutableCopy];
	// PrintArray2Dim(arr_2dim_cpy2);

	//// NSLog(@"initWithArray arr_2dim************************************************************************");
	// //NSArray *arr_2dim_cpy3 = [arr_2dim initWithArray:arr_2dim];//不知道为啥这个不能调用
	// //PrintArray2Dim(arr_2dim_cpy3);



	// 对于二维数组marr_2dim的操作，根据其成员数组的类型，以及调用的接口，决定是否对一维数组进行值复制
	// 但是不管怎么样，一维数组内的对象都不会进行复制

	NSLog(@"marr_2dim************************************************************************************");
	NSMutableArray *marr_2dim = [NSMutableArray arrayWithObjects:arr,m_arr,nil];
	PrintArray2Dim(marr_2dim);

	//对象复制，marr_2dim_cpy != marr_2dim
	NSLog(@"marr_2dim_cpy copy************************************************************************************");
	id marr_2dim_cpy = [marr_2dim copy];
	PrintArray2Dim(marr_2dim_cpy);

	//对象复制，marr_2dim_cpy1 != marr_2dim
	NSLog(@"marr_2dim_cpy mutableCopy************************************************************************************");
	NSMutableArray *marr_2dim_cpy1 = [marr_2dim mutableCopy];
	PrintArray2Dim(marr_2dim_cpy1);

	// /**
	// marr_2dim_cpy2地址与marr_2dim不同
	// marr_2dim_cpy2【0】与marr_2dim【0】不同
	// marr_2dim_cpy2【1】与marr_2dim【1】相同,（因为他们是NSArray，所以即便是指定copyItems，系统还是没有复制
	// **/
	NSLog(@"initWithArray:arr_2dim copyItems************************************************************************************");
	NSMutableArray *marr_2dim_cpy2 = [[NSMutableArray alloc] initWithArray:marr_2dim copyItems:YES];
	PrintArray2Dim(marr_2dim_cpy2);

	




	// NSLog(@"%@",arr);
	// NSLog(@"%@",arr_cpy);
	return 0;
}