//
//  ViewController.m
//  计算器
//
//  Created by hznucai on 2016/8/22.
//  Copyright © 2016年 hznucai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableString *showString;
@end

@implementation ViewController

- (void)viewDidLoad {
    _showString = [[NSMutableString alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击添加要执行的字符串
-(IBAction)addString:(UIButton *)btn{
    NSString *tempString = [btn titleForState:UIControlStateNormal];
    [_showString appendString:tempString];
    //NSLog(@"%@",_showString);
    _showLabel.text = _showString;
   
}
//按等号后进行计算 并输出
-(IBAction)toCalculator:(UIButton *)btn{
    //进行计算和输出
    Brain *brain = [Brain new];
    
    [_showString appendString:@"="];
    NSMutableString *final = [brain RPExpression:_showString];
    _showString = [[NSMutableString alloc]initWithString:@""];
    _showLabel.text = final;
}
@end
