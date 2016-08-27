//
//  ViewController.h
//  计算器
//
//  Created by hznucai on 2016/8/22.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Brain.h"
@interface ViewController : UIViewController
@property(nonatomic,strong)IBOutlet UILabel *showLabel;
//点击添加要执行的字符串
-(IBAction)addString:(UIButton *)btn;
//按等号后进行计算 并输出
-(IBAction)toCalculator:(UIButton *)btn;

@end

