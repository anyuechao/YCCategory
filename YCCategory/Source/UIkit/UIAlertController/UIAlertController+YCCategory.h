//
//  UIAlertController+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController(YCCategory)

+ (nonnull instancetype)yc_alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle action:(nullable UIAlertAction *)action otherAction:(nullable UIAlertAction *)otherAction;


+ (nonnull instancetype)createAlertControllerWithTitle:(nullable NSString *)title
                                               message:(nullable NSString *)message
                                  alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle
                                     cancelActionTitle:(nullable NSString *)cancelActionTitle
                                     cancelActionStyle:(UIAlertActionStyle)cancelActionStyle
                           cancelAtionCompletionHandle:(void (^_Nullable)(UIAlertAction * _Nullable action))cancelAtionCompletionHandle
                                      otherActionTitle:(nullable NSString *)otherActionTitle
                                      otherActionStyle:(UIAlertActionStyle)otherActionStyle
                            otherAtionCompletionHandle:(void (^_Nullable)(UIAlertAction * _Nullable action))otherAtionCompletionHandle;

+ (nonnull instancetype)createAlertControllerWithActionCompletionHandle:(void (^_Nullable)(UIAlertAction * _Nullable action))actionCompletionHandle
                                                                  Title:(NSString *_Nullable)title
                                                                message:(NSString *_Nullable)message
                                                   alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle
                                                      cancelActionTitle:(NSString *_Nullable)cancelActionTitle
                                                      cancelActionStyle:(UIAlertActionStyle)cancelActionStyle
                                                      otherButtonTitles:(NSString *_Nullable)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

//更改alertController 中文本文字颜色，间距的示例
/**
 - (void)payAlert{
 DJYC_WEAK_SELF;
 //    dispatch_async(dispatch_get_main_queue(), ^{
 NSString *title = [NSString stringWithFormat:@"%@",@"付费直播购买\n   "];
 NSString *message = [NSString stringWithFormat:@"直播标题：%@\n直播价格：%.2f元",self.VODModel.courseTitle,[self.VODModel.coursePrice floatValue]];
 //改变title的大小和颜色
 NSMutableParagraphStyle *paragraphTitleStyle = [[NSMutableParagraphStyle alloc] init];
 paragraphTitleStyle.paragraphSpacing = -15;
 paragraphTitleStyle.alignment = NSTextAlignmentCenter;
 NSMutableAttributedString *titleAtt = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:20                                                                     ],
 NSParagraphStyleAttributeName:paragraphTitleStyle }];
 //改变message的大小和颜色
 NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
 paragraph.alignment =NSTextAlignmentLeft;//设置对齐方式

 NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
 paragraphStyle.paragraphSpacingBefore = -6;
 NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
 paragraphStyle1.paragraphSpacingBefore = 6;

 NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:message attributes:@{
 //                                                                                                                   NSFontAttributeName:[UIFont systemFontOfSize:18]                                                                                                                   ,
 NSParagraphStyleAttributeName:paragraph}];


 [messageAtt addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[message rangeOfString:[NSString stringWithFormat:@"%.2f",[self.VODModel.coursePrice floatValue]]]];
 [messageAtt addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:[message rangeOfString:[NSString stringWithFormat:@"直播标题：%@",self.VODModel.courseTitle]]];
 [messageAtt addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, message.length)];
 //     NSRangeFromString([NSString stringWithFormat:@"\n直播价格：%.2f元",[self.VODModel.coursePrice floatValue]])];


 [UIAlertController createAlertControllerWithActionCompletionHandle:^(UIAlertAction *action) {
 DJYC_STRONG_SELF;
 if ([action.title isEqualToString:@"取消"]){

 }else{
 [strongSelf showBuyAlert];
 }
 } withController:self.currentController titleAttributeString:titleAtt messageAttributeString:messageAtt Title:title message:message alertControllerStyle:UIAlertControllerStyleAlert cancelActionTitle:@"取消" cancelActionStyle:UIAlertActionStyleCancel otherButtonTitles:@"支付",@"支付", nil];
 //});

 }
 **/
@end
