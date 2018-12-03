//
//  UIViewController+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^__nullable YCNoArgsBlock)(void);
NS_ASSUME_NONNULL_BEGIN
@interface UIViewController(YCCategory)
/**
 push效果的present跳转

 - parameter viewController: 跳转的控制器
 - parameter completion:     回调
 */
- (void)yc_presentPushEffect:(UIViewController *)viewController completion:(YCNoArgsBlock)completion;

/**
 旋转效果的present跳转

 - parameter viewController: 跳转的控制器
 - parameter completion:     回调
 */
- (void)yc_presentFlipEffect:(UIViewController *)viewController completion:(YCNoArgsBlock)completion;


/**
 根据是否当前控制器是否为栈顶控制器来决定dismiss还是pop
 */
- (void)dismiss;

///**
// *   始终竖屏
// */
//- (void)judgeDeviceOrientationPortrait;

@end
NS_ASSUME_NONNULL_END
