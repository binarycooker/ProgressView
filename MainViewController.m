//
//  MainViewController.m
//  ProgressView
//
//  Created by Ansel on 12-10-28.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [self setTitle:@"ProgressView"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    [self.progress setUserInteractionEnabled:YES];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Mail" style:UIBarButtonItemStyleBordered target:self action:@selector(Action:)]];
    [self.progress setUserInteractionEnabled:YES];
    [self.progress setBackgroundColor:[UIColor grayColor]];
    [self.progress setTrackTintColor:[UIColor grayColor]];
    [self.progress setProgress:0.0f];
    self.progress.progressTintColor = [UIColor redColor];
    self.progress.progressImage = [UIImage imageNamed:@"progressBackground.png"];
    //block 代码示例
    void (^printBlock)(NSString *x);
    printBlock = ^(NSString* str)
    {
        NSLog(@"print:%@", str);
    };
    printBlock(@"hello world!");
    
    //Thread
//    [NSThread detachNewThreadSelector:@selector(ThreadOne) toTarget:self withObject:nil ];
//    [NSThread detachNewThreadSelector:@selector(ThreadTwo) toTarget:self withObject:nil ];
    
    //NotificationgCenter
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Action:) name:@"Center" object:nil];
    // Do any additional setup after loading the view from its nib.
}
-(void)Action:(id)sender
{
    EmailViewController *email = [[EmailViewController alloc]init];
    [self.navigationController pushViewController:email animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ThreadOne{
    while (YES) {
        NSLog(@"I am Here~");
        sleep(1);
        if(self.progress.progress == 1.0f)
        {
            self.progress.progress = 0.0f;
        }
        else
        {
            //[[NSNotificationCenter defaultCenter] postNotificationName:@"Center" object:self];
            self.progress.progress +=0.01f;
        }
    }
}
-(void)ThreadTwo{
    NSLog(@"I am Two");
}
- (IBAction)doSomething:(id)sender {
    NSLog(@"doSomething");
    [self.progress setProgress:0.7];
}
@end
