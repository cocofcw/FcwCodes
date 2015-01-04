//
//  SetUppage.m
//  ShuaJian
//
//  Created by fuchaowen on 14-9-10.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "SetUppage.h"
#import "TypeClass.h"
#import "MainPage.h"
@interface SetUppage ()
{
    NSMutableArray * arr;


}
@end

@implementation SetUppage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        arr=[NSMutableArray arrayWithCapacity:1];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView * imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, SCREEN_HEIGHT)];
    imageview.image=[UIImage imageNamed:@"耍贱头像_设置.jpg"];
    UIButton * backbtn=[UIButton buttonWithType:UIButtonTypeSystem];
    backbtn.frame=CGRectMake(0, 0, 80, 60);
    backbtn.backgroundColor=[UIColor clearColor];
    [backbtn addTarget:self action:@selector(gobackto) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imageview];
    [self.view addSubview:backbtn];
}
- (void)gobackto
{
    for (int i=0; i<10; i++) {
        NSNumber * number=[NSNumber numberWithInt:i];
        [arr addObject:number];
    }
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:arr,@"nu", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"num" object:self userInfo:dict];
    [self dismissViewControllerAnimated:NO completion:nil];


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
