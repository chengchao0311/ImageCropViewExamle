//
//  ViewController.m
//  TestImageView
//
//  Created by Xinqi Chan on 9/19/15.
//  Copyright (c) 2015 Xinqi Chan. All rights reserved.
//

#import "ViewController.h"
#import "NLImageCropperView.h"

@interface ViewController (){
    UIImagePickerController * picker;
    NLImageCropperView * imageCropper;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn1 setTitle:@"ok" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [btn1 addTarget:self action:@selector(cropImageAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationController.navigationBar.topItem.rightBarButtonItems = @[item2];
    
    imageCropper = [[NLImageCropperView alloc] initWithFrame:self.view.bounds];
    UIImage * image = [UIImage imageNamed:@"peace.jpg"];
    [imageCropper setImage:image];
    CGRect rect = CGRectMake(0,0,150, 150);
    [imageCropper setCropRegionRect:rect];
    [self.view addSubview:imageCropper];
    
}

- (void)cropImageAction{
    UIImage * cropedImage = [imageCropper getCroppedImage];
    imageCropper.hidden = YES;
    [self.imageView setImage:cropedImage];
}


@end
