//
//  CircleLayout.h
//  MHJProjectTwo
//
//  Created by tangmi on 16/6/12.
//  Copyright © 2016年 tangmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;

@end
