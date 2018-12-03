//
//  UICollectionView+YCCategory.m
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import "UICollectionView+YCCategory.h"

@implementation UICollectionView(YCCategory)
- (NSString *)yc_getCollectionElementKindString:(UICollectionElementKind)elementKind aClass:(nullable Class)aClass {
    switch (elementKind) {
            case UICollectionElementKindCustom:
            return [NSString stringWithFormat:@"UICollectionElementKind_%@", [NSString stringWithFormat:@"%@", aClass]];
            break;
            case UICollectionElementKindHeader:
            return @"UICollectionElementKindSectionHeader";
            break;
            case UICollectionElementKindFooter:
            return @"UICollectionElementKindSectionFooter";
            break;
        default:
            break;
    }
}

- (nonnull __kindof UICollectionViewCell *)yc_dequeueCell:(nullable Class)cellClass forIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%@", cellClass] forIndexPath:indexPath];
}

- (nullable __kindof UICollectionReusableView *)yc_dequeueSupplementaryView:(UICollectionElementKind)elementKind aClass:(nullable Class)aClass forIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self dequeueReusableSupplementaryViewOfKind:[self yc_getCollectionElementKindString:elementKind aClass:aClass] withReuseIdentifier:[NSString stringWithFormat:@"%@", aClass] forIndexPath:indexPath];
}

- (void)yc_registerClassForCell:(nullable Class)cellClass {
    [self registerClass:cellClass forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@", cellClass]];
}

- (void)yc_registerClassForSupplementaryView:(nullable Class)aClass forSupplementaryViewOfKind:(UICollectionElementKind)elementKind {
    [self registerClass:aClass forSupplementaryViewOfKind:[self yc_getCollectionElementKindString:elementKind aClass:aClass] withReuseIdentifier:[NSString stringWithFormat:@"%@", aClass]];
}

- (void)yc_registerNibForCell:(nullable Class)cellClass {
    NSString *nibName = [NSString stringWithFormat:@"%@", cellClass];
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:nibName];
}

- (void)yc_registerNibForSupplementaryView:(nullable Class)aClass forSupplementaryViewOfKind:(UICollectionElementKind)elementKind {
    NSString *nibName = [NSString stringWithFormat:@"%@", aClass];
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forSupplementaryViewOfKind:[self yc_getCollectionElementKindString:elementKind aClass:aClass] withReuseIdentifier:nibName];
}
@end
