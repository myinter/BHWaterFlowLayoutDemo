//
//  ViewController.h
//  BHWaterFlowLayoutDemo
//
//  Created by bighiung on 2018/7/27.
//  Copyright © 2018年 bighiung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHWaterFlowLayout.h"

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,BHWaterFlowLayoutLayoutDelegate>
{
    __weak IBOutlet UICollectionView *_collectionView;
    __weak IBOutlet BHWaterFlowLayout *_waterFlowLayout;
}

@end

