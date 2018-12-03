//
//  UIViewController+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIViewController+YCCategory.h"
#import "YCPersentAnimator.h"

@implementation UIViewController(YCCategory)
- (void)yc_presentPushEffect:(nonnull UIViewController *)viewController completion:(YCNoArgsBlock)completion {
    YCPersentAnimator *effect = [YCPersentAnimator shared];
    effect.presentStyle = UIPresentCoverVertical;
    viewController.transitioningDelegate = effect;
    [self presentViewController:viewController animated:YES completion:completion];
}

- (void)yc_presentFlipEffect:(UIViewController *)viewController completion:(YCNoArgsBlock)completion {
    viewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:viewController animated:YES completion:completion];
}

- (void)dismiss {
    if (self.navigationController.childViewControllers.firstObject == self) {
        [self dismissViewControllerAnimated:YES completion:nil];
        [UINavigationBar appearance].translucent = NO;
    } else {
        if (self.navigationController != nil) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

//- (void)judgeDeviceOrientationPortrait{
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//        SEL selector = NSSelectorFromString(@"setOrientation:");
//        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
//        [invocation setSelector:selector];
//        [invocation setTarget:[UIDevice currentDevice]];
//        int val = 0;
//        if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
//        }else{
//            val = UIInterfaceOrientationPortrait;
//            [invocation setArgument:&val atIndex:2];
//        }
//        [invocation invoke];
//    }
//}
@end
