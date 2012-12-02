//
//  SqliteViewController.m
//  ProgressView
//
//  Created by Ansel on 12-11-4.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import "SqliteViewController.h"

@interface SqliteViewController ()

@end

@implementation SqliteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Sqlite";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_id release];
    [_name release];
    [_pwd release];
    [super dealloc];
}
- (IBAction)show:(id)sender {
    // 首先获取iPhone上Sqlite3的数据库文件的地址
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"test.db"];
    // 打开Sqlite3的数据库文件
    sqlite3 *database;
    if (sqlite3_open([path UTF8String], &database)==SQLITE_OK) {
        NSLog(@"open sqlite db ok.");
    }

    char *errorMsg;
    const char *createSql="create table if not exists persons (id integer primary key autoincrement,name text,password text)";
    
    if (sqlite3_exec(database, createSql, NULL, NULL, &errorMsg)==SQLITE_OK) {
        NSLog(@"create ok.");
    }
//    const char *insertSql ="insert into persons (name,password) values ('赵发凯','zhaofakai')";
//    if (sqlite3_exec(database, insertSql, NULL, NULL, &errorMsg)==SQLITE_OK) {
//        NSLog(@"insert ok.");
//    }
    // 定义SQL文
    sqlite3_stmt *stmt;
    const char *sql = "select * from persons";
    if (sqlite3_prepare_v2(database, sql, -1, &stmt, nil)==SQLITE_OK) {
        NSLog(@"select ok.");
    }
    
    // 邦定第一个int参数
//    sqlite3_bind_int(stmt, 1, 1);
//    // 邦定第二个字符串参数
//    sqlite3_bind_text(stmt, 2, [_title UTF8String], -1, SQLITE_TRANSIENT);
    // 执行SQL文，并获取结果
//    sqlite3_step(stmt);
    while (sqlite3_step(stmt)==SQLITE_ROW) {
        int _id=sqlite3_column_int(stmt, 0);
        NSString *name= [[NSString alloc] initWithCString:(char *)sqlite3_column_text(stmt, 1) encoding:NSUTF8StringEncoding];
        NSString *pwd = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(stmt, 2) encoding:NSUTF8StringEncoding];
        self.id.text = [NSString stringWithFormat:@"%d",_id];
        self.name.text = name;
        self.pwd.text = pwd;
    } 

    // 释放资源
    sqlite3_finalize(stmt);
    // 关闭Sqlite3数据库  
    sqlite3_close(database);  }
@end
