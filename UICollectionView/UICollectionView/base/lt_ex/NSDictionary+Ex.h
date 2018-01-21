//
//  NSDictionary+Ex.h
//  BaseLibrary
//
//  Created by liutong on 2017/10/25.
//  Copyright © 2017年 liutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Ex)
- (NSString *)safeStringValueForKey:(NSString *)key;
- (void)setSafeValue:(id)value forKey:(NSString *)key;

/**
 * 忽略NSNull对象，将NSNull转化为nil。
 */
- (id)objectForKeyIgnoreNull:(id)aKey;

/**
 * 按照指定key获取int类型值
 */
-(int)intForKey:(NSString *) key;
/**
 * 按照指定key获取long类型值
 */
-(long long)longForKey:(NSString *) key;
/**
 * 按照指定key获取double类型值
 */
-(double)doubleForKey: (NSString *) key;
/**
 * 按照指定key获取bool类型值
 */
-(BOOL)boolForKey:(NSString *) key;
/**
 * 按照指定key获取Array类型值
 */
-(NSArray *)arrayForKey:(NSString *) key;
/**
 * 按照指定key获取NSDictionary类型值
 */
-(NSDictionary *)dictionaryForKey:(NSString *)key;

@end
