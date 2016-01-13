//
//  ViewController.m
//  WindowTopMessageTip
//
//  Created by 张齐朴 on 16/1/13.
//  Copyright © 2016年 张齐朴. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extend.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.frame     = CGRectMake(0, 0, 50, 50);
    button.center    = self.view.center;
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)sender
{
    [self showTopTipsWithText:@"Top message tip"];
}

- (void)showTopTipsWithText:(NSString *)text
{
    if (text == nil)
        return ;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    UIView *view = [keyWindow viewWithTag:999];
    UILabel *label;
    
    if (view) {
        for (UIView *v in view.subviews) {
            if ([v isKindOfClass:[UILabel class]]) {
                ((UILabel *)v).text = text;
            }
        }
        return ;
    }
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    view.tag = 999;
    view.backgroundColor = [UIColor redColor]; // tip背景颜色
    view.layer.masksToBounds = YES;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    label.tag = 999;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor whiteColor];    // 文字颜色
    [view addSubview:label];
    
    [keyWindow addSubview:view];
    
    label.text = text;
    
    if (view.height == 0) {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *w in windows) {
            w.windowLevel = UIWindowLevelStatusBar;   // 隐藏状态栏
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            view.height = 20;
        }];
        
        [UIView animateWithDuration:0.3 delay:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
            view.height = 0;
        } completion:^(BOOL finished) {
            NSArray *windows = [[UIApplication sharedApplication] windows];
            for (UIWindow *w in windows) {
                w.windowLevel = UIWindowLevelNormal;   // 显示状态栏
            }
            
            [view removeFromSuperview];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
