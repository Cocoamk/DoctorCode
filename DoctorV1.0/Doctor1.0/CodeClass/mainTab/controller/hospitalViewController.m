//
//  hospitalViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "hospitalViewController.h"
#import "UIColor+AddColor.h"
#import "apptViewController.h"
#import "UIImageView+WebCache.h"
@interface hospitalViewController ()
//@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *avatarImageView;
@property (nonatomic, strong)UILabel *hosName;
@property (nonatomic, strong)UILabel *hosClassLabel;
@property (nonatomic, strong)UILabel *hosTypeLabel;
@property (nonatomic, strong)UITextView *hosDesLabel;
@property (nonatomic, strong)UIButton *apptButton;
@end

@implementation hospitalViewController

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

    self.avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width / 4,88, width / 2, height / 4)];
  //  self.avatarImageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.avatarImageView];

    self.hosName = [[UILabel alloc]initWithFrame:CGRectMake(width / 10, height / 2.5, 4 * width /5, 30)];
 //   self.hosName.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.hosName];
    
    self.hosClassLabel = [[UILabel alloc]initWithFrame:CGRectMake(width / 10, height / 2.2, width / 5, 30)];
    self.hosClassLabel.font = [UIFont systemFontOfSize:15];
    self.hosClassLabel.textColor = [UIColor blueColor];
  //  self.hosClassLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.hosClassLabel];
    
    self.hosTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(width / 3,  height / 2.2, width / 5, 30)];
    self.hosTypeLabel.font = [UIFont systemFontOfSize:15];
    self.hosTypeLabel.textColor = [UIColor blueColor];
  //  self.hosTypeLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.hosTypeLabel];
    
    self.hosDesLabel = [[UITextView alloc]initWithFrame:CGRectMake(width / 10,  height / 2 , 4 * width / 5, height / 4)];
    self.hosDesLabel.editable = NO;
    self.hosDesLabel.font = [UIFont systemFontOfSize:17];
  //  self.hosDesLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.hosDesLabel];
   
    self.apptButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.apptButton.frame = CGRectMake(width / 10, 3 * height / 4 + 20 , 4 * width / 5, 50);
    self.apptButton.backgroundColor = [UIColor themeGreenColor];
    [self.apptButton setTitle:@"立即预约" forState:UIControlStateNormal];
    [self.apptButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.apptButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.apptButton];
    
}



- (void)handleData
{
    self.hosName.text = self.hospital.name;
    self.hosClassLabel.text = self.hospital.kclass;
    self.hosTypeLabel.text = self.hospital.type;
    self.hosDesLabel.text = self.hospital.desc;
    [self.avatarImageView sd_setImageWithURL:self.hospital.urlImage placeholderImage:[UIImage imageNamed:@"hoszhanwei"]];
    
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
