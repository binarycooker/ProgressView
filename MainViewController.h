//
//  MainViewController.h
//  ProgressView
//
//  Created by Ansel on 12-10-28.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmailViewController.h"
@interface MainViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIProgressView *progress;
- (IBAction)doSomething:(id)sender;
@end
