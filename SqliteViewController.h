//
//  SqliteViewController.h
//  ProgressView
//
//  Created by Ansel on 12-11-4.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface SqliteViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *id;
@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *pwd;
- (IBAction)show:(id)sender;

@end
