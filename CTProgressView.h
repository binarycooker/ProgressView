//
//  CTProgressView.h
//  ProgressView
//
//  Created by Ansel on 12-10-28.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTProgressView : UIProgressView{
    UIColor *tintColor;
}
-(void)setTintColor:(UIColor *)color;

@end
