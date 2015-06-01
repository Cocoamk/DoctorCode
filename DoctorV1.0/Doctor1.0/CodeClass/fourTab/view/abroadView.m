//
//  abroadView.m
//  Doctor1.0
//
//  Created by mk on 15/5/29.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "abroadView.h"

@implementation abroadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.webView = [[UIWebView alloc]initWithFrame:frame];
        NSURL *url = [NSURL URLWithString:[self.webUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        self.webView.backgroundColor = [UIColor clearColor];
        self.webView.delegate = self;
        NSURLRequest *request =[NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        [self addSubview:self.webView];
        
    }

    return self;

}
@end
