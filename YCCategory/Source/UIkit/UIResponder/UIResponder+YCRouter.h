//
//  UIResponder+YCRouter.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder(YCRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end