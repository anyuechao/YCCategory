//
//  NSObject+YCInvocation.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "NSObject+YCInvocation.h"

@implementation NSObject(YCInvocation)
- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects {
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if (signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:aSelector];
        for (int i = 0; i < [objects count]; i++) {
            id obj = [objects objectAtIndex:i];
            [invocation setArgument:&obj atIndex:(i + 2)];
        }
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObj;
            [invocation getReturnValue:&anObj];
            return anObj;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

- (NSInvocation *)createInvocationWithSelector:(SEL)aSelector{
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:self];
    [invocation setSelector:aSelector];
    return invocation;
}
@end
