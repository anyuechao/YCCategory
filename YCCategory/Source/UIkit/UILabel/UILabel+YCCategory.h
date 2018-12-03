//
//  UILabel+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel(YCCategory)
- (instancetype)initWithColor:(UIColor *)color andFontSize:(CGFloat)size andMutiLines:(BOOL)mutiLines;


/**
 设置label为顶部对齐
 */
- (void)yc_alignTop;
@end
