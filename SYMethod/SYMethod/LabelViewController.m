//
//  LabelViewController.m
//  SYMethod
//
//  Created by lz on 16/8/25.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "LabelViewController.h"

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
}

@end
