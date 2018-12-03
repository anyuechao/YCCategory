//
//  NSTimer+YCAddition.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer(YCAddition)
/**
 *  @brief  暂停NSTimer
 */
- (void)pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end

