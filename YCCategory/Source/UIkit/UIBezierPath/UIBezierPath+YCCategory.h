//
//  UIBezierPath+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

// Direction
typedef enum {
    kUIBezierPathArrowDirectionNone  = 0,
    kUIBezierPathArrowDirectionRight = 1 << 0,
    kUIBezierPathArrowDirectionLeft  = 1 << 1,
    kUIBezierPathArrowDirectionUp    = 1 << 2,
    kUIBezierPathArrowDirectionDown  = 1 << 3
}UIBezierPathArrowDirection;

@interface UIBezierPath(YCCategory)

+ (UIBezierPath *)customBezierPathOfPlusSymbolWithRect:(CGRect)rect   // plus
scale:(CGFloat)scale;
+ (UIBezierPath *)customBezierPathOfMinusSymbolWithRect:(CGRect)rect  // minus
                                                  scale:(CGFloat)scale;
+ (UIBezierPath *)customBezierPathOfCheckSymbolWithRect:(CGRect)rect  // check
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick;
+ (UIBezierPath *)customBezierPathOfCrossSymbolWithRect:(CGRect)rect  // cross
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick;
+ (UIBezierPath *)customBezierPathOfArrowSymbolWithRect:(CGRect)rect  // arrow
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick
                                              direction:(UIBezierPathArrowDirection)direction;
+ (UIBezierPath *)customBezierPathOfPencilSymbolWithRect:(CGRect)rect // pencil
                                                   scale:(CGFloat)scale
                                                   thick:(CGFloat)thick;

+ (UIBezierPath *)customBezierPathOfRoundSymbolWithRect:(CGRect)rect // Round
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick;

+ (UIBezierPath *)customBezierPathOfRectSymbolWithRect:(CGRect)rect // Rect
                                                 scale:(CGFloat)scale
                                                 thick:(CGFloat)thick;

+ (UIBezierPath *)customBezierPathOfEllipseSymbolWithRect:(CGRect)rect // Ellipse
                                                    scale:(CGFloat)scale
                                                    thick:(CGFloat)thick;

+ (UIBezierPath *)customBezierPathOfHalfEllipseSymbolWithRect:(CGRect)rect // Half
                                                        scale:(CGFloat)scale
                                                        thick:(CGFloat)thick;

+ (UIBezierPath *)customBezierPathOfLineSymbolWithRect:(CGRect)rect // Line
                                                 scale:(CGFloat)scale
                                                 thick:(CGFloat)thick;



//三角
+ (UIBezierPath *)customBezierPathOfTriangleSymbolWithRect:(CGRect)rect // Triangle
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick;

+ (UIBezierPath *)customBezierPathOfTriangleSpecialSymbolWithRect:(CGRect)rect // Line
                                                            scale:(CGFloat)scale
                                                            thick:(CGFloat)thick;
@end
