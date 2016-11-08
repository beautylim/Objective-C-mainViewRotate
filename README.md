# mainViewRotate
Objective-C 实现的UIView及其子类如UIImageView，沿着四边从里向外3D旋转!

![效果图](https://github.com/beautylim/Objective-C-mainViewRotate/blob/master/mainViewRotate/rotate.gif)

效果如上图所示：

###使用方法：

![image](https://github.com/beautylim/Objective-C-mainViewRotate/blob/master/mainViewRotate/rotateUsage.png)
将<code>UIView+Rotate.h</code>和<code>UIView+Rotate.m</code>文件拖进项目，在所需要的<code>viewController</code><code>import</code><code>UIView+Rotate.h</code>文件

在所需的代码位置中写下：

#1.单个旋转
<code>self.topImageView.topRotate().rotateX().animationRotate(2,^(BOOL flag){
      //加入动画完成以后的操作
    });</code>

#2.有顺序旋转
```
[self showTopImageView];
- (void)showTopImageView{
    [NSThread sleepForTimeInterval:2];
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
```
欢迎来修改，指正或者有更好的代码设计模式和动画处理
