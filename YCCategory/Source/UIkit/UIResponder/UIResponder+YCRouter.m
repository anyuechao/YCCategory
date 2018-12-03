//
//  UIResponder+YCRouter.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIResponder+YCRouter.h"

@implementation UIResponder(YCRouter)
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {

    [[self nextResponder ] routerEventWithName:eventName userInfo:userInfo];
}
@end
