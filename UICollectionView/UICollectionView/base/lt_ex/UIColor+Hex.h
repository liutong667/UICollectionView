//
//  UIColor+Hex.h
//  BaseLibrary
//
//  Created by liutong on 2018/1/21.
//  Copyright © 2018年 liutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
+ (UIColor*)whiteColorWithAlpha:(CGFloat)alphaValue;
+ (UIColor*)blackColorWithAlpha:(CGFloat)alphaValue;
- (UIImage *)createImageWithRect:(CGRect)rect;

/**
 颜色规范
 */
+ (UIColor *)yellow_1;
+ (UIColor *)yellow_2;
+ (UIColor *)yellow_3;
+ (UIColor *)yellowNight_1;
+ (UIColor *)yellowNight_2;
+ (UIColor *)yellowNight_3;

+ (UIColor *)red_1;
+ (UIColor *)red_2;
+ (UIColor *)red_3;
+ (UIColor *)redNight_1;
+ (UIColor *)redNight_2;
+ (UIColor *)redNight_3;

+ (UIColor *)blue_1;
+ (UIColor *)blue_2;
+ (UIColor *)blueNight_1;
+ (UIColor *)blueNight_2;

+ (UIColor *)black_1;
+ (UIColor *)black_2;
+ (UIColor *)black_3;
+ (UIColor *)black_4;
+ (UIColor *)black_5;
+ (UIColor *)black_6;
+ (UIColor *)black_7;
+ (UIColor *)black_8;
+ (UIColor *)black_9;
+ (UIColor *)black_10;
+ (UIColor *)black_11;
+ (UIColor *)black_12;
+ (UIColor *)blackNight_1;
+ (UIColor *)blackNight_2;
+ (UIColor *)blackNight_3;
+ (UIColor *)blackNight_4;
+ (UIColor *)blackNight_5;
+ (UIColor *)blackNight_6;
+ (UIColor *)blackNight_7;
+ (UIColor *)blackNight_8;
+ (UIColor *)blackNight_9;
+ (UIColor *)blackNight_10;
+ (UIColor *)blackNight_11;
+ (UIColor *)blackNight_12;

+ (UIColor *)yellowTheme_1;
+ (UIColor *)yellowTheme_2;
+ (UIColor *)yellowTheme_3;
+ (UIColor *)redTheme_1;
+ (UIColor *)redTheme_2;
+ (UIColor *)redTheme_3;
+ (UIColor *)blueTheme_1;
+ (UIColor *)blueTheme_2;
+ (UIColor *)blackTheme_1;
+ (UIColor *)blackTheme_2;
+ (UIColor *)blackTheme_3;
+ (UIColor *)blackTheme_4;
+ (UIColor *)blackTheme_5;
+ (UIColor *)blackTheme_6;
+ (UIColor *)blackTheme_7;
+ (UIColor *)blackTheme_8;
+ (UIColor *)blackTheme_9;
+ (UIColor *)blackTheme_10;
+ (UIColor *)blackTheme_11;
+ (UIColor *)blackTheme_12;
+ (UIColor *)blackTheme_13;
//controller 的背景颜色
+ (UIColor *)haveFeedThemeBGColor;
+ (UIColor *)controllerThemeBGColor;

+ (UIColor *)feedLineThemeColor;
@end
