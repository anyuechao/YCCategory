//
//  UIBezierPath+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIBezierPath+YCCategory.h"
#define CGPointWithOffset(originPoint, offsetPoint) \
CGPointMake(originPoint.x + offsetPoint.x, originPoint.y + offsetPoint.y)


@implementation UIBezierPath(YCCategory)

// plus
//
//     c-d
//     | |
//  a--b e--f
//  |       |
//  l--k h--g
//     | |
//     j-i
//
+ (UIBezierPath *)customBezierPathOfPlusSymbolWithRect:(CGRect)rect
                                                 scale:(CGFloat)scale {
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat size       = (height < width ? height : width) * scale;
    CGFloat thick      = size / 3.f;
    CGFloat twiceThick = thick * 2.f;

    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - size) / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size) / 2.f);

    UIBezierPath * path = [self bezierPath];
    [path moveToPoint:CGPointWithOffset(CGPointMake(0.f, thick), offsetPoint)];                // a
    [path addLineToPoint:CGPointWithOffset(CGPointMake(thick, thick), offsetPoint)];           // b
    [path addLineToPoint:CGPointWithOffset(CGPointMake(thick, 0.f), offsetPoint)];             // c
    [path addLineToPoint:CGPointWithOffset(CGPointMake(twiceThick, 0.f), offsetPoint)];        // d
    [path addLineToPoint:CGPointWithOffset(CGPointMake(twiceThick, thick), offsetPoint)];      // e
    [path addLineToPoint:CGPointWithOffset(CGPointMake(size, thick), offsetPoint)];            // f
    [path addLineToPoint:CGPointWithOffset(CGPointMake(size, twiceThick), offsetPoint)];       // g
    [path addLineToPoint:CGPointWithOffset(CGPointMake(twiceThick, twiceThick), offsetPoint)]; // h
    [path addLineToPoint:CGPointWithOffset(CGPointMake(twiceThick, size), offsetPoint)];       // i
    [path addLineToPoint:CGPointWithOffset(CGPointMake(thick, size), offsetPoint)];            // j
    [path addLineToPoint:CGPointWithOffset(CGPointMake(thick, twiceThick), offsetPoint)];      // k
    [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, twiceThick), offsetPoint)];        // l
    [path closePath];
    return path;
}

// minus
+ (UIBezierPath *)customBezierPathOfMinusSymbolWithRect:(CGRect)rect
                                                  scale:(CGFloat)scale {
    CGFloat height = CGRectGetHeight(rect) * scale;
    CGFloat width  = CGRectGetWidth(rect)  * scale;
    CGFloat size   = height < width ? height : width;
    CGFloat thick  = size / 3.f;

    return [self bezierPathWithRect:
            CGRectOffset(CGRectMake(0.f, thick, size, thick),
                         CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                         CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f)];
}

// check
//
//       /---------> degree = 90˚  |
//       |                         |      /----> topPointOffset = thick / √2
//   /---(----/----> thick         |    |<->|
//   |   |    |                    |    |  /b
//   |   |   d\e                   |    | /  \
//   |   |  / /                    |    a/    \
//  a/b  | / /                     |     \     \
//   \ \  / /                      |
//    \ \c /
//     \ -/--------> bottomHeight = thick * √2
//      \/
//      f     |
//      |<--->|
//         \-------> bottomMarginRight = height - topPointOffset
//
+ (UIBezierPath *)customBezierPathOfCheckSymbolWithRect:(CGRect)rect
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick {
    CGFloat height, width;
    // height : width = 32 : 25
    if (CGRectGetHeight(rect) > CGRectGetWidth(rect)) {
        height = CGRectGetHeight(rect) * scale;
        width  = height * 32.f / 25.f;
    }
    else {
        width  = CGRectGetWidth(rect) * scale;
        height = width * 25.f / 32.f;
    }

    CGFloat topPointOffset    = thick / sqrt(2.f);
    CGFloat bottomHeight      = thick * sqrt(2.f);
    CGFloat bottomMarginRight = height - topPointOffset;
    CGFloat bottomMarginLeft  = width - bottomMarginRight;

    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);

    UIBezierPath * path = [self bezierPath];
    [path moveToPoint:
     CGPointWithOffset(CGPointMake(0.f, height - bottomMarginLeft), offsetPoint)];                             // a
    [path addLineToPoint:
     CGPointWithOffset(CGPointMake(topPointOffset, height - bottomMarginLeft - topPointOffset), offsetPoint)]; // b
    [path addLineToPoint:
     CGPointWithOffset(CGPointMake(bottomMarginLeft, height - bottomHeight), offsetPoint)];                    // c
    [path addLineToPoint:
     CGPointWithOffset(CGPointMake(width - topPointOffset, 0.f), offsetPoint)];                                // d
    [path addLineToPoint:
     CGPointWithOffset(CGPointMake(width, topPointOffset), offsetPoint)];                                      // e
    [path addLineToPoint:
     CGPointWithOffset(CGPointMake(bottomMarginLeft, height), offsetPoint)];                                   // f
    [path closePath];
    return path;
}

// cross
//
//                /---> thick |
//     b       d /            |      b
//   a/ \     / \e            |     /|\
//    \  \   /  /             |    / |_/----> offset = thick / √2
//     \  \c/  /              |  a/__|  \
//      \     /               |   \      \
//       \l f/                |___________________________________
//       /   \                |
//      /  i  \               |      c  /---> thick
//     /  / \  \              |      |\/
//   k/  /   \  \g            |   l  |_\f
//    \ /     \ /             |       \----> offset
//     j       h              |      i
//
+ (UIBezierPath *)customBezierPathOfCrossSymbolWithRect:(CGRect)rect
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick {
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat halfHeight = height / 2.f;
    CGFloat halfWidth  = width  / 2.f;
    CGFloat size       = height < width ? height : width;
    CGFloat offset     = thick / sqrt(2.f);

    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - size) / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size) / 2.f);

    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointWithOffset(CGPointMake(0.f, offset), offsetPoint)];                       // a
    [path addLineToPoint:CGPointWithOffset(CGPointMake(offset, 0.f), offsetPoint)];                    // b
    [path addLineToPoint:CGPointWithOffset(CGPointMake(halfWidth, halfHeight - offset), offsetPoint)]; // c
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width - offset, 0.f), offsetPoint)];            // d
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width, offset), offsetPoint)];                  // e
    [path addLineToPoint:CGPointWithOffset(CGPointMake(halfWidth + offset, halfHeight), offsetPoint)]; // f
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width, height - offset), offsetPoint)];         // g
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width - offset, height), offsetPoint)];         // h
    [path addLineToPoint:CGPointWithOffset(CGPointMake(halfWidth, halfHeight + offset), offsetPoint)]; // i
    [path addLineToPoint:CGPointWithOffset(CGPointMake(offset, height), offsetPoint)];                 // j
    [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, height - offset), offsetPoint)];           // k
    [path addLineToPoint:CGPointWithOffset(CGPointMake(halfWidth - offset, halfHeight), offsetPoint)]; // l
    [path closePath];
    return path;
}

// arrow
//
//            /----> thick
// LEFT:    b-c                  RIGHT:   b-c
//         / /                             \ \
//       a/ /d                             a\ \d
//        \ \                               / /
//         \ \                             / /
//          f-e                           f-e
//
//
// UP:       a                   DOWN:  f      b
//          /\                          |\    /|
//         / d\                         | \  / |
//       f/ /\ \b                       e\ \/ /c
//       | /  \ |                         \ a/
//       |/    \|                          \/
//       e      c                           d
//
+ (UIBezierPath *)customBezierPathOfArrowSymbolWithRect:(CGRect)rect
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick
                                              direction:(UIBezierPathArrowDirection)direction {
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat halfHeight = height / 2.f;
    CGFloat halfWidth  = width  / 2.f;

    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);

    UIBezierPath * path = [self bezierPath];
    if (direction == kUIBezierPathArrowDirectionLeft || direction == kUIBezierPathArrowDirectionRight) {
        if (direction == UISwipeGestureRecognizerDirectionLeft) {
            [path moveToPoint:CGPointWithOffset(CGPointMake(0.f, halfHeight), offsetPoint)];          // a
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width - thick, 0.f), offsetPoint)];    // b
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width, 0.f), offsetPoint)];            // c
            [path addLineToPoint:CGPointWithOffset(CGPointMake(thick, halfHeight), offsetPoint)];     // d
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width, height), offsetPoint)];         // e
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width - thick, height), offsetPoint)]; // f
        }
        else {
            [path moveToPoint:CGPointWithOffset(CGPointMake(width - thick, halfHeight), offsetPoint)]; // a
            [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, 0.f), offsetPoint)];               // b
            [path addLineToPoint:CGPointWithOffset(CGPointMake(thick, 0.f), offsetPoint)];             // c
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width, halfHeight), offsetPoint)];      // d
            [path addLineToPoint:CGPointWithOffset(CGPointMake(thick, height), offsetPoint)];          // e
            [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];            // f
        }
    }
    else {
        if (direction == kUIBezierPathArrowDirectionUp) {
            [path moveToPoint:CGPointWithOffset(CGPointMake(halfWidth, 0.f), offsetPoint)];           // a
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width, height - thick), offsetPoint)]; // b
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width, height), offsetPoint)];         // c
            [path addLineToPoint:CGPointWithOffset(CGPointMake(halfWidth, thick), offsetPoint)];      // d
            [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];           // e
            [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, height - thick), offsetPoint)];   // f
        }
        else {
            [path moveToPoint:CGPointWithOffset(CGPointMake(halfWidth, height - thick), offsetPoint)]; // a
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width, 0.f), offsetPoint)];             // b
            [path addLineToPoint:CGPointWithOffset(CGPointMake(width, thick), offsetPoint)];           // c
            [path addLineToPoint:CGPointWithOffset(CGPointMake(halfWidth, height), offsetPoint)];      // d
            [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, thick), offsetPoint)];             // e
            [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, 0.f), offsetPoint)];               // f
        }
    }
    [path closePath];
    return path;
}

// pencil
//
//       c  /---> thick
//       /\/
//      /  \d
//     /   /
//   b/   /
//   |   /
//  a|__/e
//     \--------> edgeWidth = thick / √2
//
+ (UIBezierPath *)customBezierPathOfPencilSymbolWithRect:(CGRect)rect
                                                   scale:(CGFloat)scale
                                                   thick:(CGFloat)thick {
    CGFloat height    = CGRectGetHeight(rect) * scale;
    CGFloat width     = CGRectGetWidth(rect)  * scale;
    CGFloat edgeWidth = thick / sqrt(2.f);

    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);

    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];                // a
    [path addLineToPoint:CGPointWithOffset(CGPointMake(0.f, height - edgeWidth), offsetPoint)]; // b
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width - edgeWidth, 0.f), offsetPoint)];  // c
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width, edgeWidth), offsetPoint)];        // d
    [path addLineToPoint:CGPointWithOffset(CGPointMake(edgeWidth, height), offsetPoint)];       // e
    [path closePath];
    return path;
}


//绘制圆形
+ (UIBezierPath *)customBezierPathOfRoundSymbolWithRect:(CGRect)rect // Round
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick {
    CGFloat width = CGRectGetWidth(rect) * scale;
    CGPoint center = CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect)/2);
    CGFloat radius = width / 2;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:center radius:radius startAngle:0 endAngle:2 * M_PI  clockwise:0];

    [path closePath];

    return path;
}

//绘制矩形
+ (UIBezierPath *)customBezierPathOfRectSymbolWithRect:(CGRect)rect // Rect
                                                 scale:(CGFloat)scale
                                                 thick:(CGFloat)thick {

    CGFloat height = CGRectGetHeight(rect) * scale;
    CGFloat width = CGRectGetWidth(rect) * scale;

    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointWithOffset(CGPointMake(0, 0), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width, 0), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width, height), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(0, height), offsetPoint)];
    [path closePath];

    return path;
}

//绘制椭圆
+ (UIBezierPath *)customBezierPathOfEllipseSymbolWithRect:(CGRect)rect // Ellipse
                                                    scale:(CGFloat)scale
                                                    thick:(CGFloat)thick{

    CGFloat width = CGRectGetWidth(rect)  * scale * 4/3;
    CGFloat height = CGRectGetHeight(rect) * scale * 3/4;
    //    CGFloat originX = CGRectGetMinX(rect);
    //    CGFloat originY = CGRectGetMinY(rect);
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(offsetPoint.x,offsetPoint.y, width, height)];
    [path closePath];
    return path;
}

//半圆
+ (UIBezierPath *)customBezierPathOfHalfEllipseSymbolWithRect:(CGRect)rect // Half
                                                        scale:(CGFloat)scale
                                                        thick:(CGFloat)thick {

    CGFloat width = CGRectGetWidth(rect) * scale;
    CGPoint center = CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect)/2);
    CGFloat radius = width / 2;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:center radius:radius startAngle:M_PI_2 endAngle: M_PI * 1.5  clockwise:0];

    [path closePath];

    return path;


}

//斜线
+ (UIBezierPath *)customBezierPathOfLineSymbolWithRect:(CGRect)rect // Line
                                                 scale:(CGFloat)scale
                                                 thick:(CGFloat)thick {

    CGFloat height = CGRectGetHeight(rect) * scale;
    CGFloat width = CGRectGetWidth(rect) * scale;
    CGPoint offsetPoint = CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                                      CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointWithOffset(CGPointMake(0, height), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width, 0), offsetPoint)];

    [path closePath];
    return path;

}

//三角
+ (UIBezierPath *)customBezierPathOfTriangleSymbolWithRect:(CGRect)rect // Line
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick{

    CGFloat height = CGRectGetHeight(rect) * scale;
    CGFloat width = CGRectGetWidth(rect) * scale;
    CGPoint offsetPoint = CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                                      CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(height, width), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width / 2, 0), offsetPoint)];

    [path closePath];
    return path;
}

//三角
+ (UIBezierPath *)customBezierPathOfTriangleSpecialSymbolWithRect:(CGRect)rect // Line
                                                            scale:(CGFloat)scale
                                                            thick:(CGFloat)thick{

    CGFloat height = CGRectGetHeight(rect) * scale;
    CGFloat width = CGRectGetWidth(rect) * scale;
    CGPoint offsetPoint = CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                                      CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointWithOffset(CGPointMake(0.f, 0.f), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(width, 0.f), offsetPoint)];
    [path addLineToPoint:CGPointWithOffset(CGPointMake(0 , height), offsetPoint)];
    [path closePath];
    return path;
}

@end
