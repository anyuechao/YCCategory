//
//  UISegmentedControl+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UISegmentedControlAction)(UISegmentedControl *sender);

@interface UISegmentedControl(YCCategory)

+ (instancetype)createSegumentControlWithItemArray:(NSArray *)array
                                     selelectIndex:(NSInteger)index
                                         tintColor:(UIColor *)tintColor
                                       ActionBlock:(UISegmentedControlAction)actionBlock;

@end
