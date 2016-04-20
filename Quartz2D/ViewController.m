//
//  ViewController.m
//  Quartz2D
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"
#import "secondView.h"
#import "thirdView.h"

@interface ViewController ()
{
    thirdView * _thirdView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _thirdView = [[thirdView alloc] initWithFrame:CGRectMake(10, 10, 250, 250)];
//    [view drawRect:CGRectMake(100, 100, 250, 250)];
    _thirdView.text = @"我真的还想";
    _thirdView.imageName = @"default";
    [self.view addSubview:_thirdView];
    _thirdView.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(show:) name:@"123" object:nil];
//    UIImage * image = [[thirdView shareView] getImageWithImage:[UIImage imageNamed:@"default"] text:@"哈哈哈哈"];
    
}

-(void)show:(id)sender
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 400, 250, 250)];
    imageView.image = _thirdView.myimage;
    [self.view addSubview:imageView];
}

-(void)showmyView
{
    myView * view = [[myView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor =[ UIColor whiteColor];
    [self.view addSubview:view];
}

-(void)showSecondView
{
    secondView * view = [[secondView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

-(void)showthirdView
{
    thirdView * view = [[thirdView alloc] initWithFrame:CGRectMake(100, 100, 250, 250)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

@end
