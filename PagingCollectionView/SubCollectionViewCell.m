//
//  SubCollectionViewCell.m
//  https://github.com/shengpeng3344/PagingCollectionView
//
//  Created by tangmi on 16/6/8.
//  Copyright © 2016年 tangmi. All rights reserved.
//

#import "SubCollectionViewCell.h"
#define angelToRandian(x)  ((x)/180.0*M_PI)


@interface SubCollectionViewCell ()

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation SubCollectionViewCell

//- (instancetype)init
//{
//    if (self = [super init]) {
//        self = [[[NSBundle mainBundle]loadNibNamed:@"SubCollectionViewCell" owner:self options:nil] lastObject];
//    }
//    return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleShake:) name:editStateChanged object:nil];
    
}

- (void)setData:(id)data
{
    _data = data;
    
    //这里完成cell的初始化设置工作  设置图片 title等
    
}

- (IBAction)clickDeleteButton:(id)sender {
    
    NSLog(@"delete");
    //删除功能
//    [[NSNotificationCenter defaultCenter] postNotificationName:deleteCell object:self];
    
    //原使用notification会出现野指针问题，我们使用代理，将数据源在delegate中操作，这下没问题
    if (_delegate && [_delegate respondsToSelector:@selector(modelCellButton:)]) {
        [_delegate modelCellButton:self];
    }
}

- (void)handleShake:(NSNotification*)sender
{
    if ([sender.object intValue] == YES) {
        
        self.deleteButton.hidden = NO;
        self.deleteButton.userInteractionEnabled = YES;
    
    }else{
        self.deleteButton.hidden = YES;

    }
}
//
//- (void)shake
//{
//    if ([self.layer animationForKey:animationKey]) {
//        return;
//    }
//    CAKeyframeAnimation* anim=[CAKeyframeAnimation animation];
//    anim.keyPath=@"transform.rotation";
//    anim.values=@[@(angelToRandian(-5)),@(angelToRandian(5)),@(angelToRandian(-5))];
//    anim.repeatCount=MAXFLOAT;
//    anim.duration=0.2;
//    [self.layer addAnimation:anim forKey:animationKey];
//}

//- (void)stopShake
//{
//    [self.layer removeAllAnimations];
//}


@end
