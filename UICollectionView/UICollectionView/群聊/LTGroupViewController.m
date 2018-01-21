//
//  LTGroupViewController.m
//  UICollectionView
//
//  Created by liutong on 2018/1/18.
//  Copyright © 2018年 liutong. All rights reserved.
//

#import "LTGroupViewController.h"
#import "LTCollectionViewFlowLayout.h"

@interface LTGroupViewController ()<LTCollectionViewFlowLayoutDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation LTGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"群聊信息";
    self.view.backgroundColor = [UIColor controllerThemeBGColor];
    [self createCollectionView];
}

- (void)createCollectionView
{
    CGRect rect = [self tableFrame];
    LTCollectionViewFlowLayout *flowLayout= [[LTCollectionViewFlowLayout alloc]init];
    //    flowLayout.minimumInteritemSpacing = 0;
    //    flowLayout.minimumLineSpacing =0;
    _collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
//    [_collectionView registerClass:[SNSGroupUserCell class] forCellWithReuseIdentifier:userHeaderCellReuseid];
//    [_collectionView registerClass:[SNSGroupUserCell class] forCellWithReuseIdentifier:userAddHeaderCell];
//    [_collectionView registerClass:[SNSGroupSettingCell class] forCellWithReuseIdentifier:settingCellReuseId];
//    [_collectionView registerClass:[SNSGroupSettingSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderReuseId];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    _collectionView.alwaysBounceVertical = YES;
}

- (CGRect)tableFrame {
    return CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), self.view.frame.size.width, CGRectGetMaxY(self.view.frame)- CGRectGetMaxY(self.navigationController.navigationBar.frame));
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
#pragma mark - LTCollectionViewFlowLayoutDelegate
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout colorForSectionAtIndex:(NSInteger)section {
    return [UIColor clearColor];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
