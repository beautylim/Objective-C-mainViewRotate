//
//  ViewController.m
//  mainViewRotate
//
//  Created by limin on 15/10/15.
//  Copyright (c) 2015年 limin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+Rotate.h"
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (strong,nonatomic) UIView *topView;
@property (strong,nonatomic) UIImageView *topImageView;
@property (assign,nonatomic) CGRect topOldFrame;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor grayColor]];
    self.topView=[[UIView alloc]init];
    //大小
    [self.topView setFrame:CGRectMake(20, 20 , Screen_Width - 40 , Screen_Height * 0.333)];
    [self.view addSubview:self.topView];
    self.topImageView=[[UIImageView alloc]init];
    NSLog(@"topView (x=%lf,y=%lf,width=%lf,height=%lf)",self.topView.frame.origin.x,self.topView.frame.origin.y,self.view.bounds.size.width,self.view.bounds.size.height);
    //图片背景
    [self.topImageView setImage:[UIImage imageNamed:@"BgO1"]];
    //图片大小
    [self.topImageView setFrame:CGRectMake(0, 0, self.topView.bounds.size.width, self.topView.bounds.size.height)];
    //加入view
    [self.topView addSubview:self.topImageView];
    self.topView.rotateTime = 2;
    [self.topView.topRotate.rotateX animationRotate];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
