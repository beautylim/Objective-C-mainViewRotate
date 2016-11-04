//
//  UIView+Rotate.m
//  mainViewRotate
//
//  Created by li.min on 2016/11/4.
//  Copyright © 2016年 limin. All rights reserved.
//

#import "UIView+Rotate.h"

@implementation UIView (Rotate)

- (void)AnimationRotateWithDuration:(NSInteger)time alignment:(RAlignment)alignment completion:(Finished)completion{
    [self setRotateProperty:alignment];
    [self setAnimation:self.layer withDuration:time alignment:alignment andwithframe:self.frame];
}

- (void)setRotateProperty:(RAlignment)alignment{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    CATransform3D rotate;
    switch (alignment) {
        case RAlignment_Top:
            rotate = CATransform3DMakeRotation(-M_PI/4, 1, 0., 0);
            transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 2000);
            break;
        case RAlignment_Right:
            rotate = CATransform3DMakeRotation(-M_PI/4, 0, 1, 0);
            transform = CATransform3DPerspect(rotate, CGPointMake(1, 0), 2000);
            break;
        case RAlignment_Bottom:
            rotate = CATransform3DMakeRotation(-M_PI/4, 1, 0, 0);
            transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 2000);
            break;
        case RAlignment_Left:
            rotate = CATransform3DMakeRotation(-M_PI/4, 0, 0, 1);
            transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 2000);
        default:
            break;
    }
    
    
    [self.layer setTransform:transform];
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

-(void)setAnimation: (CALayer *)layer withDuration: (NSInteger)duration alignment:(RAlignment)alignment andwithframe:(CGRect )oldframe  {
    
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    switch (alignment) {
        case RAlignment_Top:
        case RAlignment_Bottom:
            keyAnima.keyPath=@"transform.rotation.x";
            break;
        case RAlignment_Right:
        case RAlignment_Left:
            keyAnima.keyPath=@"transform.rotation.y";
            break;
        default:
            break;
    }
    
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
    [layer setAnchorPoint:CGPointMake(0.5, 0)];
    layer.frame = oldframe;
    [layer addAnimation:keyAnima forKey:@"animateTransform"];
    
}

-(void)removeAnimation:(CALayer *)layer withKey: (NSString *)string{
    [layer removeAnimationForKey:string];
    
}
@end
