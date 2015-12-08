//
//  QYAnimationGrpVC.m
//  02-CoreAnimationDemos
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYAnimationGrpVC.h"

@interface QYAnimationGrpVC ()
@property (nonatomic, strong) CALayer *ctmLayer;
@end

@implementation QYAnimationGrpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayers];
}

- (void)setupLayers {
    // 1. 创建
    _ctmLayer = [CALayer layer];
    
    // 2. 属性设置
    // 2.1 外观
    _ctmLayer.backgroundColor = [UIColor redColor].CGColor;
    _ctmLayer.cornerRadius = 25;
    
    // 2.2 几何位置
    _ctmLayer.bounds = CGRectMake(0, 0, 200, 200);
    _ctmLayer.position = CGPointMake(180, 300);
    
    // 3. 添加
    [self.view.layer addSublayer:_ctmLayer];
    
    // 4. 为图层添加动画
    [self addAnimation4Layer:_ctmLayer];
}

- (void)addAnimation4Layer:(CALayer *)layer {
    // 1. sale
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.duration = 2.f;
    scaleAnim.toValue = @1.3;
    scaleAnim.fillMode = kCAFillModeBoth;
    
    // 2. rotation
    CABasicAnimation *rotateAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnim.toValue = @M_PI_4;
    rotateAnim.duration = 0.5;
    rotateAnim.beginTime = 0.5;
    rotateAnim.fillMode = kCAFillModeBoth;
    
    // 3. backgroundColor
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    colorAnim.fromValue = (__bridge id)([UIColor yellowColor].CGColor);
    colorAnim.toValue = (__bridge id)([UIColor blueColor].CGColor);
    colorAnim.duration = 1.5f;
    colorAnim.beginTime = 0.5;
    colorAnim.fillMode = kCAFillModeForwards
;
    
    // 4. 动画组
    CAAnimationGroup *grp = [CAAnimationGroup animation];
    grp.animations = @[scaleAnim, rotateAnim, colorAnim];
    grp.duration = 2.f;
    grp.repeatCount = FLT_MAX;
    grp.autoreverses = YES;
    
    // 5. 添加
    [layer addAnimation:grp forKey:nil];
}

@end
