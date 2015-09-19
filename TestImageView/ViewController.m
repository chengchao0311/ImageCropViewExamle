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
    UIImage * image;
    NLImageCropperView * imageCropper;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn setTitle:@"go" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationController.navigationBar.topItem.leftBarButtonItems = @[item];
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn1 setTitle:@"ok" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [btn1 addTarget:self action:@selector(cropImageAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationController.navigationBar.topItem.rightBarButtonItems = @[item2];
    
    
    imageCropper = [[NLImageCropperView alloc] initWithFrame:self.view.bounds];
    imageCropper.hidden = YES;
    [self.view addSubview:imageCropper];
    
    
}

- (void)buttonAction{
    picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info{
    __weak ViewController * weakSelf = self;
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        [weakSelf imageViewCallBack];
    }];
}

- (void)imageViewCallBack{
    self.imageView.hidden = YES;
    [imageCropper setImage:image];
    [imageCropper setCropRegionRect:CGRectMake(10, 50, 450, 680)];
    imageCropper.hidden = NO;
}

- (void)cropImageAction{
    UIImage * cropedImage = [imageCropper getCroppedImage];
    [self.imageView setImage:cropedImage];
    
    imageCropper.hidden = YES;
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.hidden = NO;
}


@end
