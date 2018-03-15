//
//  ViewController.m
//  Objective-C1
//
//  Created by He on 2018/3/15.
//  Copyright © 2018年 He. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"
@interface ViewController ()<NewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NewViewController* vc = [[NewViewController alloc]init];
    vc.delegate = self;
    vc.newBlock = ^(NSString* info) {
        NSLog(@"我得到了后个页面传递的信息:%@",info);
    };
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)sendInfo:(NSString *)info {
    NSLog(@"我得到了后个页面传递的信息:%@",info);
}

@end
