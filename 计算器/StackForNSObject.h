//
//  StackForNSObject.h
//  计算器
//
//  Created by hznucai on 2016/8/22.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import <Foundation/Foundation.h>
//只要参数是一个id类型的block
typedef void (^StackBlock)(id objc);
@interface StackForNSObject : NSObject
//有入栈就有出栈 使用强引用，就要记得释放引用
@property(nonatomic,strong)NSMutableArray *stackArray;
//入栈
-(void)push:(id)object;
//出栈
-(id)popTopElement;
//返回栈顶的元素
-(id)TopElement;
//是否为空
-(BOOL)isEmpty;
//栈的长度
-(NSInteger)stackLength;
//遍历 从栈底开始遍历;
-(void)traversalElementFromBottom:(StackBlock)block;
//从顶部开始遍历
-(void)traversalElementFromTop:(StackBlock)block;
//所有元素出栈 一边出栈一边返回元素
-(void)traversalElementPopStack:(StackBlock)block;
//清空
-(void)removeAllObjects;

@end
