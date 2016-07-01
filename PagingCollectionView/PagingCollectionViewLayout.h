//
//  PagingCollectionViewLayout.h
//  https://github.com/shengpeng3344/PagingCollectionView
//
//  Created by Simply on 16/6/9.
//  Copyright © 2016年 Simply. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagingCollectionViewLayout : UICollectionViewLayout

@property (nonatomic) CGFloat minimumLineSpacing; //行间距

@property (nonatomic) CGFloat minimumInteritemSpacing; //item间距

@property (nonatomic) CGSize itemSize; //item大小

@property (nonatomic) UIEdgeInsets sectionInset;

- (instancetype)init;

@end
