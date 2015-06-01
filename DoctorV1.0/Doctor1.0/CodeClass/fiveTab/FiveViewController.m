//
//  FiveViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/25.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "FiveViewController.h"
#import "UIColor+AddColor.h"
@interface FiveViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *erjiImageView;
@property (nonatomic, strong)UIButton *phoneButton;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *mailLabel;
@property (nonatomic, strong)UIImageView *erweiImageView;
@property (nonatomic, strong)UILabel *weixinLabel;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *weixinIdLabel;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系我们";
    // Do any additional setup after loading the view.
    [self createView];
    
}
- (void)createView
{
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
  // title
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, width, height / 10)];
    self.titleLabel.text = @"名医会诊客服 竭诚为您服务";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
 //耳机图片
    self.erjiImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width / 4, height / 4, width / 2 , height / 5)];
    self.erjiImageView.backgroundColor = [UIColor whiteColor];
    self.erjiImageView.image = [UIImage imageNamed:@""];
    [self.view addSubview:self.erjiImageView];
    
    
//拨打button
    self.phoneButton =[UIButton buttonWithType:UIButtonTypeSystem];
  //  self.phoneButton.backgroundColor =[UIColor yellowColor];
    self.phoneButton.frame =CGRectMake(  width / 3, height / 4 + 20, width / 3 , width / 3);
    UIImage *loginImg = [UIImage imageNamed:@"phone"];
    loginImg = [loginImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.phoneButton setImage:loginImg forState:UIControlStateNormal];
    [self.phoneButton addTarget:self action:@selector(phoneButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.phoneButton];
//拨打label
    self.phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,  height / 2 - 30,width, height / 10)];
    self.phoneLabel.text = @"拨打名医热线";
    self.phoneLabel.textAlignment = NSTextAlignmentCenter;
    self.phoneLabel.textColor = [UIColor themeGreenColor];
    [self.view addSubview:self.phoneLabel];
//mail
    
    self.mailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5 * height / 9,width, height / 10)];
    self.mailLabel.text = MAILID;
    self.mailLabel.textAlignment = NSTextAlignmentCenter;
    self.mailLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.mailLabel];
//erweima
    self.erweiImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width / 6 ,2 * height / 3, 100 , 100)];
    // self.erweiImageView.backgroundColor = [UIColor redColor];
    self.erweiImageView.image = [UIImage imageNamed:@"erweima.jpg"];
    [self.view addSubview:self.erweiImageView];

    self.weixinLabel = [[UILabel alloc]initWithFrame:CGRectMake( width / 6 + 100 , 2 * height / 3, width / 2 , height / 20)];
    self.weixinLabel.text = @"请关注我们的微信公众号";
     self.weixinLabel.font = [UIFont systemFontOfSize:14];
    self.weixinLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.weixinLabel];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake( 2 * width / 5 + 10 , 2 * height / 3 + 30, width / 2 , height / 20)];
    self.nameLabel.text = WEIXINANME;
    self.nameLabel.textColor = [UIColor themeGreenColor];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.nameLabel];


    self.weixinIdLabel = [[UILabel alloc]initWithFrame:CGRectMake( 2 * width / 5 + 10 , 2 * height / 3 + 60, width / 2 , height / 20)];
    self.weixinIdLabel.font = [UIFont systemFontOfSize:14];
    self.weixinIdLabel.text = WEIXINID;
    self.weixinIdLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.weixinIdLabel];

}



- (void)phoneButtonAction
{


    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:nil message:@"400-119-7900" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"呼叫", nil];
    [alerView show];
   //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://156-4085-3017"]];
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 1) {
        NSString *str = [@"tel://" stringByAppendingString:PHONENUMBER];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        NSLog(@"~~~~~~~~~~~~~~~~坏老板");
    }

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
