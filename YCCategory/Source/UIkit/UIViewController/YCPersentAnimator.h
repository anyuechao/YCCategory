//
//  YCPersentAnimator.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    UIPresentCrossDissolve = 0,
    UIPresentCoverVertical,
} UIPresentTransitionStyle;


NS_ASSUME_NONNULL_BEGIN

@interface YCPersentAnimator :  UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>

@property(assign, nonatomic)UIPresentTransitionStyle presentStyle;
// 动画时长
@property(nonatomic, assign)NSTimeInterval animatingDuration;

+ (YCPersentAnimator *)shared;@end

NS_ASSUME_NONNULL_END
