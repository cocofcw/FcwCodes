//
//  Photos.h
//  ShuaJian
//
//  Created by fuchaowen on 14-9-5.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photos : UIView
@property(nonatomic,strong)UIImageView * imgv;
@property(nonatomic,strong)UIButton * btn;
- (void)CreatePhotoView:(id)target action:(SEL)action;
@end
