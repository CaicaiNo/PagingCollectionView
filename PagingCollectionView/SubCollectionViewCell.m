//
//  SubCollectionViewCell.m
//  MHJProjectTwo
//
//  Created by tangmi on 16/6/8.
//  Copyright © 2016年 tangmi. All rights reserved.
//

#import "SubCollectionViewCell.h"
#define angelToRandian(x)  ((x)/180.0*M_PI)
static NSString *animationKey = @"PagingShakeAnimation";

@interface SubCollectionViewCell ()

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation SubCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleShake:) name:editStateChanged object:nil];

}



- (IBAction)clickDeleteButton:(id)sender {
    
    NSLog(@"delete");
    //删除功能
    [[NSNotificationCenter defaultCenter] postNotificationName:deleteCell object:self];
    
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
