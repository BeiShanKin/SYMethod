//
//  CALayer+SYMethod.m
//  tourist
//
//  Created by lz on 16/5/9.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import "CALayer+SYMethod.h"
#import <objc/runtime.h>

static void *BadgeKey = &BadgeKey;

@implementation CALayer (SYMethod)

- (void)setBadgeLayer:(CALayer *)badgeLayer {
    objc_setAssociatedObject(self, BadgeKey, badgeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CALayer *)badgeLayer {
    return objc_getAssociatedObject(self, BadgeKey);
}

- (void)showBadgeWithDiametral:(CGFloat)diametral {
    [self hiddenBadge];
    CALayer *badgeLayer = [[CALayer alloc] init];
    badgeLayer.frame = CGRectMake(self.bounds.size.width - diametral * 0.7, -diametral * 0.3, diametral, diametral);
    badgeLayer.backgroundColor = [UIColor redColor].CGColor;
    badgeLayer.cornerRadius = diametral * 0.5;
    badgeLayer.masksToBounds = YES;
    [self addSublayer:badgeLayer];
    self.masksToBounds = NO;
    self.badgeLayer = badgeLayer;
}

- (void)showBadgeWithBadgeFrame:(CGRect)frame {
    [self hiddenBadge];
    CALayer *badgeLayer = [[CALayer alloc] init];
    badgeLayer.frame = frame;
    badgeLayer.backgroundColor = [UIColor redColor].CGColor;
    badgeLayer.cornerRadius = frame.size.width * 0.5;
    badgeLayer.masksToBounds = YES;
    [self addSublayer:badgeLayer];
    self.masksToBounds = NO;
    self.badgeLayer = badgeLayer;
}

- (void)hiddenBadge {
    [self.badgeLayer removeFromSuperlayer];
    self.badgeLayer = nil;
}
@end
