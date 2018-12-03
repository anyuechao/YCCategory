//
//  UICollectionViewController+YCMJRefresh.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UICollectionViewController+YCMJRefresh.h"
#import <MJRefresh/MJRefresh.h>

@implementation UICollectionViewController(YCMJRefresh)
- (void)setupMJRefresh {
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)loadNewData { }

- (void)loadMoreData { }
@end
