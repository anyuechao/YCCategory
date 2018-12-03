//
//  UITableView+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UITableView+YCCategory.h"

@implementation UITableView(YCCategory)
- (nonnull __kindof UITableViewCell *)yc_dequeueCell:(nullable Class)cellClass forIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@", cellClass] forIndexPath:indexPath];
}

- (nullable __kindof UITableViewHeaderFooterView *)yc_dequeueHeaderFooter:(nullable Class)aClass {
    return [self dequeueReusableHeaderFooterViewWithIdentifier:[NSString stringWithFormat:@"%@", aClass]];
}

- (void)yc_registerClassForCell:(nullable Class)cellClass {
    [self registerClass:cellClass forCellReuseIdentifier:[NSString stringWithFormat:@"%@", cellClass]];
}

- (void)yc_registerClassForHeaderFooter:(nullable Class)aClass {
    [self registerClass:aClass forHeaderFooterViewReuseIdentifier:[NSString stringWithFormat:@"%@", aClass]];
}

- (void)yc_registerNibForCell:(nullable Class)cellClass {
    NSString *nibName = [NSString stringWithFormat:@"%@", cellClass];
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
}

- (void)yc_registerNibForHeaderFooter:(nullable Class)aClass {
    NSString *nibName = [NSString stringWithFormat:@"%@", aClass];
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:nibName];
}
@end
