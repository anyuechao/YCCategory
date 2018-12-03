//
//  UIImage+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIImage+YCCategory.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIImage(YCCategory)
- (UIImage *)yc_scaleToSize:(CGSize)newsize {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(newsize);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (UIImage *)yc_changeScale:(CGFloat)scale {
    CGSize size = CGSizeMake(self.size.width * scale, self.size.height * scale);
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的图片
    return scaledImage;
}

+ (UIImage *)yc_thumbnailImageForVideo:(NSURL *)url atTime:(NSTimeInterval)time {
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    AVAssetImageGenerator *assetImageGenerator = [AVAssetImageGenerator assetImageGeneratorWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    NSError *error = nil;
    CGImageRef thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(time, 1) actualTime:nil error:&error];
    if (error != nil) {
        NSLog(@"%@", error.description);
        return nil;
    } else {
        return [UIImage imageWithCGImage:thumbnailImageRef];
    }
}

/**
 *    创建颜色的图片
 */

+ (UIImage*)yc_createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

//改变图片颜色
- (UIImage *)yc_imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)imageWithName:(NSString *)name
                 withColor:(UIColor *)color{

    UIImage * image= [UIImage imageNamed:name];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [image yc_imageWithColor:color];
    return image;
}

- (UIImage *)yc_imageWithCornerRadius:(CGFloat)cornerRadius {

    UIImage* imageNew;

    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);

    const CGRect RECT = CGRectMake(0, 0, self.size.width, self.size.height);
    [[UIBezierPath bezierPathWithRoundedRect:RECT cornerRadius:cornerRadius] addClip];
    [self drawInRect:RECT];
    imageNew = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return imageNew;
}
/**
 *  压缩图片到指定文件大小
 *
 *  @param image 目标图片
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}

/**
 *  压缩图片到指定尺寸大小
 *
 *  @param image 原始图片
 *  @param size  目标大小
 *
 *  @return 生成图片
 */
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    UIImage * resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(00, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return image;
}


/**
 *   将图片数组变成动态图片
 */
+ (UIImage *)animationImageArr:(NSArray *)imageArr
                  durationEach:(int)durationEach{

    UIImage *animatedImage;
    NSMutableArray *images = [NSMutableArray array];
    NSTimeInterval duration = 0.0f;
    for (size_t i = 0; i < imageArr.count; i++) {
        // 拿出了Gif的每一帧图片
        CGImageRef image = ((UIImage *)imageArr[i]).CGImage;
        //Learning... 设置动画时长 算出每一帧显示的时长(帧时长)
        //设置每张图片动画间隔时间
        NSTimeInterval frameDuration = images.count * durationEach;
        duration += frameDuration;
        // 将每帧图片添加到数组中
        [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
        // 释放真图片对象
        CFRelease(image);
    }
    // 设置动画时长

    if (!duration) {

        duration = (1.0f / 10.0f) * imageArr.count;
    }
    animatedImage = [UIImage animatedImageWithImages:images duration:duration];
    return animatedImage;
}

@end
