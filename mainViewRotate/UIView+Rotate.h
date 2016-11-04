//
//  UIView+Rotate.h
//  mainViewRotate
//
//  Created by li.min on 2016/11/4.
//  Copyright © 2016年 limin. All rights reserved.
//

#import <UIKit/UIKit.h>
//旋转的中轴
typedef NS_ENUM(NSUInteger,RAlignment) {
    RAlignment_Top = 0,
    RAlignment_Right,
    RAlignment_Bottom,
    RAlignment_Left
};
typedef void(^Finished)(BOOL);
@interface UIView (Rotate)
- (void)AnimationRotateWithDuration:(NSInteger)time alignment:(RAlignment)alignment completion:(Finished)completion;
@end

