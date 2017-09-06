//
//  ViewController.m
//  03UIButtonEvents
//
//  Created by lingdian on 17/9/1.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void) createBtn{
    //创建圆角按钮
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn.frame=CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    //p1 谁来实现 事件函数，实现者对象 就是 谁
    //p2 @selector(pressBtn)函数对象 当按钮满足p3事件类型时 调用该函数  这个函数 一定是在p1里面
    //p3 UIControlEvent 事件处理函数类型
    //UIControlEventTouchUpInside 控件上离开触发的事件  UIControlEventTouchUpOutside 手纸在控件外部离开
    [btn addTarget:self action:@selector(pressBtn1) forControlEvents:UIControlEventTouchUpInside];
    //pressBtn2: 表示 是带参数的函数 这里不可以写具体的参数 ,系统帮我们把这个按钮本身作为参数 传递给函数
    [btn addTarget:self action:@selector(pressBtn2:) forControlEvents:UIControlEventTouchUpOutside];
    
//     [btn addTarget:self action:@selector(pressBtn2:btn) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:btn];
    btn.tag=101;
    
    UIButton* btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn2.frame=CGRectMake(100, 200, 80, 40);
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    
    [btn2 addTarget:self action:@selector(pressBtn2:) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview:btn2];
    
    btn2.tag=102;//tag 相当于我们的id 他是int类型的
    
}
//view是系统给添加的 触发按钮的本身
-(void)pressBtn2:(UIView*)view{
    if( view.tag==101){
        NSLog(@"Outside 按钮1 ");
    }else{
    NSLog(@"Outside 按钮2  ");
    }
    
}

-(void)pressBtn1{
    NSLog(@"pressBtn");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
