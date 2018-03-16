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
@property (nonatomic,copy) NSMutableString* str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.str = [NSMutableString stringWithFormat:@"A"];
    //*****************通知中心
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(act1:) name:@"通知" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(act2:) name:@"通知" object:@"1"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(act3:) name:@"通知" object:@"2"];//无法收到通知
    [[NSNotificationCenter defaultCenter] addObserverForName:@"通知" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"在block里处理通知 object:%@,dic:%@",note.object,note.userInfo);
    }];
    //******************kvo
    //注册,指定被观察者的属性
    [self addObserver:self forKeyPath:@"str" options:NSKeyValueObservingOptionNew context:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//实现kvo回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"new:%@",[change valueForKey:NSKeyValueChangeNewKey]);
}
- (void)act1:(NSNotification*)notification {
    NSError* parseError = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:notification.userInfo options:NSJSONWritingPrettyPrinted error:&parseError];
    NSLog(@"act1: object:%@,dic:%@",notification.object,[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
}
- (void)act2:(NSNotification*)notification {
    NSError* parseError = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:notification.userInfo options:NSJSONWritingPrettyPrinted error:&parseError];
    NSLog(@"act1: object:%@,dic:%@",notification.object,[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    
}
- (void)act3:(NSNotification*)notification {
    NSError* parseError = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:notification.userInfo options:NSJSONWritingPrettyPrinted error:&parseError];
    NSLog(@"act1: object:%@,dic:%@",notification.object,[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NewViewController* vc = [[NewViewController alloc]init];
    vc.delegate = self;
    vc.newBlock = ^(NSString* info) {
        NSLog(@"我得到了后个页面传递的信息:%@",info);
    };
    self.str = [NSMutableString stringWithFormat:@"B"];
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
