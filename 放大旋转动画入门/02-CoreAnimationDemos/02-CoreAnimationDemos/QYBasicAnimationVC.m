//
//  QYBasicAnimationVC.m
//  02-CoreAnimationDemos
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYBasicAnimationVC.h"

@interface QYBasicAnimationVC ()
@property (nonatomic, strong) CALayer *ctmLayer;
@end

@implementation QYBasicAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 创建并添加图层
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
    // 1. 创建动画
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"]; /*虚拟属性*/
    
    // 2. 设置动画的属性
    scaleAnim.duration = 0.3;
    scaleAnim.toValue = @1.3;
    scaleAnim.autoreverses = YES;
    scaleAnim.repeatCount = FLT_MAX;
    
    // 3. 添加动画
    [layer addAnimation:scaleAnim forKey:nil];
}

@end
