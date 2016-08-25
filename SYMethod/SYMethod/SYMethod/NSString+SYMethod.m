//
//  NSString+SYMethod.m
//  tourist
//
//  Created by lz on 16/1/27.
//  Copyright © 2016年 com.bravesoft. All rights reserved.
//

#import "NSString+SYMethod.h"
#import <CommonCrypto/CommonDigest.h>
#import <AVFoundation/AVFoundation.h>

@implementation NSString (SYMethod)
+ (NSString *)stringByArray:(NSArray<NSString *> *)array andSeparatedSign:(NSString *)separatedSign
{
    if (!separatedSign) {
        separatedSign = @"";
    }
    
    NSMutableString *resultString = [NSMutableString string];
    for (int i = 0;i < array.count;i++) {
        NSString *cityName = array[i];
        if (i != array.count - 1) {
            [resultString appendFormat:@"%@%@",cityName,separatedSign];
        } else {
            [resultString appendString:cityName];
        }
    }
    return resultString.copy;
}

+ (NSString *)getAfterName:(NSString *)name withSymbol:(NSString *)symbol
{
    NSRange range = [name rangeOfString:symbol options:NSBackwardsSearch];
    return [name substringFromIndex:range.location + 1];
}


+ (NSString *)getFrontName:(NSString *)name withSymbol:(NSString *)symbol
{
    NSRange range = [name rangeOfString:symbol options:NSBackwardsSearch];
    return [name substringToIndex:range.location];
}

- (NSString *)MD5 {
    const char *pointer = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(pointer, (CC_LONG)strlen(pointer), md5Buffer);
    
    NSMutableString *string =
    [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [string appendFormat:@"%02x", md5Buffer[i]];
    
    return string;
}

-(UIImage *)createRRcode
{
    //1.实例化一个滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //1.1>设置filter的默认值
    //因为之前如果使用过滤镜，输入有可能会被保留，因此，在使用滤镜之前，最好恢复默认设置
    [filter setDefaults];
    
    //2将传入的字符串转换为NSData
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    //3.将NSData传递给滤镜（通过KVC的方式，设置inputMessage）
    [filter setValue:data forKey:@"inputMessage"];
    
    //4.由filter输出图像
    CIImage *outputImage = [filter outputImage];
    
    //5.将CIImage转换为UIImage
    UIImage *qrImage = [UIImage imageWithCIImage:outputImage];
    
    //6.返回二维码图像
    return qrImage;
}

-(UIImage *)getHDRcodeWithScale:(CGFloat)scale
{
    CIImage *image = [self createRRcode].CIImage;
    
    CGRect extent = CGRectIntegral(image.extent);
//    CGFloat scale = MIN(scale/CGRectGetWidth(extent), scale/CGRectGetHeight(extent));
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
    return image;
}

@end
