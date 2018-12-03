//
//  UILabel+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UILabel+YCCategory.h"

@implementation UILabel(YCCategory)
- (instancetype)initWithColor:(UIColor *)color andFontSize:(CGFloat)size andMutiLines:(BOOL)mutiLines {
    self = [super init];
    if (self) {
        self.font = [UIFont systemFontOfSize:size];
        self.textColor = color;
        if (mutiLines) {
            self.numberOfLines = 0;
        }
    }
    return self;
}

- (void)yc_alignTop {
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
    CGFloat finalHeight = fontSize.height * self.numberOfLines;
    CGFloat finalWidth = self.frame.size.width;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    CGRect theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font, NSParagraphStyleAttributeName: style} context:nil];
    int newLines = ((finalHeight - theStringSize.size.height) / fontSize.height);
    for (int i = 0; i < newLines; i++) {
        self.text = [self.text stringByAppendingString:@"\n"];
    }
}
@end
