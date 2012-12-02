//
//  EmailViewController.m
//  ProgressView
//
//  Created by Ansel on 12-10-29.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController
@synthesize messageUI;
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
    self.title = @"Email";
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"Ansel" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDragInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Mail" style:UIBarButtonItemStyleBordered target:self action:@selector(Action:)]];
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    // Do any additional setup after loading the view from its nib.
}
- (void)Action:(id)sender{
    SqliteViewController *sqlite = [[SqliteViewController alloc]init];
    [self.navigationController pushViewController:sqlite animated:YES];
    [sqlite release];
}
- (void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mailComposeController: (MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)MESSAGEUISend:(id)sender {
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"My Subject"];
    [controller setMessageBody:@"Hello there." isHTML:NO];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)SMTPSend:(id)sender {
    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
    testMsg.fromEmail = @"anselobjective@gmail.com";
    testMsg.toEmail =@"zfkjay@sohu.com";
    testMsg.relayHost = @"smtp.gmail.com";
    testMsg.requiresAuth = YES;
    testMsg.login = @"anselobjective@gmail.com";
    testMsg.pass = @"zhaofakai";
    testMsg.subject = [NSString stringWithCString:"You Know" encoding:NSUTF8StringEncoding];
    testMsg.bccEmail = @"517433742@qq.com";
    testMsg.wantsSecure = YES; // smtp.gmail.com doesn't work without TLS!
    testMsg.delegate = self;
    
    NSDictionary *plainPart = [NSDictionary
                               dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                               [NSString stringWithCString:"I will Use SMTP Protocol Send Email,I's So Cool." encoding:NSUTF8StringEncoding],
                               kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    
//    NSString *vcfPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"vcf"];
//    NSData *vcfData = [NSData dataWithContentsOfFile:vcfPath];
//    
//    NSDictionary *vcfPart = [NSDictionary dictionaryWithObjectsAndKeys: @"text/directory;\r\n\tx-unix-mode=0644;\r\n\tname=\"test.vcf\"",kSKPSMTPPartContentTypeKey,
//                             @"attachment;\r\n\tfilename=\"test.vcf\"",kSKPSMTPPartContentDispositionKey,
//                             [vcfData encodeBase64ForData],kSKPSMTPPartMessageKey,@"base64",kSKPSMTPPartContentTransferEncodingKey,nil];
    testMsg.parts = [NSArray arrayWithObjects:plainPart,nil];
    [testMsg send];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}
-(void)messageSent:(SKPSMTPMessage *)message{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Send Email is Success" delegate:nil cancelButtonTitle:@"OK,Thinks" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
-(void)messageFailed:(SKPSMTPMessage *)message
               error:(NSError *)error{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:[NSString stringWithFormat:@"Send Email is Failed: %@",error] delegate:nil cancelButtonTitle:@"OK,I am Bad" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    [[UIApplication sharedApplication ] setNetworkActivityIndicatorVisible:NO];
}

- (void)dealloc {
    [_SMTPAccept release];
    [super dealloc];
}
- (IBAction)SMTPAccept:(id)sender {
//    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
}
@end
