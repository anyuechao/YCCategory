//
//  UIColor+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UIColor+YCCategory.h"

@implementation UIColor(YCCategory)

- (instancetype)initWithHex:(NSString *)hex {
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat alpha = 1.0;
    NSString *preHex = hex;

    if ([hex hasPrefix:@"#"]) {
        preHex = [hex substringFromIndex:1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:preHex];
    unsigned long long hexValue = 0;

    if ([scanner scanHexLongLong:&hexValue]) {

        switch (preHex.length) {
                case 3:
                red = ((hexValue & 0xF00) >> 8) / 15.0;
                green = ((hexValue & 0x0F0) >> 4) / 15.0;
                blue = (hexValue & 0x00F) / 15.0;
                break;

                case 4:
                red = ((hexValue  & 0xF000) >> 12) / 15.0;
                green = ((hexValue & 0x0F00) >> 8) / 15.0;
                blue = ((hexValue & 0x00F0) >> 4) / 15.0;
                alpha = (hexValue & 0x000F) / 15.0;
                break;

                case 6:
                red = ((hexValue & 0xFF0000) >> 16) / 255.0;
                green = ((hexValue & 0x00FF00) >> 8) / 255.0;
                blue = (hexValue & 0x0000FF) / 255.0;
                break;

                case 8:
                red = ((hexValue & 0xFF000000) >> 24) / 255.0;
                green = ((hexValue & 0x00FF0000) >> 16) / 255.0;
                blue = ((hexValue & 0x0000FF00) >> 8) / 255.0;
                alpha = (hexValue & 0x000000FF) / 255.0;
                break;

            default:
                NSAssert(preHex.length > 8 && preHex.length < 3, @"无效的十六进制RGB／RGBA字符串");

                break;
        }
    }
    return [self initWithRed:red green:green blue:blue alpha:alpha];
}

+ (instancetype)yc_colorWithHex:(NSString *)hex {
    return [[self alloc] initWithHex:hex];
}
@end
