//
//  ViewController.h
//  TestImageView
//
//  Created by Xinqi Chan on 9/19/15.
//  Copyright (c) 2015 Xinqi Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

