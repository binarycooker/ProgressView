//
//  CTProgressView.m
//  ProgressView
//
//  Created by Ansel on 12-10-28.
//  Copyright (c) 2012年 Ansel. All rights reserved.
//

#import "CTProgressView.h"

@implementation CTProgressView
- (id)init
{
    self = [super init];
    if(self)
    {
        self.progress = 0.5f;
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        self.progress = 0.5f;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setTintColor:[UIColor redColor]];
        self.progress = 0.5f;
        
    }
    return self;
}
- (id)initWithProgressViewStyle:(UIProgressViewStyle)style
{
    self = [super initWithProgressViewStyle:style];
    if(self){
        [self setTintColor:[UIColor redColor]];
        self.progress = 0.5f;
    }
    return self;
}
-(void)setTintColor:(UIColor *)color{
    tintColor = color;
}
-(void)drawRect:(CGRect)rect
{
    //self.backgroundColor = [UIColor redColor];
    [super drawRect:rect];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
