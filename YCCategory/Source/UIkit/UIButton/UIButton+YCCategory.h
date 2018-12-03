//
//  UIButton+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(UIButton *sender);

@interface UIButton(YCCategory)

+ (instancetype)createButtonWithFrame:(CGRect)frame
                       buttonWithType:(UIButtonType)buttonType
                                Title:(NSString *)title
                           TitleColor:(UIColor *)titleColor
                          ActionBlock:(ActionBlock)actionBlock;




@end
