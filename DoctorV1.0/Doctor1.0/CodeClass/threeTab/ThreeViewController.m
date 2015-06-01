//
//  ThreeViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/25.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "ThreeViewController.h"
#import "MBProgressHUD+DDF.h"
@interface ThreeViewController ()<UIWebViewDelegate>
@property (nonatomic, strong)UIWebView *webView;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"专属医院";

    NSString *str = @"http://api.mingyihz.com/hospital/?agent=app&header=0&footer=0";
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height )];
    self.webView.backgroundColor = [UIColor whiteColor];
    self.webView.delegate = self;
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    [MBProgressHUD showMessage:@"加载中" toView: self.view];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
