//
//  NSObject+SafeString.m
//  BaseLibrary
//
//  Created by liutong on 2017/10/25.
//  Copyright © 2017年 liutong. All rights reserved.
//

#import "NSObject+SafeString.h"
#import <objc/runtime.h>

@implementation NSObject (SafeString)
+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(debugDescription)), class_getInstanceMethod([self class], @selector(sns_swizzleDebugDescription)));
}
//- (NSString *)sns_swizzleDebugDescription {
//
//    if (![self isKindOfClass:[SNSBaseEntity class]]) {
//        return [self sns_swizzleDebugDescription];
//    }
//
//    NSMutableDictionary *dictoinary = [NSMutableDictionary dictionary];
//    uint count;
//    objc_property_t *properties = class_copyPropertyList([self class], &count);
//
//    for (int i = 0 ; i < count ; i++) {
//        objc_property_t property = properties[i];
//        NSString *name = @(property_getName(property));
//        id value = [self valueForKey:name] ?:@"nil";
//        [dictoinary setObject:value forKey:name];
//    }
//    free(properties);
//    return [NSString stringWithFormat:@"<%@:%p> -- %@",[self class],self,dictoinary];
//}

+ (BOOL)sns_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel {
    Method origMethod = class_getInstanceMethod(self, origSel);
    Method altMethod = class_getInstanceMethod(self, altSel);
    if (!origMethod || !altMethod) {
        return NO;
    }
    class_addMethod(self,
                    origSel,
                    class_getMethodImplementation(self, origSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel,
                    class_getMethodImplementation(self, altSel),
                    method_getTypeEncoding(altMethod));
    method_exchangeImplementations(class_getInstanceMethod(self, origSel),
                                   class_getInstanceMethod(self, altSel));
    return YES;
}

+ (BOOL)sns_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel {
    return [object_getClass((id)self) sns_swizzleMethod:origSel withMethod:altSel];
}

- (NSString *)safeString
{
    if ([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    } else {
        return (NSString *)[NSString stringWithFormat:@"%@",self];
    }
}

- (NSString *)jsonStringValue
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
