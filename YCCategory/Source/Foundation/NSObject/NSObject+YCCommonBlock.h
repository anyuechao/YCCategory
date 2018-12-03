//
//  NSObject+YCCommonBlock.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CommonVoidBlock)();

typedef void (^CommonBlock)(id selfPtr);

typedef void (^CommonCompletionBlock)(id selfPtr, BOOL isFinished);

typedef void (^CommonFinishBlock)(BOOL isFinished);

@interface NSObject (YCCommonBlock)

- (void)excuteBlock:(CommonBlock)block;

- (void)performBlock:(CommonBlock)block;

//- (void)cancelBlock:(CommonBlock)block;

- (void)performBlock:(CommonBlock)block afterDelay:(NSTimeInterval)delay;



- (void)excuteCompletion:(CommonCompletionBlock)block withFinished:(NSNumber *)finished;

- (void)performCompletion:(CommonCompletionBlock)block withFinished:(BOOL)finished;

// 并发执行tasks里的作务，等tasks执行行完毕，回调到completion
- (void)asynExecuteCompletion:(CommonBlock)completion tasks:(CommonBlock)task, ... NS_REQUIRES_NIL_TERMINATION;

@end

