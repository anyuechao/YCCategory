//
//  UIButton+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIButton+YCCategory.h"
#import <objc/runtime.h>

static NSString *keyOfMethod;

@implementation UIButton(YCCategory)

+ (instancetype)createButtonWithFrame:(CGRect)frame
                       buttonWithType:(UIButtonType)buttonType
                                Title:(NSString *)title
                           TitleColor:(UIColor *)titleColor
                          ActionBlock:(ActionBlock)actionBlock {

    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, &keyOfMethod, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;

}

- (void)buttonClick:(UIButton *)sender{
    ActionBlock actionBlock = (ActionBlock)objc_getAssociatedObject(sender, &keyOfMethod);
    if (actionBlock){
        actionBlock(sender);
    }

}

@end
