//
//  abroadView.h
//  Doctor1.0
//
//  Created by mk on 15/5/29.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface abroadView : UIView<UIWebViewDelegate>
-(instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, strong)NSString *webUrl;
@end
