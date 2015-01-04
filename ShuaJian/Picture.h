//
//  Picture.h
//  ShuaJian
//
//  Created by fuchaowen on 14-9-11.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCell.h"
@interface Picture : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)PhotoCell * cell;
@end
