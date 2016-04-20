
//
//  thirdView.m
//  Quartz2D
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "thirdView.h"

@implementation thirdView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//+(instancetype)shareView
//{
//    static thirdView * view = nil;
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        view = [[thirdView alloc] init];
//    });
//    return view;
//}



#pragma mark 绘图
- (void)drawRect:(CGRect)rect{
    //1.获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawImage:context];
    [self drawText:context];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    self.myimage = newImage;
    
}
#pragma mark 绘制文本
- (void)drawText:(CGContextRef)context{
    //绘制到指定的区域内容
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    NSString *str = self.text;
    CGRect rect = CGRectMake(20, 50, 280, 300);
    UIFont *font = [UIFont systemFontOfSize:18];//设置字体
    UIColor *color = [UIColor redColor];//字体颜色
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];//段落样式
    style.alignment = NSTextAlignmentLeft;//对齐方式
    [str drawInRect:rect withAttributes:@{NSFontAttributeName:font,
                                          NSForegroundColorAttributeName:color,
                                          NSParagraphStyleAttributeName:style}];
    CGImageRef imageref = CGBitmapContextCreateImage(context2);
    self.myimage = [UIImage imageWithCGImage:imageref];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"123" object:nil];
}
#pragma mark 绘制图片
- (void)drawImage:(CGContextRef)context{
   
    UIImage *image = [UIImage imageNamed:self.imageName];
    //从某一点开始绘制
    [image drawAtPoint:CGPointMake(10, 50)];
    //绘制到指定的矩形中，注意如果大小不合适会会进行拉伸，图像会形变
    [image drawInRect:CGRectMake(10, 50, 300, 450)];
    //平铺绘制
    [image drawAsPatternInRect:CGRectMake(0, 0, 320, 568)];
}

@end
