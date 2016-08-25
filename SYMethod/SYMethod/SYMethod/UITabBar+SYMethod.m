//
//  UITabBar+SYMethod.m
//  tourist
//
//  Created by lz on 16/4/12.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import "UITabBar+SYMethod.h"
//#import "SYBadgeButton.h"

@implementation UITabBar (SYMethod)

- (void)showBadgeWithIndex:(NSUInteger)index andDiametral:(CGFloat)diametral {
    [self hiddenBadge];
    UIControl *badgeBtn = self.subviews[index];
    for (UIView *subview in badgeBtn.subviews) {
        if ([NSStringFromClass(subview.class) isEqualToString:@"UITabBarSwappableImageView"]) {
            CALayer *badgeLayer = [[CALayer alloc] init];
            badgeLayer.frame = CGRectMake(0, 0, 10, 10);
            badgeLayer.frame = CGRectMake(subview.frame.size.width - diametral * 0.2, -diametral * 0.4, diametral, diametral);
            badgeLayer.backgroundColor = [UIColor redColor].CGColor;
            badgeLayer.cornerRadius = diametral * 0.5;
            badgeLayer.masksToBounds = YES;
            [subview.layer addSublayer:badgeLayer];
        }
    }
}

- (void)hiddenBadge {
    for (UIControl *subControl in self.subviews) {
        for (UIView *subview in subControl.subviews) {
            if ([NSStringFromClass(subview.class) isEqualToString:@"UITabBarSwappableImageView"]) {
                if (subview.layer.sublayers.count > 0) {
                    [subview.layer.sublayers.firstObject removeFromSuperlayer];
                }
            }
        }
    }
}
@end
