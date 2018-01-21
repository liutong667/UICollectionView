//
//  NSDictionary+Ex.m
//  BaseLibrary
//
//  Created by liutong on 2017/10/25.
//  Copyright © 2017年 liutong. All rights reserved.
//

#import "NSDictionary+Ex.h"
#import <objc/runtime.h>
#import "NSObject+SafeString.h"

@implementation NSDictionary (Ex)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sns_swizzleMethod:@selector(initWithObjects:forKeys:count:) withMethod:@selector(sns_initWithObjects:forKeys:count:)];
        [self sns_swizzleClassMethod:@selector(dictionaryWithObjects:forKeys:count:) withMethod:@selector(sns_dictionaryWithObjects:forKeys:count:)];
    });
}

+ (instancetype)sns_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self sns_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (instancetype)sns_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self sns_initWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (NSString *)safeStringValueForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if (value && ![value isKindOfClass:[NSNull class]]) {
        return [NSString stringWithFormat:@"%@",value];
    } else {
        return @"";
    }
}

- (void)setSafeValue:(id)value forKey:(NSString *)key
{
    if (value && ![value isKindOfClass:[NSNull class]]) {
        [self setValue:value forKey:key];
    } else {
        [self setValue:@"" forKey:key];
    }
}

- (id)objectForKeyIgnoreNull:(id)aKey
{
    id value = [self objectForKey:aKey];
    if(!value) {
        return value;
    }
    if([value isEqual:[NSNull null]] || [[value description]isEqualToString:@""] || [[value description] isEqualToString:@"<null>"]) {
        return nil;
    }
    return value;
}

- (int)intForKey:(NSString *)key
{
    return (int)[self longForKey:key];
    
}

- (NSArray *)arrayForKey:(NSString *)key
{
    NSArray *aryReturn = [self objectForKey:key ];
    if (aryReturn && [aryReturn isKindOfClass:[NSArray class]]) {
        return aryReturn;
    }
    return nil;
}

- (BOOL)boolForKey:(NSString *)key
{
    id idObj = [self objectForKey:key];
    if(!idObj)
    {
        return NO;
    }
    NSString *strReturn = [[idObj description] lowercaseString];
    return ([strReturn isEqualToString:@"1"] || [strReturn isEqualToString:@"true"] || [strReturn isEqualToString:@"yes"])?YES:NO;
}

- (long long)longForKey:(NSString *)key
{
    NSString *strObj = [self safeStringValueForKey:key];
    @try
    {
        return [strObj longLongValue];
    }
    @catch (NSException *exception)
    {
        return 0L;
    }
}

- (double)doubleForKey:(NSString *)key
{
    NSString *strObj = [ self safeStringValueForKey:key];
    @try
    {
        return [strObj doubleValue];
    }
    @catch (NSException *exception)
    {
        return 0;
    }
}

-(NSDictionary *)dictionaryForKey:(NSString *)key
{
    id dic = [self objectForKeyIgnoreNull:key];
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)dic;
    }
    return nil;
}

@end
