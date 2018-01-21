//
//  UIColor+Hex.m
//  BaseLibrary
//
//  Created by liutong on 2018/1/21.
//  Copyright © 2018年 liutong. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    hexString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    UIColor *defaultColor = [UIColor clearColor];
    
    if (hexString.length < 6) return defaultColor;
    if ([hexString hasPrefix:@"#"]) hexString = [hexString substringFromIndex:1];
    if ([hexString hasPrefix:@"0X"]) hexString = [hexString substringFromIndex:2];
    if (hexString.length != 6) return defaultColor;
    
    //method1
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned int hexNumber;
    if (![scanner scanHexInt:&hexNumber]) return defaultColor;
    
    //    //method2
    //    const char *char_str = [hexString cStringUsingEncoding:NSASCIIStringEncoding];
    //    int hexNum;
    //    sscanf(char_str, "%x", &hexNum);
    
    return [UIColor colorWithHex:hexNumber alpha:alpha];
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (UIColor*)whiteColorWithAlpha:(CGFloat)alphaValue
{
    return [UIColor colorWithHex:0xffffff alpha:alphaValue];
}

+ (UIColor*)blackColorWithAlpha:(CGFloat)alphaValue
{
    return [UIColor colorWithHex:0x000000 alpha:alphaValue];
}
- (UIImage *)createImageWithRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark - color

+ (UIColor *)yellow_1
{
    return [UIColor colorWithHex:0xfdd536];
}
+ (UIColor *)yellow_2
{
    return [UIColor colorWithHex:0xffbc2f];
}
+ (UIColor *)yellow_3
{
    return [UIColor colorWithHex:0xe7c332];
}
+ (UIColor *)yellowNight_1
{
    return [UIColor colorWithHex:0x7f5d17];
}
+ (UIColor *)yellowNight_2
{
    return [UIColor colorWithHex:0x7e6a1a];
}
+ (UIColor *)yellowNight_3
{
    return [UIColor colorWithHex:0x736118];
}

+ (UIColor *)red_1
{
    return [UIColor colorWithHex:0xee2f10];
}
+ (UIColor *)red_2
{
    return [UIColor colorWithHex:0xff644b];
}
+ (UIColor *)red_3
{
    return [UIColor colorWithHex:0xed5d49];
}
+ (UIColor *)redNight_1
{
    return [UIColor colorWithHex:0x6e2a2a];
}
+ (UIColor *)redNight_2
{
    return [UIColor colorWithHex:0x7f3125];
}
+ (UIColor *)redNight_3
{
    return [UIColor colorWithHex:0x762e24];
}

+ (UIColor *)blue_1
{
    return [UIColor colorWithHex:0x3d5699];
}
+ (UIColor *)blue_2
{
    return [UIColor colorWithHex:0x3b87f9];
}
+ (UIColor *)blueNight_1
{
    return [UIColor colorWithHex:0x374669];
}
+ (UIColor *)blueNight_2
{
    return [UIColor colorWithHex:0x1d437c];
}

+ (UIColor *)black_1
{
    return [UIColor colorWithHex:0x000000];
}
+ (UIColor *)black_2
{
    return [UIColor colorWithHex:0x161616];
}
+ (UIColor *)black_3
{
    return [UIColor colorWithHex:0x3a3a3a];
}
+ (UIColor *)black_4
{
    return [UIColor colorWithHex:0x454545];
}
+ (UIColor *)black_5
{
    return [UIColor colorWithHex:0x929292];
}
+ (UIColor *)black_6
{
    return [UIColor colorWithHex:0xb1b1b1];
}
+ (UIColor *)black_7
{
    return [UIColor colorWithHex:0xdadada];
}
+ (UIColor *)black_8
{
    return [UIColor colorWithHex:0xe4e4e4];
}
+ (UIColor *)black_9
{
    return [UIColor colorWithHex:0xf1f1f1];
}
+ (UIColor *)black_10
{
    return [UIColor colorWithHex:0xf2f2f2];
}
+ (UIColor *)black_11
{
    return [UIColor colorWithHex:0xffffff];
}
+ (UIColor *)black_12
{
    return [UIColor colorWithHex:0xe6e7e8];
}
+ (UIColor *)blackNight_1
{
    return [UIColor colorWithHex:0x7a7a7a];
}
+ (UIColor *)blackNight_2
{
    return [UIColor colorWithHex:0x161616];
}
+ (UIColor *)blackNight_3
{
    return [UIColor colorWithHex:0x3a3a3a];
}
+ (UIColor *)blackNight_4
{
    return [UIColor colorWithHex:0x707070];
}
+ (UIColor *)blackNight_5
{
    return [UIColor colorWithHex:0x606060];
}
+ (UIColor *)blackNight_6
{
    return [UIColor colorWithHex:0x4e4e4e];
}
+ (UIColor *)blackNight_7
{
    return [UIColor colorWithHex:0x343434];
}
+ (UIColor *)blackNight_8
{
    return [UIColor colorWithHex:0x313131];
}
+ (UIColor *)blackNight_9
{
    return [UIColor colorWithHex:0x2e2e2e];
}
+ (UIColor *)blackNight_10
{
    return [UIColor colorWithHex:0x2a2a2a];
}
+ (UIColor *)blackNight_11
{
    return [UIColor colorWithHex:0x232323];
}
+ (UIColor *)blackNight_12
{
    return [UIColor colorWithHex:0x181818];
}

+ (UIColor *)yellowTheme_1
{
    return IsNight?[UIColor yellowNight_1]:[UIColor yellow_1];
}
+ (UIColor *)yellowTheme_2
{
    return IsNight?[UIColor yellowNight_2]:[UIColor yellow_2];
}
+ (UIColor *)yellowTheme_3
{
    return IsNight?[UIColor yellowNight_3]:[UIColor yellow_3];
}
+ (UIColor *)redTheme_1
{
    return IsNight?[UIColor redNight_1]:[UIColor red_1];
}
+ (UIColor *)redTheme_2
{
    return IsNight?[UIColor redNight_2]:[UIColor red_2];
}
+ (UIColor *)redTheme_3
{
    return IsNight?[UIColor redNight_3]:[UIColor red_3];
}
+ (UIColor *)blueTheme_1
{
    return IsNight?[UIColor blueNight_1]:[UIColor blue_1];
}
+ (UIColor *)blueTheme_2
{
    return IsNight?[UIColor blueNight_2]:[UIColor blue_2];
}
+ (UIColor *)blackTheme_1
{
    return IsNight?[UIColor blackNight_1]:[UIColor black_1];
}
+ (UIColor *)blackTheme_2
{
    return IsNight?[UIColor blackNight_2]:[UIColor black_2];
}
+ (UIColor *)blackTheme_3
{
    return IsNight?[UIColor blackNight_3]:[UIColor black_3];
}
+ (UIColor *)blackTheme_4
{
    return IsNight?[UIColor blackNight_4]:[UIColor black_4];
}
+ (UIColor *)blackTheme_5
{
    return IsNight?[UIColor blackNight_5]:[UIColor black_5];
}
+ (UIColor *)blackTheme_6
{
    return IsNight?[UIColor blackNight_6]:[UIColor black_6];
}
+ (UIColor *)blackTheme_7
{
    return IsNight?[UIColor blackNight_7]:[UIColor black_7];
}
+ (UIColor *)blackTheme_8
{
    return IsNight?[UIColor blackNight_8]:[UIColor black_8];
}
+ (UIColor *)blackTheme_9
{
    return IsNight?[UIColor blackNight_9]:[UIColor black_9];
}
+ (UIColor *)blackTheme_10
{
    return IsNight?[UIColor blackNight_10]:[UIColor black_10];
}
+ (UIColor *)blackTheme_11
{
    return IsNight?[UIColor blackNight_11]:[UIColor black_11];
}
+ (UIColor *)blackTheme_12
{
    return IsNight?[UIColor blackNight_12]:[UIColor black_12];
}
+ (UIColor *)blackTheme_13
{
    return IsNight?[UIColor blackNight_10]:[UIColor black_12];
}

+ (UIColor *)haveFeedThemeBGColor {
    return IsNight? [UIColor colorWithHex:0x181818]:[UIColor black_7];
}
+ (UIColor *)controllerThemeBGColor{
    return IsNight? [UIColor colorWithHex:0x181818]:[UIColor black_9];
}

+ (UIColor *)feedLineThemeColor
{
    return [UIColor colorWithHex:IsNight ? 0x181818 : 0xe7e8e9];
}
@end
