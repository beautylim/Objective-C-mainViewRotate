//
//  ViewController.m
//  mainViewRotate
//
//  Created by limin on 15/10/15.
//  Copyright (c) 2015年 limin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

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
    [self.topView setFrame:CGRectMake(20, self.navigationController.navigationBar.bounds.size.height + 20 , self.view.bounds.size.width - 40 , self.view.bounds.size.height * 0.333)];
    [self.view addSubview:self.topView];
    self.topImageView=[[UIImageView alloc]init];
    NSLog(@"topView (x=%lf,y=%lf,width=%lf,height=%lf)",self.topView.frame.origin.x,self.topView.frame.origin.y,self.view.bounds.size.width,self.view.bounds.size.height);
    //图片背景
    [self.topImageView setImage:[UIImage imageNamed:@"BgO1"]];
    //图片大小
    [self.topImageView setFrame:CGRectMake(0, 0, self.topView.bounds.size.width, self.topView.bounds.size.height)];
    //加入view
    [self.topView addSubview:self.topImageView];
    self.topOldFrame=self.topView.frame;
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    CATransform3D rotate = CATransform3DMakeRotation(-M_PI/4, 1, 0., 0);
    transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 2000);
    [self.topView.layer setTransform:transform];
   [self setAnimation:self.topView.layer withDuration:2 andwithframe:self.topOldFrame ];

   
}


CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}


-(void)setAnimation: (CALayer *)layer withDuration: (NSInteger)duration andwithframe:(CGRect )oldframe  {

    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    keyAnima.keyPath=@"transform.rotation.x";
    NSNumber *num1=[NSNumber numberWithFloat:-M_PI * 0.35];
    NSNumber *num2=[NSNumber numberWithFloat:M_PI * 0.25];
    NSNumber *num3=[NSNumber numberWithFloat:-M_PI * 0.1];
    NSNumber *num4=[NSNumber numberWithFloat:M_PI * 0.05];
    NSNumber *num5=[NSNumber numberWithFloat:-M_PI * 0.025];
    NSNumber *num6=[NSNumber numberWithFloat:M_PI * 0.0];
    NSNumber *time1=[NSNumber numberWithFloat: 0.0];
    NSNumber *time2=[NSNumber numberWithFloat: 0.2];
    NSNumber *time3=[NSNumber numberWithFloat: 0.5];
    NSNumber *time4=[NSNumber numberWithFloat: 0.75];
    NSNumber *time5=[NSNumber numberWithFloat: 0.9];
    NSNumber *time6=[NSNumber numberWithFloat: 1.0];
    keyAnima.values=@[num1,num2,num3,num4,num5,num6];
    keyAnima.keyTimes=@[time1,time2,time3,time4,time5,time6];
    keyAnima.fillMode=kCAFillModeForwards;
    keyAnima.duration = duration;
    keyAnima.removedOnCompletion = NO;
    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyAnima.delegate = self;
    [layer setAnchorPoint:CGPointMake(0.5, 0)];
    layer.frame = oldframe;
    [layer addAnimation:keyAnima forKey:@"animateTransform"];
    
}
-(void)removeAnimation:(CALayer *)layer withKey: (NSString *)string{
    [layer removeAnimationForKey:string];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
