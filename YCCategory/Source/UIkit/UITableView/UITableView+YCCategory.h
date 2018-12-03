//
//  UITableView+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView(YCCategory)

- (nonnull __kindof UITableViewCell *)yc_dequeueCell:(nullable Class)cellClass forIndexPath:(nonnull NSIndexPath *)indexPath;

- (nullable __kindof UITableViewHeaderFooterView *)yc_dequeueHeaderFooter:(nullable Class)aClass;

- (void)yc_registerClassForCell:(nullable Class)cellClass;

- (void)yc_registerClassForHeaderFooter:(nullable Class)aClass;

- (void)yc_registerNibForCell:(nullable Class)cellClass;

- (void)yc_registerNibForHeaderFooter:(nullable Class)aClass;
@end
