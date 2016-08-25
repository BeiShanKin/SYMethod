//
//  LabelViewController.m
//  SYMethod
//
//  Created by lz on 16/8/25.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "LabelViewController.h"
#import "UILabel+SYMethod.h"

@interface LabelViewController ()

@end

@implementation LabelViewController
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化

- (void)setupView {
    self.title = @"Category";
    
    NSArray *labelTexts = @[@"两端对齐的Lable", @"暂时只支持一行使用", @"真的"];
    CGFloat naviBarHeight = self.navigationController.navigationBar.bounds.size.height;
    for (NSInteger i = 0; i < labelTexts.count; i++) {
        UILabel *showLabel = [UILabel new];
        showLabel.frame = CGRectMake(SCREEN_W * 0.1, naviBarHeight + 20 + 20 * i, SCREEN_W * 0.8, 20);
        showLabel.text = labelTexts[i];
        [showLabel alignmentRightandLeft];
        [self.view addSubview:showLabel];
    }
}

@end
