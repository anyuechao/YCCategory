//
//  UIView+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YCWhenTappedBlock)();
@interface UIView(YCCategory)<UIGestureRecognizerDelegate>
@property (nonatomic, assign)CGFloat yc_width;
@property (nonatomic, assign)CGFloat yc_height;
@property (nonatomic, assign)CGFloat yc_x;
@property (nonatomic, assign)CGFloat yc_y;
@property (nonatomic, assign)CGPoint yc_origin;
@property (nonatomic, assign)CGSize yc_size;
@property (nonatomic, assign) CGFloat yc_right;
@property (nonatomic, assign) CGFloat yc_bottom;

- (BOOL) containsSubView:(UIView *)subView;

- (BOOL) containsSubViewOfClassType:(Class)aClass;

- (void) removeAllSubviews;

- (UIViewController *)yc_getCurrentViewController;

- (void)whenTapped:(YCWhenTappedBlock)block;

- (void)whenDoubleTapped:(YCWhenTappedBlock)block;

- (void)whenTwoFingerTapped:(YCWhenTappedBlock)block;

- (void)whenTouchedDown:(YCWhenTappedBlock)block;

- (void)whenTouchedUp:(YCWhenTappedBlock)block;

- (void)loomingAnimationWithDuration:(CGFloat)duration;
@end
