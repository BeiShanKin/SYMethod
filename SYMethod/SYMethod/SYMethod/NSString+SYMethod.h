//
//  NSString+SYMethod.h
//  tourist
//
//  Created by lz on 16/1/27.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SYMethod)
// 把数组中的字符串拼接成一个字符串
+ (NSString *)stringByArray:(NSArray<NSString *> *)array andSeparatedSign:(NSString *)separatedSign;
// 根据分隔符取得字符串前段
+ (NSString *)getFrontName:(NSString *)name withSymbol:(NSString *)symbol;
// 根据分隔符取得字符串后段
+ (NSString *)getAfterName:(NSString *)name withSymbol:(NSString *)symbol;
// 对字符串进行MD5加密
- (NSString *)MD5;
// 生成二维码
-(UIImage *)createRRcode;
// 获取高清版二维码
-(UIImage *)getHDRcodeWithScale:(CGFloat)scale;
@end
