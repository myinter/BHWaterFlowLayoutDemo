//
//  ViewController.m
//  BHWaterFlowLayoutDemo
//
//  Created by bighiung on 2018/7/27.
//  Copyright © 2018年 bighiung. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _waterFlowLayout.numberOfItems = 500;
    _waterFlowLayout.delegate = self;
    _waterFlowLayout.columnNumber = 4;
    _waterFlowLayout.verticalMargin = 5.0;
    _waterFlowLayout.horizontalMargin = 10.0;
    _waterFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [_waterFlowLayout calculateLayoutFromIndex:0 reloadAfterCalculated:YES];
    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"12312"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_waterFlowLayout addItemsAtIndex:500 addedItemsCount:199];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)heightWidthRatioForItemAtIndex:(NSInteger)index{
    return ((rand() % 10) + 1) * 0.3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _waterFlowLayout.numberOfItems;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"12312" forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
