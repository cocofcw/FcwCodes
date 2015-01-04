//
//  PhotoBtn.m
//  ShuaJian
//
//  Created by fuchaowen on 14-9-10.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "PhotoBtn.h"

@implementation PhotoBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSNumber * itag=[NSNumber numberWithInt:self.tag];
    NSDictionary * tagdic=[NSDictionary dictionaryWithObjectsAndKeys:itag,@"tag", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tagview" object:self userInfo:tagdic];

}


@end
