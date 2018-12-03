//
//  UIImage+YCAdditions.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef struct __UICornerInset
{
    CGFloat topLeft;
    CGFloat topRight;
    CGFloat bottomLeft;
    CGFloat bottomRight;
} UICornerInset;

UIKIT_EXTERN const UICornerInset UICornerInsetZero;

UIKIT_STATIC_INLINE UICornerInset UICornerInsetMake(CGFloat topLeft, CGFloat topRight, CGFloat bottomLeft, CGFloat bottomRight)
{
    UICornerInset cornerInset = {topLeft, topRight, bottomLeft, bottomRight};
    return cornerInset;
}

UIKIT_STATIC_INLINE UICornerInset UICornerInsetMakeWithRadius(CGFloat radius)
{
    UICornerInset cornerInset = {radius, radius, radius, radius};
    return cornerInset;
}

UIKIT_STATIC_INLINE BOOL UICornerInsetEqualToCornerInset(UICornerInset cornerInset1, UICornerInset cornerInset2)
{
    return
    cornerInset1.topLeft == cornerInset2.topLeft &&
    cornerInset1.topRight == cornerInset2.topRight &&
    cornerInset1.bottomLeft == cornerInset2.bottomLeft &&
    cornerInset1.bottomRight == cornerInset2.bottomRight;
}

FOUNDATION_EXTERN NSString* NSStringFromUICornerInset(UICornerInset cornerInset);

typedef enum __UIImageTintedStyle
{
    UIImageTintedStyleKeepingAlpha      = 1,
    UIImageTintedStyleOverAlpha         = 2
} UIImageTintedStyle;

typedef enum __UIImageGradientDirection
{
    UIImageGradientDirectionVertical    = 1,
    UIImageGradientDirectionHorizontal  = 2,
} UIImageGradientDirection;

@interface UIImage(YCAdditions)

/*
 * Create images from colors
 */
+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size;
+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size cornerInset:(UICornerInset)cornerInset;

/*
 * Create rezisable images from colors
 */
+ (UIImage*)resizableImageWithColor:(UIColor*)color;
+ (UIImage*)resizableImageWithColor:(UIColor*)color cornerRadius:(CGFloat)cornerRadius;
+ (UIImage*)resizableImageWithColor:(UIColor*)color cornerInset:(UICornerInset)cornerInset;

+ (UIImage*)blackColorImage;
+ (UIImage*)darkGrayColorImage;
+ (UIImage*)lightGrayColorImage;
+ (UIImage*)whiteColorImage;
+ (UIImage*)grayColorImage;
+ (UIImage*)redColorImage;
+ (UIImage*)greenColorImage;
+ (UIImage*)blueColorImage;
+ (UIImage*)cyanColorImage;
+ (UIImage*)yellowColorImage;
+ (UIImage*)magentaColorImage;
+ (UIImage*)orangeColorImage;
+ (UIImage*)purpleColorImage;
+ (UIImage*)brownColorImage;
+ (UIImage*)clearColorImage;

/*
 * Tint Images
 */
+ (UIImage*)imageNamed:(NSString *)name tintColor:(UIColor*)color style:(UIImageTintedStyle)tintStyle;
- (UIImage*)tintedImageWithColor:(UIColor*)color style:(UIImageTintedStyle)tintStyle;

/*
 * Rounding corners
 */
- (UIImage*)imageWithRoundedBounds;
- (UIImage*)imageWithCornerRadius:(CGFloat)cornerRadius;
- (UIImage*)imageWithCornerInset:(UICornerInset)cornerInset;
- (BOOL)isValidCornerInset:(UICornerInset)cornerInset;

/*
 * Drawing image on image
 */
- (UIImage*)imageAddingImage:(UIImage*)image;
- (UIImage*)imageAddingImage:(UIImage*)image offset:(CGPoint)offset;

/*
 * Gradient image generation
 */
+ (UIImage*)imageWithGradient:(NSArray*)colors size:(CGSize)size direction:(UIImageGradientDirection)direction;
+ (UIImage*)resizableImageWithGradient:(NSArray*)colors size:(CGSize)size direction:(UIImageGradientDirection)direction;


/*
 * tint只对里面的图案作更改颜色操作
 */
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

@end
#pragma mark - Categories

@implementation NSValue (YCUICornerInset)

+ (NSValue*)valueWithUICornerInset:(UICornerInset)cornerInset
{
    CGRect rect = CGRectMake(cornerInset.topLeft, cornerInset.topRight, cornerInset.bottomLeft, cornerInset.bottomRight);
    return [NSValue valueWithCGRect:rect];

    //    UICornerInset inset = cornerInset;
    //    return [[NSValue alloc] initWithBytes:&inset objCType:@encode(struct __UICornerInset)];
}

- (UICornerInset)UICornerInsetValue
{
    CGRect rect = [self CGRectValue];
    return UICornerInsetMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);

    //    UICornerInset cornerInset;
    //    [self getValue:&cornerInset];
    //    return cornerInset;
}

@end
