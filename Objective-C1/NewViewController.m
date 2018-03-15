//
//  NewViewController.m
//  Objective-C1
//
//  Created by He on 2018/3/15.
//  Copyright © 2018年 He. All rights reserved.
//

#import "NewViewController.h"
#import "SQLViewController.h"
@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton* BUTTON = [UIButton buttonWithType:UIButtonTypeCustom];
    BUTTON.frame = CGRectMake(100, 100, 100, 50);
    BUTTON.backgroundColor = [UIColor redColor];
    [BUTTON setTitle:@"操作数据库" forState:UIControlStateNormal];
    [BUTTON addTarget:self action:@selector(gotoSQL) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BUTTON];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate sendInfo:@"代理"];
    self.newBlock(@"block");
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)gotoSQL {
    SQLViewController* vc = [[SQLViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
