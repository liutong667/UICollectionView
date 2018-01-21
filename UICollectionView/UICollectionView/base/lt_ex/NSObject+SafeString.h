//
//  NSObject+SafeString.h
//  BaseLibrary
//
//  Created by liutong on 2017/10/25.
//  Copyright © 2017年 liutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SafeString)
+ (void)load;

- (NSString *)safeString;

- (NSString *)sns_swizzleDebugDescription;

- (NSString *)jsonStringValue;

+ (BOOL)sns_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;

+ (BOOL)sns_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel;
@end
