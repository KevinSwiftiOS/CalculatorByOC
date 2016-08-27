//
//  Brain.m
//  计算器
//
//  Created by hznucai on 2016/8/22.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import "Brain.h"
@interface Brain ()
@property(nonatomic,strong)StackForNSObject *stack1;
@property(nonatomic,strong)StackForNSObject *stack2;
//存放逆波兰式
@property(nonatomic,strong)StackForNSObject *stack3;
//用于存放最终的值
@property(nonatomic,strong)StackForNSObject *stack4;
@property(nonatomic,assign)NSInteger length;
@end
@implementation Brain
//转化成逆波兰式
-(instancetype)init{
    if(self = [super init]){
        _stack1 = [[StackForNSObject alloc]init];
        _stack2 = [[StackForNSObject alloc]init];
        _stack3 = [[StackForNSObject alloc]init];
        _stack4 = [[StackForNSObject alloc]init];
        _length = 0;
    }
    return self;
}
-(NSMutableString *)RPExpression:(NSMutableString *)aString{
    //设字符"#"是运算级最低的，并压入s1中
    [_stack1 push:@"#"];
       NSMutableString *num = [[NSMutableString alloc]initWithString:@""];
    for(NSInteger i = 0; i < [aString length];i++){
        unichar ch1 = [aString characterAtIndex:i];
        NSMutableString *ch = [[NSMutableString alloc]initWithCharacters:&ch1 length:1];
        if([ch  isEqual: @"("]){
            [_stack2 push:num];
            num = [[NSMutableString alloc]initWithString:@""];
            [_stack1 push:@"("];
        }
        else if([ch  isEqual: @")"]){
            [_stack2 push:num];
            num = [[NSMutableString alloc]initWithString:@""];
            while (![[_stack1 TopElement]  isEqual: @"("] && ![[_stack1 TopElement]  isEqual: @"#"]) {
                NSMutableString *a = [_stack1 popTopElement];
                [_stack2 push:a];
                
            }
            [_stack1 popTopElement];
        }
        else if([ch  isEqual: @"+"] || [ch  isEqual: @"−"]){
            [_stack2 push:num];
            num = [[NSMutableString alloc]initWithString:@""];
            if([_stack1 isEmpty]){
              
                [_stack1 push:ch];
            }
            else{
                for(NSMutableString *top = [_stack1 TopElement]; ![top  isEqual: @"#"]; top = [_stack1 TopElement]) {
                    if([top  isEqual: @"("]){
                        break;
                    }
                    else{
                        NSMutableString *a = [_stack1 popTopElement];
                        [_stack2 push:a];
                    }
                }
                              [_stack1 push:ch];
            }
            _length++;
        }
        else if([ch  isEqual: @"×"] || [ch  isEqual: @"/"]){
            [_stack2 push:num];
            num = [[NSMutableString alloc]initWithString:@""];
            if([_stack1 isEmpty]){
               
                [_stack1 push:ch];
            }
            else{
                for(NSMutableString *top = [_stack1 TopElement];![top  isEqual: @"#"];top = [_stack1 TopElement]){
                    if([top  isEqual: @"("]){
                        break;
                    }
                    else{
                        NSMutableString *a = [_stack1 popTopElement];
                        [_stack2 push:a];
                    }
            }
                [_stack1 push:ch];
                
            }
            _length++;
        }
        else if([ch  isEqual: @"="]){
            [_stack2 push:num];
            num = [[NSMutableString alloc]initWithString:@""];
            
        }
        else{
           
            [num appendString:ch];
        }
        
    }
    NSMutableString *ans = [[NSMutableString alloc]initWithString:@""];
    while (![_stack1 isEmpty] && ![[_stack1 TopElement]  isEqual: @"#"]) {
        NSMutableString *a = [_stack1 popTopElement];
        [_stack2 push:a];
    }
    while (![_stack2 isEmpty]) {
        NSMutableString *a = [_stack2 popTopElement];
        if(a != nil){
        if (![a  isEqual: @""]){
            [_stack3 push:a];
    }
        }
}
    //求逆波兰式的值
    while (![_stack3 isEmpty]) {
        //操作数或者是操作符
        NSMutableString *a = [_stack3 popTopElement];
        if([a  isEqual: @"+"] || [a  isEqual: @"−"] || [a  isEqual: @"×"] || [a  isEqual: @"÷"]){
            if([a  isEqual: @"+"]){
                double num1 = [[_stack4 popTopElement]doubleValue];
                double num2 = [[_stack4 popTopElement]doubleValue];
                NSMutableString *num4 = [NSMutableString stringWithFormat:@"%.1f",num1 + num2];
                [_stack4 push:num4];
            }
            else if([a  isEqual: @"−"]){
                double num1 = [[_stack4 popTopElement]doubleValue];
                double num2 = [[_stack4 popTopElement]doubleValue];
                NSMutableString *num4 = [NSMutableString stringWithFormat:@"%.1f",num2 - num1];
                [_stack4 push:num4];
            }
            else if([a  isEqual: @"×"]){
                double num1 = [[_stack4 popTopElement]doubleValue];
                double num2 = [[_stack4 popTopElement]doubleValue];
                NSMutableString *num4 = [NSMutableString stringWithFormat:@"%.1f",num1 * num2];
                [_stack4 push:num4];
            }

            else if([a  isEqual: @"÷"]){
                double num1 = [[_stack4 popTopElement]doubleValue];
                double num2 = [[_stack4 popTopElement]doubleValue];
                NSMutableString *num4 = [NSMutableString stringWithFormat:@"%.1f",num1 / num2];
                [_stack4 push:num4];
            }
        }
        else{
            [_stack4 push:a];
        }
    }
        ans = [_stack4 popTopElement];
        return ans;
        
}
    @end

