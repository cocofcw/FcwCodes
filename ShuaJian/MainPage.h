//
//  MainPage.h
//  ShuaJian
//
//  Created by fuchaowen on 14-9-2.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLImageCropperView.h"
#import "PhotoBtn.h"
#import "Picture.h"
@interface MainPage : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate,UINavigationControllerDelegate>
{

    NLImageCropperView * _ImageCroop;

}
@property(nonatomic,strong)UIImagePickerController * picker;
@property(nonatomic,strong)UIImage * picto;
@property(nonatomic,strong)UIImageView * btnview;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UIImageView * nump;
@property(nonatomic,strong)UIImageView *back;
@end
