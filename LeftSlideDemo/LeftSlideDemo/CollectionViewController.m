//
//  CollectionViewController.m
//  TestDemo
//
//  Created by Hehuimin on 2019/6/4.
//  Copyright © 2019 Hehuimin. All rights reserved.
//

#import "CollectionViewController.h"
#import "SwiperCollectionViewCell.h"

static NSString *const reuseSwiperCollectionViewCell = @"SwiperCollectionViewCell";

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 50);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:reuseSwiperCollectionViewCell bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseSwiperCollectionViewCell];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SwiperCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseSwiperCollectionViewCell forIndexPath:indexPath];
    return cell;
}

@end
