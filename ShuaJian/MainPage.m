//
//  MainPage.m
//  ShuaJian
//
//  Created by fuchaowen on 14-9-2.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "MainPage.h"
#import "TypeClass.h"
#define NUMBERS @"1234567890\n"
#import "Draw.h"
#import "Photos.h"
#import "NLViewController.h"
#import "SetUppage.h"
@interface MainPage ()
{
    UITextField * _numb;
    UIImageView * imgv;
    UIImage *viewImage;
    Draw * _mydraw;
    CGRect currect;
    UIImage *picture;
    Photos * ps;
    NSMutableArray * ma;
    NSMutableArray * na;
}
@end
UIImage * imgt;
@implementation MainPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    ma=[NSMutableArray arrayWithCapacity:1];
    na=[NSMutableArray arrayWithCapacity:1];
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [ps removeFromSuperview];
    [_mydraw removeFromSuperview];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView * background;
    if (IS_IPHONE_5_SCREEN) {
        background=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, SCREEN_HEIGHT-20)];
    }else{
    
        background=[[UIImageView alloc]initWithFrame:CGRectMake(0, -40, 320, SCREEN_HEIGHT+80)];
    
    }
    
    background.image=[UIImage imageNamed:@"耍贱头像首页.png"];
    [self.view addSubview:background];
    if (IS_IPHONE_5_SCREEN) {
        imgv=[[UIImageView alloc]initWithFrame:CGRectMake(85, 126, 150, 145)];
    }else{
    
        imgv=[[UIImageView alloc]initWithFrame:CGRectMake(85, 66, 150, 145)];
    
    }
    imgv.image=self.picto;
    imgv.layer.cornerRadius=8;
    imgv.layer.masksToBounds=YES;
    [self.view addSubview:imgv];
    NSArray * arr=[[NSArray alloc]initWithObjects:@"耍贱头像_小丸子.png",@"耍贱头像_符号1.png",@"耍贱头像_符号2.png",@"耍贱头像_符号3.png",@"耍贱头像_符号4.png",@"耍贱头像_符号5.png", nil];
    UIScrollView * scroll=[[UIScrollView alloc]init];
    
    if (IS_IPHONE_5_SCREEN) {
        scroll.frame=CGRectMake(0, 290, 320, 60);
    }else{
    
        scroll.frame=CGRectMake(0, 230, 320, 60);
    
    }
  
    scroll.contentSize=CGSizeMake(360, 60);
    for (int i=0; i<6; i++) {
        PhotoBtn * imgk=[[PhotoBtn alloc]initWithFrame:CGRectMake(60*i,0, 60, 60)];
        
        if (i==0) {
            imgk.image=[UIImage imageNamed:@"耍贱头像_头像背景框.png"];
            self.back.image=[UIImage imageNamed:@"耍贱头像_小丸子.png"];
            self.back.frame=CGRectMake(6, 2, 48, 48);
            self.nump.image=[UIImage imageNamed:@"耍贱头像_99.png"];
            [imgk addSubview:self.back];
            [imgk addSubview:self.nump];
        
            //imgk.frame=CGRectMake(5, 0, 50, 50);
            
        }else{
        UIImage * img=[UIImage imageNamed:[arr objectAtIndex:i]];
        imgk.image=img;
        }
        imgk.tag=1000*(i+1);
        [scroll addSubview:imgk];
        imgk.userInteractionEnabled=YES;
    }
    [scroll setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:scroll];
    if (IS_IPHONE_5_SCREEN) {
         _numb=[[UITextField alloc]initWithFrame:CGRectMake(40,355, 130, 50)];
    }else{
    
         _numb=[[UITextField alloc]initWithFrame:CGRectMake(40,295, 130, 50)];
    
    }
   
    _numb.delegate=self;
    _numb.placeholder=@"请输入数字";
    _numb.autocapitalizationType=UITextAutocapitalizationTypeNone;
    UIImageView * iigv=[[UIImageView alloc]init];
    if (IS_IPHONE_5_SCREEN) {
        iigv.frame=CGRectMake(10,355, 160, 50);
    }else{
      
        iigv.frame=CGRectMake(10,295, 160, 50);
    
    }
    iigv.image=[UIImage imageNamed:@"耍贱头像_输入框.png"];
   
    [self.view addSubview:iigv];
    [self.view addSubview:_numb];
    UILabel * lab=[[UILabel alloc]init];
    if (IS_IPHONE_5_SCREEN) {
        lab.frame=CGRectMake(167, 358, 170, 40);
    }else{
    
        lab.frame=CGRectMake(167, 298, 170, 40);
    }
    lab.text=@"不要超过3位数的说~";
    [lab.layer setShadowColor:[UIColor blackColor].CGColor];
    [lab.layer setShadowOffset:CGSizeMake(1, 2)];
    [lab.layer setShadowOpacity:0.8];
    [lab.layer setShadowRadius:2];
    lab.textAlignment=NSTextAlignmentLeft;
    lab.textColor=[UIColor whiteColor];
    lab.font=[UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
    [self.view addSubview:lab];
    UIButton * selbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    if (IS_IPHONE_5_SCREEN) {
        selbtn.frame=CGRectMake(50, 410, 220, 40);
    }else{
        selbtn.frame=CGRectMake(50, 350, 220, 40);
    }
    [selbtn setImage:[UIImage imageNamed:@"耍贱头像_选择头像按钮.png"] forState:UIControlStateNormal];
    [selbtn addTarget:self action:@selector(selphotos) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selbtn];
    UIButton * savbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    if (IS_IPHONE_5_SCREEN) {
        savbtn.frame=CGRectMake(50, 460, 220, 40);
    }else{
    
        savbtn.frame=CGRectMake(50, 400, 220, 40);
    }
    
    [savbtn setImage:[UIImage imageNamed:@"耍贱头像_保存头像按钮.png"] forState:UIControlStateNormal];
    [savbtn addTarget:self action:@selector(saveheader) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:savbtn];
    UIButton * setbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    if (IS_IPHONE_5_SCREEN) {
         setbtn.frame=CGRectMake(260,SCREEN_HEIGHT-70, 50, 50);
    }else{
    
          setbtn.frame=CGRectMake(260,SCREEN_HEIGHT-50, 50, 50);
    
    }
   
    [setbtn setImage:[UIImage imageNamed:@"耍贱头像_设置按钮.png"] forState:UIControlStateNormal];
    [setbtn addTarget:self action:@selector(setup) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setbtn];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addheader:) name:@"tagview" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getpic:) name:@"imgname" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getnumber:) name:@"num" object:nil];
}
- (void)getnumber:(NSNotification*)info
{
    ma=[[info userInfo]valueForKey:@"nu"];
   
    NSLog(@"%@",ma);

}
- (void)getpic:(NSNotification*)info
{
    NSString * name=[[info userInfo]valueForKey:@"ign"];
    imgv.image=[UIImage imageNamed:name];

}
- (UIImageView*)back
{
    if (!_back) {
        _back=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        
    }
    return _back;
}
- (UIImageView*)nump
{
    if (!_nump) {
        _nump=[[UIImageView alloc]initWithFrame:CGRectMake(40, 2, 15, 15)];
        
    }
    
    
    return _nump;

}
- (UIImageView*)btnview
{
    if (!_btnview) {
        _btnview=[[UIImageView alloc]initWithFrame:CGRectMake(105,5, 40, 40)];
        
    }
    return _btnview;
}
- (UILabel*)number
{
    if (!_number) {
        _number=[[UILabel alloc]initWithFrame:CGRectMake(105, 5, 40, 40)];
        _number.backgroundColor=[UIColor redColor];
        _number.font=[UIFont systemFontOfSize:21];
        _number.textColor=[UIColor whiteColor];
        _number.textAlignment=NSTextAlignmentCenter;
    }
    return _number;
}

- (void)saveheader
{
//截取图片画面
//    CGRect imageRect = CGRectMake(imgv.frame.origin.x*imgv.image.scale,
//                                  imgv.frame.origin.y*imgv.image.scale,
//                                  imgv.frame.size.width*imgv.image.scale,
//                                  imgv.frame.size.height*imgv.image.scale);
//   
//    CGImageRef imageRef = CGImageCreateWithImageInRect([imgv.image CGImage], imageRect);
//    UIImage *result = [UIImage imageWithCGImage:imageRef
//                                          scale:imgv.image.scale
//                                    orientation:imgv.image.imageOrientation];
//    CGImageRelease(imageRef);
/////////////////////////////－－截取当前视图
    UIGraphicsBeginImageContext(imgv.frame.size);
    [imgv.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
//    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/image.jpg"];
//    if ([UIImageJPEGRepresentation(image, 1) writeToFile:path atomically:YES]) {
//        NSLog(@"save ok");
//    }
//    else {
//        NSLog(@"save failed");
//    }
   
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:nil message:@"保存头像成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    NSLog(@"ma=%@",na);
}
- (void)setup
{
    SetUppage * sup=[[SetUppage alloc]init];
    [self presentViewController:sup animated:NO completion:nil];

}
- (void)addheader:(NSNotification*)info
{
    int itag=[[[info userInfo]valueForKey:@"tag"] intValue];
    NSLog(@"itag=%d",itag);
    NSArray * btnname=[[NSArray alloc]initWithObjects:@"耍贱头像_99.png",@"符号1.png",@"符号2.png",@"符号3.png",@"符号4.png",@"符号5.png", nil];
    self.btnview.layer.cornerRadius=20;
    self.btnview.layer.masksToBounds=YES;
    self.number.layer.cornerRadius=20;
    self.number.layer.masksToBounds=YES;
    UIImage * btnimg;
    switch (itag) {
        case 1000:
            //[self.btnview removeFromSuperview];
            if ([_numb.text isEqualToString:@""]==NO) {
                self.number.text=_numb.text;
                [imgv addSubview:self.number];
            }else{
                btnimg=[UIImage imageNamed:@"耍贱头像_99.png"];
                self.btnview.image=btnimg;
                self.btnview.frame=CGRectMake(105, 5, 40, 40);
                [self.number removeFromSuperview];
                [imgv addSubview:self.btnview];
                
            }
            break;
        case 2000:
            btnimg=[UIImage imageNamed:[btnname objectAtIndex:1]];
            self.btnview.image=btnimg;
            self.btnview.frame=CGRectMake(105, 5, 40, 40);
            [self.number removeFromSuperview];
             [imgv addSubview:self.btnview];
            break;
         case 3000:
            btnimg=[UIImage imageNamed:[btnname objectAtIndex:2]];
            self.btnview.image=btnimg;
            self.btnview.frame=CGRectMake(105, 5, 40, 40);
            [self.number removeFromSuperview];
             [imgv addSubview:self.btnview];
            break;
         case 4000:
            btnimg=[UIImage imageNamed:[btnname objectAtIndex:3]];
            self.btnview.image=btnimg;
            self.btnview.frame=CGRectMake(105, 5, 40, 40);
            [self.number removeFromSuperview];
             [imgv addSubview:self.btnview];
            break;
         case 5000:
            btnimg=[UIImage imageNamed:[btnname objectAtIndex:4]];
            self.btnview.image=btnimg;
            self.btnview.frame=CGRectMake(105, 100, 40, 40);
            [self.number removeFromSuperview];
             [imgv addSubview:self.btnview];
            break;
         case 6000:
            btnimg=[UIImage imageNamed:[btnname objectAtIndex:5]];
            self.btnview.image=btnimg;
            self.btnview.frame=CGRectMake(105, 100, 40, 40);
            [self.number removeFromSuperview];
             [imgv addSubview:self.btnview];
            break;
         
        default:
            break;
            
    }
  

}
- (void)selphotos
{
    
    UIActionSheet * photoBtn = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择",@"从图片库中选", nil];
    [photoBtn setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    [photoBtn showInView:[self.view window]];
    na=ma;
    NSLog(@"na=%@",na);

}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self takePhotoBtn];
        //ma=na;
    }
    if (buttonIndex==1) {
        [self checkPhoto];
        //ma=na;
    }
    if (buttonIndex==2) {
        //ma=na;
        imgv.image=nil;
        Picture * pic=[[Picture alloc]init];
        [self presentViewController:pic animated:NO completion:nil];
    }
}

-(void)takePhotoBtn
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]==YES) {
        self.picker = [[UIImagePickerController alloc] init];
        self.picker.sourceType =UIImagePickerControllerSourceTypeCamera;
        self.picker.delegate = self;
        self.picker.allowsEditing = YES;
        [self presentViewController:self.picker animated:YES completion:nil];
        
    }
    imgv.image=nil;
    
}
-(void)checkPhoto
{
    imgv.image=nil;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]==YES) {
        self.picker = [[UIImagePickerController alloc] init];
        self.picker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        self.picker.delegate = self;
        self.picker.allowsEditing = YES;
        [self presentViewController:self.picker animated:YES completion:nil];
      
    
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    _mydraw=[[Draw alloc]initWithFrame:CGRectMake(0,128, 320,300)];
//    _mydraw.backgroundColor=[UIColor clearColor];
 //   _ImageCroop=[[NLImageCropperView alloc]initWithFrame:self.view.bounds];
//    ps=[[Photos alloc]init];
//    ps.frame=CGRectMake(0, 0 , 320, SCREEN_HEIGHT);
//    [ps CreatePhotoView:self action:@selector(showphoto)];
//    [self.view addSubview:ps];
//    UIImageView * photo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 320, 300)];
//
    picture = [info objectForKey:UIImagePickerControllerEditedImage];
//    [_ImageCroop setImage:picture];
//    ps.imgv.image = picture;
//    [picker dismissViewControllerAnimated:YES completion:nil];
    NLViewController * nvc=[[NLViewController alloc]init];
    [picker presentViewController:nvc animated:NO completion:nil];
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:picture,@"sepic", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"selectpic" object:self userInfo:dict];
//    [self.view addSubview:ps];
//    [self.view addSubview:_mydraw];
//    photo.image=picture;
  
//    CGRect rect=CGRectMake(30, 50, 5000, 5000);
//    CGImageRef sourceImageRef = [picture CGImage];
//    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
//    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
//    ps.image=newImage;
//    [ps addSubview:_mydraw];
//UIImageWriteToSavedPhotosAlbum(picture, nil, nil, nil);//将所拍照片保存到相册
//    UIGraphicsBeginImageContext(picker.view.frame.size); //currentView 当前的view
//    [picker.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    picture = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    
}
- (void)showphoto
{
 
        CGImageRef sourceImageRef = [picture CGImage];
    NSValue * value=[NSValue valueWithCGRect:currect];
        CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, currect);
        UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
        imgv.image=newImage;
    [ps removeFromSuperview];
    [_mydraw removeFromSuperview];
    ps=nil;
    _mydraw=nil;

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{ 
    
    if ([keyPath isEqualToString:@"text"]&&object==_numb) {
       
        if (_numb.text.length>3) {
             _numb.text=[_numb.text substringToIndex:3];
         
        }
        self.number.text=_numb.text;
        self.number.layer.cornerRadius=20;
        self.number.layer.masksToBounds=YES;
        [imgv addSubview:self.number];
    }

   

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSCharacterSet * cs=nil;
    NSString * filtered=nil;
        cs=[[NSCharacterSet characterSetWithCharactersInString:NUMBERS]invertedSet];
        filtered = [[string componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
        BOOL canChange = [string isEqualToString:filtered];
    return canChange;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
     [_numb addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
        [UIView animateWithDuration:0.2 animations:^{
            self.view.frame=CGRectMake(0, -50, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
    
 
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame=CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT);
    }];
    [_numb removeObserver:self forKeyPath:@"text" context:nil];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
