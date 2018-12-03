//
//  NSObject+YCInvocation.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject(YCInvocation)
- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;

- (NSInvocation *)createInvocationWithSelector:(SEL)aSelector;
@end

