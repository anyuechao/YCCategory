//
//  CAAnimation+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "CAAnimation+YCCategory.h"

@implementation CAAnimation(YCCategory)

+ (CAAnimation *)hearAnimationFrom:(CGRect)frame withView:(UIView *)view heartAnimationPoints:(NSMutableArray *)heartAnimationPoints
{
    //位置
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.beginTime = 0.5;
    animation.duration = 2.5;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount= 0;
    animation.calculationMode = kCAAnimationCubicPaced;

    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPoint point0 = CGPointMake(frame.origin.x + frame.size.width / 2, frame.origin.y + frame.size.height / 2);

    CGPathMoveToPoint(curvedPath, NULL, point0.x, point0.y);

    if (!heartAnimationPoints) {
        heartAnimationPoints = [[NSMutableArray alloc] init];
    }
    if ([heartAnimationPoints count] < 40) {
        float x11 = point0.x - arc4random() % 30 + 30;
        float y11 = frame.origin.y - arc4random() % 60 ;
        float x1 = point0.x - arc4random() % 15 + 15;
        float y1 = frame.origin.y - arc4random() % 60 - 30;
        CGPoint point1 = CGPointMake(x11, y11);
        CGPoint point2 = CGPointMake(x1, y1);

        int conffset2 = view.superview.bounds.size.width * 0.2;
        int conffset21 = view.superview.bounds.size.width * 0.1;
        //        float x2 = point0.x - arc4random() % conffset2 + conffset2;
        //        float y2 = arc4random() % 30 + 240;
        float x2 = point0.x - arc4random() % conffset2 + conffset2;
        float y2 = arc4random() % 30 ;
        float x21 = point0.x - arc4random() % conffset21  + conffset21;
        float y21 = (y2 + y1) / 2 + arc4random() % 30 - 30;
        CGPoint point3 = CGPointMake(x21, y21);
        CGPoint point4 = CGPointMake(x2, y2);

        [heartAnimationPoints addObject:[NSValue valueWithCGPoint:point1]];
        [heartAnimationPoints addObject:[NSValue valueWithCGPoint:point2]];
        [heartAnimationPoints addObject:[NSValue valueWithCGPoint:point3]];
        [heartAnimationPoints addObject:[NSValue valueWithCGPoint:point4]];
    }

    // 从_heartAnimationPoints中随机选取一组point
    int idx = arc4random() % ([heartAnimationPoints count]/4);
    CGPoint p1 = [[heartAnimationPoints objectAtIndex:4*idx] CGPointValue];
    CGPoint p2 = [[heartAnimationPoints objectAtIndex:4*idx+1] CGPointValue];
    CGPoint p3 = [[heartAnimationPoints objectAtIndex:4*idx+2] CGPointValue];
    CGPoint p4 = [[heartAnimationPoints objectAtIndex:4*idx+3] CGPointValue];
    CGPathAddQuadCurveToPoint(curvedPath, NULL, p1.x, p1.y, p2.x, p2.y);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, p3.x, p3.y, p4.x, p4.y);


    animation.path = curvedPath;

    CGPathRelease(curvedPath);

    //透明度变化
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0];
    opacityAnim.removedOnCompletion = NO;
    opacityAnim.beginTime = 0;
    opacityAnim.duration = 5;

    //比例
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //        int scale = arc4random() % 5 + 5;
    scaleAnim.fromValue = [NSNumber numberWithFloat:.0];//[NSNumber numberWithFloat:((float)scale / 10)];
    scaleAnim.toValue = [NSNumber numberWithFloat:1];
    scaleAnim.removedOnCompletion = NO;
    scaleAnim.fillMode = kCAFillModeForwards;
    scaleAnim.duration = .5;

    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects: scaleAnim,opacityAnim,animation, nil];
    animGroup.duration = 3;
    return animGroup;
}


@end
