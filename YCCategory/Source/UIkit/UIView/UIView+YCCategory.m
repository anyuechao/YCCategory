//
//  UIView+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIView+YCCategory.h"
#import <objc/runtime.h>

@implementation UIView(YCCategory)
- (void)setYc_x:(CGFloat)yc_x {
    CGRect rect = self.frame;
    rect.origin.x = yc_x;
    self.frame = rect;
}

- (void)setYc_y:(CGFloat)yc_y {
    CGRect rect = self.frame;
    rect.origin.y = yc_y;
    self.frame = rect;
}

- (void)setYc_width:(CGFloat)yc_width {
    CGRect rect = self.frame;
    rect.size.width = yc_width;
    self.frame = rect;
}

- (void)setYc_height:(CGFloat)yc_height {
    CGRect rect = self.frame;
    rect.size.height = yc_height;
    self.frame = rect;
}

- (void)setYc_origin:(CGPoint)yc_origin {
    self.frame = CGRectMake(yc_origin.x, yc_origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setYc_size:(CGSize)yc_size {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, yc_size.width, yc_size.height);
}

- (void)setYc_right:(CGFloat)yc_right {
    self.frame = CGRectMake(yc_right - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}


- (void)setYc_bottom:(CGFloat)yc_bottom {
    self.frame = CGRectMake(self.frame.origin.x, yc_bottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}


- (CGFloat)yc_x {
    return self.frame.origin.x;
}

- (CGFloat)yc_y {
    return self.frame.origin.y;
}

- (CGFloat)yc_width {
    return self.frame.size.width;
}

- (CGFloat)yc_height {
    return self.frame.size.height;
}

- (CGPoint)yc_origin {
    return self.frame.origin;
}

- (CGSize)yc_size {
    return self.frame.size;
}

- (CGFloat)yc_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)yc_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (BOOL) containsSubView:(UIView *)subView
{
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL) containsSubViewOfClassType:(Class)aClass
{
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:aClass]) {
            return YES;
        }
    }
    return NO;
}


- (void)removeAllSubviews {
    for (UIView * subview in self.subviews) {
        [subview removeFromSuperview];
    }
}



- (UIViewController *)yc_getCurrentViewController {
    for (UIView* next = [self superview]; next; next = next.superview)  {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])  {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



static char kWhenTappedBlockKey;
static char kWhenDoubleTappedBlockKey;
static char kWhenTwoFingerTappedBlockKey;
static char kWhenTouchedDownBlockKey;
static char kWhenTouchedUpBlockKey;

- (void)whenTapped:(YCWhenTappedBlock)block {
    UITapGestureRecognizer * gesture = [self addTapGestureRecognizerWithTaps:1 touches:1 selector:@selector(viewWasTapped)];
    [self addRequiredToDoubleTapsRecognizer:gesture];
    [self setBlock:block forKey:&kWhenTappedBlockKey];
}

- (void)whenDoubleTapped:(YCWhenTappedBlock)block {
    UITapGestureRecognizer * gesture = [self addTapGestureRecognizerWithTaps:2 touches:1 selector:@selector(viewWasDoubleTapped)];
    [self addRequirementToSingleTapsRecognizer:gesture];
    [self setBlock:block forKey:&kWhenDoubleTappedBlockKey];
}

- (void)whenTwoFingerTapped:(YCWhenTappedBlock)block {
    [self addTapGestureRecognizerWithTaps:1 touches:2 selector:@selector(viewWasTwoFingerTapped)];
    [self setBlock:block forKey:&kWhenTwoFingerTappedBlockKey];
}

- (void)whenTouchedDown:(YCWhenTappedBlock)block {
    [self setBlock:block forKey:&kWhenTouchedDownBlockKey];
}

- (void)whenTouchedUp:(YCWhenTappedBlock)block {
    [self setBlock:block forKey:&kWhenTouchedUpBlockKey];
}
/** SEL method */
- (void)viewWasTapped {
    [self runBlockForKey:&kWhenTappedBlockKey];
}
/** SEL method */
- (void)viewWasDoubleTapped {
    [self runBlockForKey:&kWhenDoubleTappedBlockKey];
}
/** SEL method */
- (void)viewWasTwoFingerTapped {
    [self runBlockForKey:&kWhenTwoFingerTappedBlockKey];
}
/** respond method */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedDownBlockKey];
}
/** respond method */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self runBlockForKey:&kWhenTouchedUpBlockKey];
}
/** private method */
- (void)runBlockForKey:(void *)blockKey {
    YCWhenTappedBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) block();
}
/** private method */
- (void)setBlock:(YCWhenTappedBlock)block forKey:(void *)blockKey {
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/** gesture method */
- (UITapGestureRecognizer *)addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector {
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.delegate                 = self;
    tapGesture.numberOfTapsRequired     = taps;
    tapGesture.numberOfTouchesRequired  = touches;
    [self addGestureRecognizer:tapGesture];

    return tapGesture;
}
/** gesture method */
- (void) addRequirementToSingleTapsRecognizer:(UIGestureRecognizer*) recognizer {
    for (UIGestureRecognizer * gesture in [self gestureRecognizers]) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer* tapGesture = (UITapGestureRecognizer*) gesture;
            if (tapGesture.numberOfTouchesRequired == 1 && tapGesture.numberOfTapsRequired == 1) {
                [tapGesture requireGestureRecognizerToFail:recognizer];
            }
        }
    }
}
/** gesture method */
- (void) addRequiredToDoubleTapsRecognizer:(UIGestureRecognizer*) recognizer {
    for (UIGestureRecognizer * gesture in [self gestureRecognizers]) {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            UITapGestureRecognizer* tapGesture = (UITapGestureRecognizer*) gesture;
            if (tapGesture.numberOfTouchesRequired == 2 && tapGesture.numberOfTapsRequired == 1) {
                [recognizer requireGestureRecognizerToFail:tapGesture];
            }
        }
    }
}

- (void)loomingAnimationWithDuration:(CGFloat)duration {

    self.alpha = 0.0;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1.0;
    }];
}


@end
