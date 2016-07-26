//
//  ViewController.m
//  01-手势识别
//
//  Created by  gola green on 16/7/16.
//  Copyright © 2016年 crazyit.org. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //0 打开UIImageView的用户交互
    self.iconImageView.userInteractionEnabled = YES;
    //1 创建手势识别器
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    //2 设置用户必须点击几次才能出发点击事件
    tap.numberOfTapsRequired = 2;
    //2.1 设置用户必须同时两根手指点击才能触发事件
    tap.numberOfTouchesRequired = 1;
    
    //3 添加手势识别器到view
    [self.iconImageView addGestureRecognizer:tap];
    //4 监听手势识别器
    [tap addTarget:self action:@selector(tapView)];
    
    tap.delegate = self;
  
//    [self.iconImageView addGestureRecognizer:  [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)]];
}
//代理方法 该方法返回一个BOOL值,该BOOL值决定了是否响应此次点击事件
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //在iOS中 对于大部分Bool返回类型的方法先返回YES 看看有什么效果在进行进步一步判断
    CGPoint point = [touch locationInView:touch.view];
    NSLog(@"shouldReceiveTouch %@",NSStringFromCGPoint(point));
    
    if (point.x>self.iconImageView.frame.size.width*0.5) {
        return YES;
    }else{
    return NO;
    }
}
- (void)tapView
{
    NSLog(@"图片被点击了");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
