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
#define TopOrigin 20
@interface ViewController ()
@property (strong,nonatomic) UIImageView *topImageView;
@property (strong,nonatomic) UIImageView *bottomImageView;
@property (strong,nonatomic) UIImageView *leftImageView;
@property (strong,nonatomic) UIImageView *rightImageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self showTopImageView];
   
}

- (void)showTopImageView{
    [self.view addSubview:self.topImageView];
    self.topImageView.topRotate().rotateX().animationRotate(2,^(BOOL flag){
        [self showBottomImageView];
    });
}

- (void)showBottomImageView{
    [self.view addSubview:self.bottomImageView];
    self.bottomImageView.bottomRotate().rotateX().animationRotate(2,^(BOOL flag){
        [self showLeftImageView];
    });
}

- (void)showLeftImageView{
    [self.view addSubview:self.leftImageView];
    self.leftImageView.leftRotate().rotateY().animationRotate(2,^(BOOL flag){
        [self showRightImageView];
    });
}

- (void)showRightImageView{
    [self.view addSubview:self.rightImageView];
    self.rightImageView.rightRotate().rotateY().animationRotate(2,^(BOOL flag){
        
    });
}

- (UIImageView *)topImageView{
    if (_topImageView == nil) {
        _topImageView=[[UIImageView alloc]init];
        
        //图片背景
        [_topImageView setImage:[UIImage imageNamed:@"wood3"]];
        
        //图片大小
        [_topImageView setFrame:CGRectMake(20, TopOrigin , Screen_Width - 40 , Screen_Height * 0.333)];
        _topImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return  _topImageView;
}

- (UIImageView *)bottomImageView{
    if (_bottomImageView == nil) {
        _bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wood1"]];
        [_bottomImageView setFrame:CGRectMake(20, Screen_Height - Screen_Height * 0.3, Screen_Width - 40, Screen_Height * 0.3)];
        _topImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _bottomImageView;
}

- (UIImageView *)leftImageView{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wood2"]];
        [_leftImageView setFrame:CGRectMake(20, _topImageView.bounds.size.height + TopOrigin , Screen_Width / 2 -30, Screen_Height * 0.3)];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wood2"]];
        [_rightImageView setFrame:CGRectMake(Screen_Width - _leftImageView.bounds.size.width - 40, _topImageView.bounds.size.height + TopOrigin , _leftImageView.bounds.size.width,  _leftImageView.bounds.size.height)];
        _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _rightImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
