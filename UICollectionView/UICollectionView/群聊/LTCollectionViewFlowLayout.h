//
//  LTCollectionViewFlowLayout.h
//  UICollectionView
//
//  Created by liutong on 2018/1/18.
//  Copyright © 2018年 liutong. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 扩展section的背景色
@protocol LTCollectionViewFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>
@optional
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout colorForSectionAtIndex:(NSInteger)section;
@end

@interface LTCollectionViewFlowLayout : UICollectionViewFlowLayout

@end
