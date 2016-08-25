//
//  BaseTabBarController.m
//  SYMethod
//
//  Created by lz on 16/8/25.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化

- (void)setupTabItem {
    self.tabBar.tintColor = [UIColor blackColor];
    NSArray *titles = @[@"Category", @"CustomView", @"FrameWork"];
    for (NSInteger i = 0; i < self.viewControllers.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        NSString *title = titles[i];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:nil selectedImage:nil];
    }
}
@end
