//
//  doctorViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "doctorViewController.h"
#import "UIColor+AddColor.h"
#import "apptViewController.h"
#import "Doctor.h"
#import "UIImageView+WebCache.h"
@interface doctorViewController ()
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *avatarImageView;
@property (nonatomic, strong)UILabel *docName;
@property (nonatomic, strong)UILabel *hosName;
//科室
@property (nonatomic, strong)UILabel *facultyLabel;
@property (nonatomic, strong)UILabel *mTitleLabel;
@property (nonatomic, strong)UILabel *aTitleLabel;
@property (nonatomic, strong)UITextView *docDesLabel;
@property (nonatomic, strong)UIButton *apptButton;

@end

@implementation doctorViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self.aTitleLabel.text length] == 0) {
        self.aTitleLabel.hidden = YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
    [self handleData];
    
}
- (void)createView
{
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    self.avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 88, width / 3, width / 3)];
    self.avatarImageView.layer.cornerRadius = width / 6;
   // self.avatarImageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.avatarImageView];
    
    self.docName = [[UILabel alloc]initWithFrame:CGRectMake(2 * width / 5 , 2 * height / 15, width / 2, 30)];
    self.docName.font = [UIFont systemFontOfSize:19];
  //  self.docName.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.docName];
    
    self.hosName = [[UILabel alloc]initWithFrame:CGRectMake(2 * width / 5, 3 * height / 16, width / 2, 30)];
  //  self.hosName.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.hosName];
    
    
    self.facultyLabel = [[UILabel alloc]initWithFrame:CGRectMake(2 * width / 5, 4 * height / 16, width / 3, 30)];
  //  self.facultyLabel.font = [UIFont systemFontOfSize:14];
   // self.facultyLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.facultyLabel];
    
    self.mTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(2 * width / 5, 5 * height / 16, width / 4, 30)];
    self.mTitleLabel.backgroundColor = [UIColor backBlueColor];
    self.mTitleLabel.font = [UIFont systemFontOfSize:14];
    self.mTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.mTitleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.mTitleLabel];
    
    self.aTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(3 * width / 5 + 20, 5 * height / 16, width / 5, 30)];
    self.aTitleLabel.backgroundColor = [UIColor backBlueColor];
    self.aTitleLabel.font = [UIFont systemFontOfSize:14];
    self.aTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.aTitleLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.aTitleLabel];

    
    self.docDesLabel = [[UITextView alloc]initWithFrame:CGRectMake(width / 10,  6 * height / 15 , 4 * width / 5, height / 3)];
    self.docDesLabel.editable = NO;
  //  self.docDesLabel.backgroundColor = [UIColor grayColor];
    self.docDesLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:self.docDesLabel];
    
    self.apptButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.apptButton.frame = CGRectMake(width / 10, 5 * height / 6 - 20 , 4 * width / 5, 50);
    self.apptButton.backgroundColor = [UIColor themeGreenColor];
    [self.apptButton setTitle:@" 立即预约  " forState:UIControlStateNormal];
    [self.apptButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.apptButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.apptButton];
    
}
- (void)handleData
{
    [self.avatarImageView sd_setImageWithURL:self.doctor.urlImage];
    self.docName.text = self.doctor.name;
    self.hosName.text = self.doctor.hospital;
    self.facultyLabel.text = self.doctor.hFaculty;
    self.mTitleLabel.text = self.doctor.mTitle;
    self.aTitleLabel.text = self.doctor.aTitle;
    self.docDesLabel.text = self.doctor.desc;

    

}
- (void)buttonClick
{
    apptViewController *view = [[apptViewController alloc]init];
    [self.navigationController pushViewController:view animated:NO];
    
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
