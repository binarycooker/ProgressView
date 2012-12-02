//
//  EmailViewController.h
//  ProgressView
//
//  Created by Ansel on 12-10-29.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import "SqliteViewController.h"
@interface EmailViewController : UIViewController<MFMailComposeViewControllerDelegate,SKPSMTPMessageDelegate>
@property (retain, nonatomic) IBOutlet UIButton *messageUI;
- (IBAction)MESSAGEUISend:(id)sender;

- (IBAction)SMTPSend:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *SMTPAccept;
- (IBAction)SMTPAccept:(id)sender;
@end