//
//  SQLViewController.m
//  Objective-C1
//
//  Created by He on 2018/3/15.
//  Copyright © 2018年 He. All rights reserved.
//

#import "SQLViewController.h"
#import "FMDatabase.h"
@interface SQLViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UILabel *show;
@property (nonatomic,strong)FMDatabase* db;
@end

@implementation SQLViewController
- (IBAction)add:(id)sender {
    //插入
   BOOL result = [self.db executeUpdate:@"INSERT INTO student (name,age) VALUES(?,?)",self.name.text,@([self.age.text integerValue])];
    if (result) {
        UIAlertController* alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"插入数据成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alter addAction:ac];
        [self presentViewController:alter animated:YES completion:nil];
    }
    self.name.text = @"";
    self.age.text = @"";
}
- (IBAction)find:(id)sender {
    //查询
    FMResultSet* set = [self.db executeQuery:@"SELECT * FROM student"];
    NSMutableString* mustr = [NSMutableString string];
    while ([set next]) {
        [mustr appendString:[NSString stringWithFormat:@"%d,%@,%d\n",[set intForColumn:@"id"],[set stringForColumn:@"name"],[set intForColumn:@"age"]]];
    }
    self.show.text = mustr;
}
- (IBAction)delete:(id)sender {
    //删除
    BOOL result = [self.db executeUpdate:@"DELETE FROM student WHERE name=?",self.name.text];
    if (result) {
        UIAlertController* alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"数据删除成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alter addAction:ac];
        [self presentViewController:alter animated:YES completion:nil];
    }
    self.name.text = @"";
}
- (IBAction)deleteAll:(id)sender {
    //删表
   BOOL result = [self.db executeUpdate:@"DROP TABLE student"];
    if (result) {
        UIAlertController* alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"删表成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alter addAction:ac];
        [self presentViewController:alter animated:YES completion:nil];
    }
}
- (IBAction)change:(id)sender {
    //修改
    BOOL result = [self.db executeUpdate:@"UPDATE student SET age=? WHERE name=?",@([self.age.text integerValue]),self.name.text];
    if (result) {
        UIAlertController* alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alter addAction:ac];
        [self presentViewController:alter animated:YES completion:nil];
    }
    self.name.text = @"";
    self.age.text = @"";
}
- (IBAction)create:(id)sender {
    //建表
   BOOL result = [self.db executeUpdate:@"CREATE TABLE student (id integer NOT NULL PRIMARY KEY,name text NOT NULL,age integer NOT NULL)"];
    if (result) {
        UIAlertController* alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"创建表成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alter addAction:ac];
        [self presentViewController:alter animated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* path = [doc stringByAppendingPathComponent:@"student.sqlite"];
    

    self.db = [FMDatabase databaseWithPath:path];
    [self.db open];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
