//
//  Brain.h
//  计算器
//
//  Created by hznucai on 2016/8/22.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackForNSObject.h"
@interface Brain : NSObject
-(NSMutableString *)RPExpression:(NSMutableString *)aString;
@end
