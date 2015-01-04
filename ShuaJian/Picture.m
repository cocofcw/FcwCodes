//
//  Picture.m
//  ShuaJian
//
//  Created by fuchaowen on 14-9-11.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "Picture.h"
#import "TypeClass.h"
#import "MainPage.h"
@interface Picture ()
{
    NSMutableArray *namearr;

}
@end

@implementation Picture

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
             namearr=[NSMutableArray arrayWithCapacity:1];
        for (int n=0; n<40; n++) {
            NSString * namestr=[NSString stringWithFormat:@"%d.jpg",n+1];
            [namearr addObject:namestr];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView * navigationbar=[[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 64)];
    navigationbar.backgroundColor=[UIColor blackColor];
    [self.view addSubview:navigationbar];
    UIButton * leftbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame=CGRectMake(10, 15, 50,30);
    [leftbtn setImage:[UIImage imageNamed:@"耍贱头像设置按钮_03.png"] forState:UIControlStateNormal];
    [leftbtn addTarget:self action:@selector(backto) forControlEvents:UIControlEventTouchUpInside];
    [navigationbar addSubview:leftbtn];
    UILabel * title=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 120, 50)];
    title.text=@"耍贱图库";
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor=[UIColor whiteColor];
    title.font=[UIFont systemFontOfSize:22];
    [navigationbar addSubview:title];
    UICollectionViewFlowLayout * layout=[[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    UICollectionView * cview=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 84, 320, SCREEN_HEIGHT-84-60) collectionViewLayout:layout];
    self.cell=[[PhotoCell alloc]init];
    [cview registerClass:[self.cell class]forCellWithReuseIdentifier:@"ccell"];
    cview.backgroundColor=[UIColor blackColor];
    [self.view addSubview:cview];
    cview.dataSource=self;
    cview.delegate=self;
    UIView * footview=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, 320, 60)];
    footview.backgroundColor=[UIColor blackColor];
    [self.view addSubview:footview];
    UILabel * foot=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 120, 50)];
    foot.text=@"好图任君选";
    foot.textAlignment=NSTextAlignmentCenter;
    foot.textColor=[UIColor whiteColor];
    foot.font=[UIFont systemFontOfSize:20];
    [footview addSubview:foot];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return namearr.count;
    
    
}
- (NSString*)imageIcon:(NSString*)_imageName
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * docP=[doc stringByDeletingLastPathComponent];
    NSString * docPath=[docP stringByAppendingString:@"/"];
    NSString *imagePath = [docPath stringByAppendingString:_imageName];
    NSFileManager * fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:imagePath] == NO) {
        NSString *imageBundlePath = [[NSBundle mainBundle] pathForResource:_imageName ofType:nil];
        [fm copyItemAtPath:imageBundlePath toPath:imagePath error:nil];
    }
    return imagePath;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ccell" forIndexPath:indexPath];
    NSString * imgpath=[self imageIcon:[namearr objectAtIndex:indexPath.row]];
    UIImage * img=[[UIImage alloc]initWithContentsOfFile:imgpath];
    self.cell.cellimgview.image=img;
    
    return self.cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return  CGSizeMake(100, 100);
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets edge={5,5,5,5};
    return edge;
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
 
    NSString * imgname=[namearr objectAtIndex:indexPath.row];
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:imgname,@"ign", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"imgname" object:self userInfo:dict];
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)backto
{

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
