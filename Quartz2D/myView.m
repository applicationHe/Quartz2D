//
//  myView.m
//  Quartz2D
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "myView.h"

@implementation myView



- (void)drawRect:(CGRect)rect {
    //1.获取图形上下文
    CGContextRef content = UIGraphicsGetCurrentContext();
    
    //2.添加路径（相当于前面创建路径并添加路径到图形上下文两步操作）
    CGContextMoveToPoint(content, 20, 50);
    CGContextAddLineToPoint(content, 20, 100);
    CGContextAddLineToPoint(content, 300, 100);
    
    //封闭路径:直接调用路径封闭方法
    CGContextClosePath(content);
    
     //3.设置图形上下文属性
    [[UIColor redColor] setStroke];//设置红色边框
    [[UIColor greenColor] setFill];//设置填充颜色
    
    //4.绘制路径
    CGContextDrawPath(content, kCGPathFillStroke);
    
}


@end
