//
//  StackForNSObject.m
//  计算器
//
//  Created by hznucai on 2016/8/22.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import "StackForNSObject.h"
@interface StackForNSObject()
//maxSize
@property(nonatomic,assign)NSInteger masSize;

//top of the stack
@property(nonatomic,assign)NSInteger top;
//stack
@property(nonatomic,weak)StackBlock stackBlock;
@end
@implementation StackForNSObject
//初始化
//入栈
-(instancetype)init{
    if(self = [ super init]){
        _stackArray = [NSMutableArray array];
    }
    return self;
}
-(void)push:(id)object{
    [self.stackArray addObject:object];
}
//出栈
-(id)popTopElement{
    id objc = [self.stackArray lastObject];
    [self.stackArray removeLastObject];
    return objc;
}
//返回栈顶的元素
-(id)TopElement{
    return [self.stackArray lastObject];
}
//是否为空
-(BOOL)isEmpty{
    if(self.stackArray.count > 0)
        return false;
    else
        return true;
}
//栈的长度
-(NSInteger)stackLength{
    return self.stackArray.count;
}
//从底部开始遍历
-(void)traversalElementFromBottom:(StackBlock)block{
    NSEnumerator *objc = [self.stackArray objectEnumerator];
    for(id element in objc){
        block(element);
    }
}
//从顶部开始遍历
-(void)traversalElementFromTop:(StackBlock)block{
    //先获取存储元素的个数
    NSInteger count = self.stackArray.count;
    for(NSInteger i = count; i > 0; i--){
        //处理最后一个元素
        block([self.stackArray objectAtIndex:i]);
    }
}
//所有元素出栈 同时遍历
-(void)traversalElementPopStack:(StackBlock)block{
    //先获取存储元素的个数
    NSInteger count = self.stackArray.count;
    for(NSInteger i = count; i > 0; i--){
        //处理最后一个元素
        block(self.stackArray.lastObject);
        [self.stackArray removeLastObject];
    }
}
//清空
-(void)removeAllObjects{
    [self.stackArray removeAllObjects];
}
//懒加载
-(NSMutableArray *)stackArray{
    if(_stackArray == nil){
        _stackArray = [NSMutableArray array];
    }
    return  _stackArray;
}
-(NSInteger)top{
    _top = self.stackArray.count;
    return  _top;
}
//不存在该对象的时候 自动清空
-(void)dealloc{
    [self.stackArray removeAllObjects];
}
@end
