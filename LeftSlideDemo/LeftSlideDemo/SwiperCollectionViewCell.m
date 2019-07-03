//
//  SwiperCollectionViewCell.m
//  TestDemo
//
//  Created by Hehuimin on 2019/6/4.
//  Copyright © 2019 Hehuimin. All rights reserved.
//

#import "SwiperCollectionViewCell.h"

@interface SwiperCollectionViewCell ()

@property (nonatomic, strong) UIButton *deleteBtn;
@property (nonatomic, strong) UIButton *collectionBtn;
@property (strong, nonatomic) IBOutlet UIView *bgView;

@end

@implementation SwiperCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UISwipeGestureRecognizer *swiperGesLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    [swiperGesLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.bgView addGestureRecognizer:swiperGesLeft];
    
    UISwipeGestureRecognizer *swiperGesRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    [swiperGesRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.bgView addGestureRecognizer:swiperGesRight];
    
    //代码实现
//    [self addSubview:self.deleteBtn];
//    [self addSubview:self.collectionBtn];
//    [self sendSubviewToBack:self.deleteBtn];
//    [self sendSubviewToBack:self.collectionBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    UIView *bgView = [[UIView alloc] initWithFrame:self.contentView.bounds];
//    bgView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
//    [self.contentView addSubview:bgView];
    
    self.deleteBtn.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 50, 0, 50, CGRectGetHeight(self.frame));
    
    self.collectionBtn.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 0, 50, CGRectGetHeight(self.frame));
}

- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(onDelete) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}

- (UIButton *)collectionBtn
{
    if (!_collectionBtn) {
        _collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectionBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_collectionBtn addTarget:self action:@selector(onCollection) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectionBtn;
}

- (void)onSwipe:(UISwipeGestureRecognizer *)swipeGes
{
    [UIView animateWithDuration:0.3 animations:^{
        if (swipeGes.direction == UISwipeGestureRecognizerDirectionLeft) {
            self.bgView.frame = CGRectMake(-100, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 50);
        }else if (swipeGes.direction == UISwipeGestureRecognizerDirectionRight) {
            [UIView animateWithDuration:0.3 animations:^{
                self.bgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
            }];
        }
    }];
}

- (void)onDelete
{
    NSLog(@"点击了删除");
}

- (void)onCollection
{
    NSLog(@"点击了收藏");
}

@end
