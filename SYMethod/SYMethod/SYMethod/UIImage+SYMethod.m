//
//  UIImage+SYMethod.m
//  tourist
//
//  Created by lz on 16/2/3.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import "UIImage+SYMethod.h"

@implementation UIImage (SYMethod)
- (UIImage *)setImagesSize:(CGSize)size
{
    UIImage *image = [[UIImage alloc] init];
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)addImageLogo:(UIImage *)logo withScale:(CGFloat)scale
{
    UIImage *image = [[UIImage alloc] init];
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0.0);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGFloat logoW,logoH;
    
    if (0 != scale) {
        CGFloat proportion = logo.size.height / logo.size.width;
        if (self.size.width > self.size.height) {
            logoW = self.size.width * scale;
            logoH = logoW * proportion;
        } else {
            logoH = self.size.height * scale;
            logoW = logoH / proportion;
        }
    } else {
        logoW = logo.size.width;
        logoH = logo.size.height;
    }
    
    CGFloat logoX = self.size.width - logoW;
    CGFloat logoY = self.size.height - logoH;
    [logo drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)addImageLogo:(UIImage *)logo withWidthScale:(CGFloat)scale
{
    UIImage *image = [[UIImage alloc] init];
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0.0);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGFloat logoW,logoH;
    CGFloat proportion = logo.size.height / logo.size.width;
    logoW = self.size.width * scale;
    logoH = logoW * proportion;
    
    CGFloat logoX = self.size.width - logoW;
    CGFloat logoY = self.size.height - logoH;
    [logo drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
