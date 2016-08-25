//
//  UIImage+SYMethod.h
//  tourist
//
//  Created by lz on 16/2/3.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SYMethod)
// 压缩图片尺寸
- (UIImage *)setImagesSize:(CGSize)size;
/**
 *  添加水印，分宽高两种
 *
 *  @param logo  要添加的LOGO图案
 *  @param scale LOG图案沾总图的宽或者高的比例0.0~1.0
 *
 *  @return 新生成的图片
 */
- (UIImage *)addImageLogo:(UIImage *)logo withScale:(CGFloat)scale;
/**
 *  添加水印，按宽的比例
 *
 *  @param logo  要添加的LOGO图案
 *  @param scale LOG图案沾总图的宽的比例0.0~1.0
 *
 *  @return 新生成的图片
 */
- (UIImage *)addImageLogo:(UIImage *)logo withWidthScale:(CGFloat)scale;
@end
