//
//  QYView.m
//  03-绘制箭头(clip)
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYView.h"

@implementation QYView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    // 1. 获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    /**
     *  设置裁剪区域
     */
    CGContextMoveToPoint(ctx, 90, 100);
    CGContextAddLineToPoint(ctx, 110, 100);
    CGContextAddLineToPoint(ctx, 100, 80);
    CGContextClosePath(ctx);
    
    CGContextAddRect(ctx, rect);
    CGContextEOClip(ctx);
    
    // 2.1 绘制轴
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 100, 25);
    
    CGContextSetLineWidth(ctx, 100);
    /*
     CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
     CGContextStrokePath(ctx);
     */
    
    /**
     * 确定不施加渐变规则的区域 (clip area)
     */
    // 将stroked path -> fill path
    CGContextReplacePathWithStrokedPath(ctx);
#warning ????????????
#if 1
    // 首先保存之前的裁剪区域
    CGContextSaveGState(ctx);
    // 再确定新的裁剪区域
    CGContextClip(ctx);
#endif
    
    
    
    // 绘制渐变
    // 创建颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    // 颜色components
    const CGFloat components[] =
    {
        1, 0, 0, 1,
        1, 165/255.0, 0, 1,
        1, 1, 0, 1,
        0,1,0,1,
        0,127/255.0,1,1,
        0,0,1,1,
        139/255.0,0,1
    };
    // locations
    const CGFloat locations[] = {0, 0.2,0.4,0.6,0.8,0.9,1};
    // 创建渐变对象
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 3);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(90, 100), CGPointMake(210, 100), 0);
    
    // 释放颜色颜色空间对象
    CGColorSpaceRelease(colorSpace);
    // 释放渐变对象
    CGGradientRelease(gradient);
#warning 恢复之前的裁剪区域
    // 恢复之前的裁剪区域
    CGContextRestoreGState(ctx);
      
    // 2.2 绘制箭头
    CGContextMoveToPoint(ctx, 80, 25);
    CGContextAddLineToPoint(ctx, 120, 25);
    CGContextAddLineToPoint(ctx, 100, 0);
    
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
}

@end
















