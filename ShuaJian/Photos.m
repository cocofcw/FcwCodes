//
//  Photos.m
//  ShuaJian
//
//  Created by fuchaowen on 14-9-5.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "Photos.h"
#import "TypeClass.h"
@implementation Photos

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)CreatePhotoView:(id)target action:(SEL)action
{
    self.imgv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 130, 320, 300)];
    [self addSubview:self.imgv];

    self.btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame=CGRectMake(100, 360, 120, 40);
    [self.btn setTitle:@"确认" forState:UIControlStateNormal];
    self.btn.tintColor=[UIColor blueColor];
    self.btn.backgroundColor=[UIColor whiteColor];
    self.backgroundColor=[UIColor blackColor];
    self.btn.layer.cornerRadius=5;
    self.btn.layer.masksToBounds=YES;
    [self.btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btn];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
