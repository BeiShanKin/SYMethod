//
//  CALayer+SYMethod.h
//  tourist
//
//  Created by lz on 16/5/9.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (SYMethod)
@property (weak, nonatomic) CALayer *badgeLayer;
/**
 *  显示badge
 *
 *  @param diametral badge的直径
 */
- (void)showBadgeWithDiametral:(CGFloat)diametral;

- (void)showBadgeWithBadgeFrame:(CGRect)frame;
/**
 *  隐藏badge
 */
- (void)hiddenBadge;
@end
