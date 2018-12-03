//
//  UIImage+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage(YCCategory)
/**
 根据尺寸设置图片大小

 @param newsize 新的尺寸

 @return 返回UIImage对象
 */
- (UIImage *)yc_scaleToSize:(CGSize)newsize;

/**
 根据比例缩放图片大小

 @param scale 缩放比例

 @return 返回UIImage对象
 */
- (UIImage *)yc_changeScale:(CGFloat)scale;

/**
 根据视频url及播放时间截取图片

 @param url  视频URL
 @param time 播放时间

 @return UIImage对象
 */
+ (UIImage *)yc_thumbnailImageForVideo:(NSURL *)url atTime:(NSTimeInterval)time;

/**
 *  创建颜色的图片
 */
+ (UIImage*)yc_createImageWithColor:(UIColor*) color;

/*

 改变图片颜色
 */
- (UIImage *)yc_imageWithColor:(UIColor *)color;


/**
 *   根据输入的图片名称改变颜色
 */
- (UIImage *)imageWithName:(NSString *)name
                 withColor:(UIColor *)color;

/**
 改变图片的圆角

 @param cornerRadius cornerRadious

 @return UIImage对象
 */
- (UIImage *)yc_imageWithCornerRadius:(CGFloat)cornerRadius;
/**
 *  压缩图片到指定文件大小
 *
 *  @param image 目标图片
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;
/**
 *  压缩图片到指定尺寸大小
 *
 *  @param image 原始图片
 *  @param size  目标大小
 *
 *  @return 生成图片
 */
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

/**
 *   将图片数组变成动态图片
 */
+ (UIImage *)animationImageArr:(NSArray *)imageArr
                  durationEach:(int)durationEach;

@end

