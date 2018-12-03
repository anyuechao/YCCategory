//
//  UIAlertController+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIAlertController+YCCategory.h"

@implementation UIAlertController(YCCategory)

+ (instancetype)yc_alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle action:(nullable UIAlertAction *)action otherAction:(nullable UIAlertAction *)otherAction {
    UIAlertController *alerController = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    // 取消的action
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    if (preferredStyle == UIAlertControllerStyleAlert && !action && !otherAction) {
        // 只有取消
        [alerController addAction:cancleAction];
    }else if (preferredStyle == UIAlertControllerStyleAlert && !otherAction) {
        // 只有取消和确定
        [alerController addAction:cancleAction];
        [alerController addAction:action];
    }else if (preferredStyle == UIAlertControllerStyleAlert && action && otherAction) {
        // 两个按钮都有事件
        [alerController addAction:action];
        [alerController addAction:otherAction];
    }else if (preferredStyle == UIAlertControllerStyleActionSheet && action && otherAction) {
        // 带取消的sheet
        [alerController addAction:action];
        [alerController addAction:otherAction];
        [alerController addAction:cancleAction];
    }
    return alerController;
}

+ (nonnull instancetype)createAlertControllerWithTitle:(nullable NSString *)title
                                               message:(nullable NSString *)message
                                  alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle
                                     cancelActionTitle:(nullable NSString *)cancelActionTitle
                                     cancelActionStyle:(UIAlertActionStyle)cancelActionStyle
                           cancelAtionCompletionHandle:(void (^_Nullable)(UIAlertAction * _Nullable action))cancelAtionCompletionHandle
                                      otherActionTitle:(nullable NSString *)otherActionTitle
                                      otherActionStyle:(UIAlertActionStyle)otherActionStyle
                            otherAtionCompletionHandle:(void (^_Nullable)(UIAlertAction * _Nullable action))otherAtionCompletionHandle
{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelActionTitle style:cancelActionStyle handler:cancelAtionCompletionHandle];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherActionTitle style:otherActionStyle handler:otherAtionCompletionHandle];
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIApplication sharedApplication].delegate window].rootViewController presentViewController:alertController animated:NO completion:nil];
    });
    return alertController;
}

+ (nonnull instancetype)createAlertControllerWithActionCompletionHandle:(void (^_Nullable)(UIAlertAction * _Nullable action))actionCompletionHandle
                                                                  Title:(NSString *_Nullable)title
                                                                message:(NSString *_Nullable)message
                                                   alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle
                                                      cancelActionTitle:(NSString *_Nullable)cancelActionTitle
                                                      cancelActionStyle:(UIAlertActionStyle)cancelActionStyle
                                                      otherButtonTitles:(NSString *_Nullable)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelActionTitle style:cancelActionStyle handler:actionCompletionHandle];
    [alertController addAction:cancelAction];
    NSString *other = nil;
    va_list args;//是一个字符指针，可以理解为指向当前参数的一个指针，取参必须通过这个指针进行
    if (otherButtonTitles){
        va_start(args, otherButtonTitles);

        while((other = va_arg(args, NSString *))){
            [alertController addAction:[UIAlertAction actionWithTitle:other style:UIAlertActionStyleDefault handler:actionCompletionHandle]];
        }
        va_end(args);
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIApplication sharedApplication].delegate window].rootViewController presentViewController:alertController animated:NO completion:nil];
    });
    return alertController;


}
@end
