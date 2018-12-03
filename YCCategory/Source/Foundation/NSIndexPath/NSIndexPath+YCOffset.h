//
//  NSIndexPath+YCOffset.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSIndexPath(YCOffset)
/* Compute previous row indexpath */
- (NSIndexPath *)previousRow;

/* Compute next row indexpath */
- (NSIndexPath *)nextRow;

/* Compute previous item indexpath */
- (NSIndexPath *)previousItem;

/* Compute next item indexpath */
- (NSIndexPath *)nextItem;

/* Compute next section indexpath */
- (NSIndexPath *)nextSection;

/* Compute previous section indexpath */
- (NSIndexPath *)previousSection;

@end
