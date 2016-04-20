//
//  secondView.m
//  Quartz2D
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "secondView.h"

@implementation secondView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect
{
    
#if 0
    //1.取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.创建路径对象
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);//移动到指定位置（设置路径起点）
    CGPathAddLineToPoint(path, nil, 20, 100);//绘制直线（从起始位置开始）
    CGPathAddLineToPoint(path, nil, 300, 100);//绘制另外一条直线（从上一直线终点开始绘制）
    //3.添加路径到图形上下文
    CGContextAddPath(context, path);
    //4.设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);//设置填充色
    CGContextSetLineWidth(context, 2.0);//设置线条宽度
    CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置连接点样式
    /*设置线段样式
     CGContextSetLineDash(context, phase, lengths, count);
     phase:虚线开始的位置 lengths:虚线长度间隔 count:虚线数组元素个数
     */
    CGFloat lengths[2] = { 18, 9 };
    CGContextSetLineDash(context, 0, lengths, 2);
    /*设置阴影
     CGContextSetShadowWithColor(context, offset, blur, color);
     offset:偏移量 blur:模糊度 color:阴影颜色
     */
    CGColorRef color = [UIColor grayColor].CGColor;//Quartz2D是跨平台的，使用的是C语言
    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.8, color);
    //5.绘制图像到指定图形上下文
    /*填充方式CGPathDrawingMode
     kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
     kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
     kCGPathStroke:只有边框
     kCGPathFillStroke：既有边框又有填充
     kCGPathEOFillStroke：奇偶填充并绘制边框
     */
    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型
    //6.释放路径对象
    CGPathRelease(path);
#endif
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect2 = CGRectMake(100, 100, 200, 100);
    //绘制矩形
//    CGContextAddRect(context,rect2);
    //绘制椭圆
    CGContextAddEllipseInRect(context, rect2);
    
    //UIRectFill(rect2);//只有填充
//    UIRectFrame(rect2);//只有边框
    [[UIColor greenColor] setStroke];
    [[UIColor greenColor] setFill];
    CGContextDrawPath(context, kCGPathStroke);
    
    //绘制弧度
    /*
     context:绘制上下文
     x:中心点x坐标
     y:中心点y坐标
     radius:半径
     startAngle:起始弧度，0表示圆的最右边开始
     endAngle:终止弧度，正值表示顺时针计算
     closewise:是否逆时针绘制，0则顺时针绘制
     */
    CGContextRef context2 = UIGraphicsGetCurrentContext();
//    CGContextAddArcToPoint(context2, 50, 300, 200, 400, 0.5);
    CGContextAddArc(context2, 100, 300, 50, M_PI,M_PI*1.5, 0);
    CGContextDrawPath(context2, kCGPathFillStroke);
    
    //绘制二次贝塞尔曲线
    /*
     context:图形上下文
     cpx:控制点x坐标
     cpy:控制点y坐标
     x:结束点x坐标
     y:结束点y坐标    
     */
    CGContextRef context3 = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context3, 200, 300);
    CGContextAddQuadCurveToPoint(context3, 300, 300, 200, 450);
    CGContextDrawPath(context3, kCGPathStroke);
    
    //绘制三次贝塞尔曲线
    /*
     context:图形上下文
     cp1x:第一个控制点x坐标
     cp1y:第一个控制点y坐标
     cp2x:第二个控制点x坐标
     cp2y:第二个控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextRef context4 = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context4, 60, 500);
    CGContextAddCurveToPoint(context4, 130, 400, 260, 600, 350, 500);
    CGContextDrawPath(context4, kCGPathStroke);
}

@end
