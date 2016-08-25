//
//  UILabel+SYMethod.m
//  tourist
//
//  Created by lz on 16/1/27.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import "UILabel+SYMethod.h"
#import <CoreText/CoreText.h>

@implementation UILabel (SYMethod)
- (void)alignmentRightandLeft
{
    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.font} context:nil].size;
    CGFloat margin = (self.frame.size.width - textSize.width) / (self.text.length - 1);
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributeString addAttribute:(id)kCTKernAttributeName value:number range:NSMakeRange(0, self.text.length - 1)];
    self.attributedText = attributeString;
}
@end
