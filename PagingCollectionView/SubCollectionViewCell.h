//
//  SubCollectionViewCell.h
//  https://github.com/shengpeng3344/PagingCollectionView
//
//  Created by tangmi on 16/6/8.
//  Copyright © 2016年 tangmi. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *reusableCell = @"SubCollectionViewCell";

static NSString *editStateChanged = @"editStateChanged";

static NSString *deleteCell = @"deleteCellNotification";

@interface SubCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *headerButton;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;




//- (void)shake;
//
//- (void)stopShake;

@end
