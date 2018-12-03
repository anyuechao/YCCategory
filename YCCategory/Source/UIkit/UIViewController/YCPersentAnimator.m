//
//  YCPersentAnimator.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "YCPersentAnimator.h"
#import "UIView+YCCategory.h"

@interface YCPersentAnimator()
@property(nonatomic, assign) BOOL isPersent;
@property(nonatomic, assign) BOOL shouldComplete;
@property(nonatomic, assign) BOOL interacting;
@property(nonatomic, weak) UIViewController * presentingVC;
@end

@implementation YCPersentAnimator

+ (YCPersentAnimator *)shared {
    static YCPersentAnimator *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.isPersent = YES;
    return [YCPersentAnimator shared];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.isPersent = NO;
    return [YCPersentAnimator shared];
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)prepareGestureRecognizerInView:(UIView*)view {
    UIScreenEdgePanGestureRecognizer *popRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
    popRecognizer.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:popRecognizer];
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // 1. Get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    toVC.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:toVC.view.bounds].CGPath;
    toVC.view.layer.shadowColor = [UIColor blackColor].CGColor;
    toVC.view.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    toVC.view.layer.shadowOpacity = 0.5;
    toVC.view.layer.shadowRadius = 5.0;
    self.presentingVC = toVC;
    if (self.isPersent) {
        [self prepareGestureRecognizerInView:toVC.view];
    }
    // 2. Set init frame for toVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    if (self.presentStyle == UIPresentCoverVertical) {
        if (self.isPersent) {
            toVC.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, 0);
        } else {
            toVC.view.frame = CGRectOffset(finalFrame, -screenBounds.size.width/2, 0);
        }
    } else {
        if (self.isPersent) {
            toVC.view.alpha = 0;
        } else {
            fromVC.view.alpha = 1;
        }
    }

    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    if (!self.isPersent) {
        [containerView bringSubviewToFront:fromVC.view];
    }
    // 4. Do animate now
    switch (self.presentStyle) {
            case UIPresentCoverVertical: {
                [UIView animateWithDuration:0.3f animations:^{
                    if (self.isPersent) {
                        fromVC.view.frame = CGRectMake(-screenBounds.size.width / 2, fromVC.view.yc_y, fromVC.view.yc_width, fromVC.view.yc_height);
                    } else {
                        fromVC.view.frame = CGRectMake(screenBounds.size.width, fromVC.view.yc_y, fromVC.view.yc_width, fromVC.view.yc_height);
                    }
                    toVC.view.frame = finalFrame;
                } completion:^(BOOL finished) {
                    if (self.isPersent) {
                        [transitionContext completeTransition:YES];
                    } else {
                        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                    }
                }];
            }
            break;

            case UIPresentCrossDissolve: {
                [UIView animateWithDuration:0.3f animations:^{
                    if (self.isPersent) {
                        toVC.view.alpha = 1;
                    } else {
                        fromVC.view.alpha = 0;
                    }
                } completion:^(BOOL finished) {
                    if (self.isPersent) {
                        [transitionContext completeTransition:YES];
                    } else {
                        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                    }
                }];
            }
            break;
        default:
            break;
    }
}

-(CGFloat)completionSpeed {
    return 1 - self.percentComplete;
}

- (void)handlePopRecognizer:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
            case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
            case UIGestureRecognizerStateChanged: {
                // 2. Calculate the percentage of guesture
                CGFloat fraction = translation.x / [[[UIApplication sharedApplication] delegate] window].yc_width;
                //Limit it between 0 and 1
                fraction = fminf(fmaxf(fraction, 0.0), 1.0);
                self.shouldComplete = (fraction > 0.3);

                [self updateInteractiveTransition:fraction];
                break;
            }
            case UIGestureRecognizerStateEnded:
            case UIGestureRecognizerStateCancelled: {
                // 3. Gesture over. Check if the transition should happen or not
                self.interacting = NO;
                if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                    [self cancelInteractiveTransition];
                } else {
                    [self finishInteractiveTransition];
                }
                break;
            }
        default:
            break;
    }
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.interacting ? self : nil;
}
@end
