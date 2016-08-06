//
//  ViewController.m
//  MHJProjectTwo
//
//  Created by tangmi on 16/6/7.
//  Copyright © 2016年 tangmi. All rights reserved.
//

#import "ViewController.h"

#import "SubCollectionViewCell.h"
#import "PagingCollectionViewLayout.h"

#import "CircleLayout.h"
#import "XWDragCellCollectionView.h"
@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource,XWDragCellCollectionViewDelegate,XWDragCellCollectionViewDataSource,SubCollectionViewCellDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) NSArray *data;

@property (nonatomic, strong) NSArray *data2;

@property (nonatomic, strong) NSArray *dataAll;

@property (nonatomic, strong) XWDragCellCollectionView *homeCollectionV;

@end

@implementation ViewController
{
    UIButton *_button;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    PagingCollectionViewLayout *layout = [[PagingCollectionViewLayout alloc]init];
    layout.itemSize = CGSizeMake(70, 85);
    layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;

    
    CircleLayout *myLayout = [[CircleLayout alloc]init];
    myLayout.center = self.view.center;
    myLayout.radius = 10;
    myLayout.cellCount = 13;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(70, 85);
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 2;
    
    
    NSArray *datas = @[@"alipay_r",@"bitcoin_r",@"dianpin_r",@"douban_r",@"dribbble_r",@"dropbox_r",@"email_r",@"evernote_r",@"facebook_r",@"google-plus_r",@"instagram_r",@"instapaper_r",@"line_r",@"linkedin_r",@"path_r",@"snapchat_r",@"path_r",@"snapchat_r",@"pinterest_r",@"pocket_r",@"qq_r",@"quora_r",@"qzone_r",@"readability_r",@"reddit_r",@"path_r",@"snapchat_r",@"pinterest_r",@"pocket_r",@"qq_r",@"quora_r",@"qzone_r",@"readability_r",@"reddit_r"];
    NSArray *dataTwo = @[@"path_r",@"snapchat_r",@"pinterest_r",@"pocket_r",@"qq_r",@"quora_r",@"qzone_r",@"readability_r",@"reddit_r"];
    
    
    _data2 = dataTwo;
    self.data = datas;
    self.dataAll = @[self.data];
    
    
    self.homeCollectionV = [[XWDragCellCollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 150) collectionViewLayout:layout];
    self.homeCollectionV.backgroundColor = [UIColor clearColor];
    self.homeCollectionV.tag = 100;
    self.homeCollectionV.delegate = self;
    self.homeCollectionV.dataSource = self;
    self.homeCollectionV.shakeLevel = 3.0f;
    [self.homeCollectionV setMinimumPressDuration:1.5];
    self.homeCollectionV.showsVerticalScrollIndicator = NO;
    self.homeCollectionV.showsHorizontalScrollIndicator = NO;
    self.homeCollectionV.pagingEnabled = YES;
    self.homeCollectionV.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:self.homeCollectionV];
    //注册单元格
    [self.homeCollectionV registerNib:[UINib nibWithNibName:reusableCell
                                                     bundle: [NSBundle mainBundle]] forCellWithReuseIdentifier:reusableCell];
    _button = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 60, 40)];
    _button.backgroundColor = [UIColor cyanColor];
    [_button setTitle:@"编辑" forState:UIControlStateNormal];
    [_button setTitle:@"取消" forState:UIControlStateSelected];
    [_button addTarget:self action:@selector(handle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    
//    self.view.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.25f];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)handle{
    if (_button.selected == NO) {
        [self.homeCollectionV xw_enterEditingModel];

    }else{
        [self.homeCollectionV xw_stopEditingModel];
    }
    _button.selected = !_button.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dragCellCollectionView:(XWDragCellCollectionView *)collectionView newDataArrayAfterMove:(NSArray *)newDataArray{
    
    self.dataAll = newDataArray;
    
}

- (NSArray *)dataSourceArrayOfCollectionView:(XWDragCellCollectionView *)collectionView{
    return  self.data;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    SubCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusableCell forIndexPath:indexPath];
    
    cell.delegate = self;
    NSString *name;
    
    name = [self.data objectAtIndex:indexPath.item];
//    cell.backgroundColor = [UIColor greenColor];
    [cell.headerButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.item];
//    cell.titleLabel.text = name;
    
    if (cell.hidden) {  //防止hide属性的cell的重用导致部分cell消失
        cell.hidden = NO;
    }
    
    return cell;
}

- (void)dragCellCollectionView:(XWDragCellCollectionView *)collectionView didLongPressCell:(NSIndexPath *)indexPath
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"操作列表" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"修改名称",@"配置设备",@"编辑模式", nil];
//    alertView.tag = 1000;
    [alertView show];
}

- (void)modelCellButton:(SubCollectionViewCell *)cell  //删除响应方法
{
    NSIndexPath *indexPath = [self.homeCollectionV indexPathForCell:cell];
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.data];
    
    [tmpArray removeObjectAtIndex:indexPath.item];
    
    self.data = tmpArray;
    
    [self.homeCollectionV deleteItemsAtIndexPaths:@[indexPath]];
}


@end
