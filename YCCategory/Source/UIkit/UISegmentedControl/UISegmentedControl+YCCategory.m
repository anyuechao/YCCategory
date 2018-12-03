//
//  UISegmentedControl+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UISegmentedControl+YCCategory.h"
#import <objc/runtime.h>

static NSString *keyOfMethod;

@implementation UISegmentedControl(YCCategory)

+ (instancetype)createSegumentControlWithItemArray:(NSArray *)array
                                     selelectIndex:(NSInteger)index
                                         tintColor:(UIColor *)tintColor
                                       ActionBlock:(UISegmentedControlAction)actionBlock
{

    UISegmentedControl *segument = [[UISegmentedControl alloc] initWithItems:array];
    segument.selectedSegmentIndex = index;
    segument.tintColor = tintColor;
    [segument addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventValueChanged];
    objc_setAssociatedObject(segument, &keyOfMethod, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return segument;
}

- (void)clickAction:(UISegmentedControl *)sender{
    //    NSInteger index = sender.selectedSegmentIndex;
    UISegmentedControlAction actionBlock = objc_getAssociatedObject(sender, &keyOfMethod);
    if (actionBlock){
        actionBlock(sender);
    }

}
@end
