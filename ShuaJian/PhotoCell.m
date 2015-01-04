//
//  PhotoCell.m
//  ShuaJian
//
//  Created by fuchaowen on 14-9-11.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cellimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:self.cellimgview];
    }
    return self;
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
