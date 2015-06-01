//
//  FourViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/25.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "FourViewController.h"
#import "abroadTableViewCell.h"
#import "abroad_Detal_ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIColor+AddColor.h"
#import "abroadView.h"
#import "MBProgressHUD+DDF.h"
#import "MBProgressHUD.h"
@interface FourViewController ()<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *ImageArray;
@property (nonatomic, strong)NSMutableArray *titleArray;
@property (nonatomic, strong)UIImageView *headerView;
@property (nonatomic, strong)NSMutableArray *array;
@property (nonatomic, strong)UIWebView *webView;


@end

@implementation FourViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  //  self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"海外医疗";
    self.ImageArray = [NSMutableArray array];
    self.titleArray = [NSMutableArray array];
    self.array = [NSMutableArray array];
    NSString *str1 = @"banner_elizabeth.jpg";
    NSString *str2 = @"banner_ktph.jpg";
    NSString *str3 = @"banner_sgh.jpg";
    NSString *str4 = @"banner_nuh.jpg";
    self.array = [NSMutableArray arrayWithObjects:str1,str2,str3,str4, nil];
    
    NSString *title1 = @"新加坡伊丽莎白医院";
    NSString *title2 = @"新加坡坵德拔医院";
    NSString *title3 = @"新加坡中央医院";
    NSString *title4 = @"新加坡国立大学医院";
    self.ImageArray = [NSMutableArray arrayWithObjects:ELIZABTHIMAGE,KTPHIMAGE,SGHIMAGE,NUHIMAGE, nil];
    self.titleArray = [NSMutableArray arrayWithObjects:title1,title2,title3,title4, nil];
    [self createView];

    [MBProgressHUD showMessage:@"加载中" toView: self.view];
    
}

- (void)createView
{
    
    
    NSString *webUrl = @"http://api.mingyihz.com/overseas/?agent=app&header=1&footer=0";
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width ,self.view.frame.size.height)];
    NSURL *url = [NSURL URLWithString:[webUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.delegate = self;
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.view addSubview:self.webView];

    
//    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    self.tableView.rowHeight = 150;
//    [self.view addSubview:self.tableView];
//    [_tableView registerClass:[abroadTableViewCell class] forCellReuseIdentifier:@"abroad"];
//    
//    self.headerView = [[UIImageView alloc]init];
//    [self.headerView sd_setImageWithURL:COVERIMAGE];
    

}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ImageArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    abroadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abroad"];
    [cell.image sd_setImageWithURL:[self.ImageArray objectAtIndex:indexPath.row]];
   // cell.image.image = [UIImage imageNamed:[self.array objectAtIndex:indexPath.row]];
    cell.titleLabel.text = [self.titleArray objectAtIndex:indexPath.row];

    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  self.view.frame.size.height / 8;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    abroad_Detal_ViewController *view = [[abroad_Detal_ViewController alloc]init];
    view.title = [self.titleArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:view animated:NO];

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
