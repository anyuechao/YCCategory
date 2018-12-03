//
//  UICollectionView+YCCategory.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UICollectionElementKind) {
    UICollectionElementKindCustom,
    UICollectionElementKindHeader,
    UICollectionElementKindFooter
};

@interface UICollectionView(YCCategory)

- (nonnull __kindof UICollectionViewCell *)yc_dequeueCell:(nullable Class)cellClass forIndexPath:(nonnull NSIndexPath *)indexPath;

- (nullable __kindof UICollectionReusableView *)yc_dequeueSupplementaryView:(UICollectionElementKind)elementKind aClass:(nullable Class)aClass forIndexPath:(nonnull NSIndexPath *)indexPath;

- (void)yc_registerClassForCell:(nullable Class)cellClass;

- (void)yc_registerClassForSupplementaryView:(nullable Class)aClass forSupplementaryViewOfKind:(UICollectionElementKind)elementKind;

- (void)yc_registerNibForCell:(nullable Class)cellClass;

- (void)yc_registerNibForSupplementaryView:(nullable Class)aClass forSupplementaryViewOfKind:(UICollectionElementKind)elementKind;
@end
