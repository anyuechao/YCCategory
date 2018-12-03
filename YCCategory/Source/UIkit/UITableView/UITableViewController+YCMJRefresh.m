//
//  UITableViewController+YCMJRefresh.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UITableViewController+YCMJRefresh.h"

@implementation UITableViewController(YCMJRefresh)

- (void)setupMJRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
}

- (void)loadNewData { }

- (void)loadMoreData { }

@end
