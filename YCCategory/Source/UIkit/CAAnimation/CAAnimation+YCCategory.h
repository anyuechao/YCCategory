//
//  CAAnimation+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CAAnimation(YCCategory)
+ (CAAnimation *)hearAnimationFrom:(CGRect)frame withView:(UIView *)view heartAnimationPoints:(NSMutableArray *)heartAnimationPoints;
@end
