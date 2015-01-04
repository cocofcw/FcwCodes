//
//  NLViewController.m
//  NLImageCropper
//
// Copyright © 2012, Mirza Bilal (bilal@mirzabilal.com)
// All rights reserved.
//  Permission is hereby granted, free of charge, to any person obtaining a copy
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
// 1.	Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
// 2.	Redistributions in binary form must reproduce the above copyright notice,
//       this list of conditions and the following disclaimer in the documentation
//       and/or other materials provided with the distribution.
// 3.	Neither the name of Mirza Bilal nor the names of its contributors may be used
//       to endorse or promote products derived from this software without specific
//       prior written permission.
// THIS SOFTWARE IS PROVIDED BY MIRZA BILAL "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL MIRZA BILAL BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
// IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "NLViewController.h"
#import "MainPage.h"
@interface NLViewController ()
{
    UIImage * myphoto;

}
@end

@implementation NLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageCropper = [[NLImageCropperView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_imageCropper];
    self.image=[UIImage imageNamed:@"sample.jpg"];
    
    //10,50,450,680
    [_imageCropper setCropRegionRect:CGRectMake(10, 50, 300, 300)];
    UIButton * btnsave=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnsave setTitle:@"确定" forState:UIControlStateNormal];
    btnsave.frame=CGRectMake(100, 410, 120, 40);
    btnsave.backgroundColor=[UIColor whiteColor];
    btnsave.layer.cornerRadius=5;
    btnsave.layer.masksToBounds=YES;
    [btnsave addTarget:self action:@selector(selectpic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnsave];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(takephoto:) name:@"pic" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(takemypic:) name:@"selectpic" object:nil];
}
- (void)selectpic
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"begin" object:self];
   
  
    
}
- (void)takemypic:(NSNotification*)info
{
    UIImage * backimg=[[info userInfo]valueForKey:@"sepic"];
    [_imageCropper setImage:backimg];

}
- (void)takephoto:(NSNotification*)info
{
   myphoto=[[info userInfo]valueForKey:@"myimg"];
    MainPage *mp=[[MainPage alloc]init];
    mp.picto=myphoto;
    [self presentViewController:mp animated:NO completion:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
