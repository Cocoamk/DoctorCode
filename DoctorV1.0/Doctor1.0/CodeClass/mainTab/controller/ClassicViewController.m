//
//  ClassicViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/25.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "ClassicViewController.h"
#import "HospitalTableViewCell.h"
#import "DoctorTableViewCell.h"
#import "diseaseCollectionViewCell.h"
#import "doctorViewController.h"
#import "hospitalViewController.h"
#import "MKFormatModel.h"
#import "RequestManager.h"
#import "Hospital.h"
#import "Doctor.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD+DDF.h"
//#import "LOFormatModel.h"
@interface ClassicViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *hospitalArray;
@property (nonatomic, strong)NSMutableArray *doctorArray;
@property (nonatomic, strong)NSMutableArray *disaseArray;
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *diseaseArray;
@property (nonatomic, strong)UIImageView *classicImage;
@property (nonatomic, strong)UICollectionViewFlowLayout *FlowLayout;
@property (nonatomic, strong)UILabel *disTitleLabel;

@end

@implementation ClassicViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super  viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hospitalArray = [NSMutableArray array];
    self.doctorArray = [NSMutableArray array];
    self.disaseArray = [NSMutableArray array];
    [self handleData];
    [self createView];
     [MBProgressHUD showMessage:@"加载中" toView: self.view];
}
- (void)handleData
{
 
    [RequestManager GET:_url success:^(id response) {
        NSDictionary *dic = (NSDictionary *)response;
        NSArray *hospitalArray = dic[@"hospitals"];
        NSArray *doctorArray = dic[@"doctors"];
        NSArray *diseArray = dic[@"diseases"];
        
        for (NSString *str in diseArray) {
            [self.disaseArray addObject:str];
        }
        for (NSDictionary *HosDict in hospitalArray) {
            Hospital *hal= [[Hospital alloc]init];;
            hal.mapDictionary = @{@"id":@"ID",@"class":@"kclass"};
            hal.dataDictionary = HosDict;
            [_hospitalArray addObject:hal];
        }
        for (NSDictionary *DocDict in doctorArray) {
            Doctor *model = [[Doctor alloc]init];
            model.dataDictionary = DocDict;
            [_doctorArray addObject:model];
            
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        [self.tableView reloadData];
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

- (void)createView
{
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height / 4)];
    // self.headerView.backgroundColor = [UIColor redColor];
    CGFloat width = self.view.frame.size.width ;
    CGFloat height = self.view.frame.size.height / 6;
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(width / 25 , height / 5, width /4, height)];
    backImage.backgroundColor = self.iconColor;
    [self.headerView addSubview:backImage];
    
    self.classicImage = [[UIImageView alloc]initWithFrame:CGRectMake(backImage.frame.size.width / 4 , backImage.frame.size.height / 4, backImage.frame.size.width / 2, backImage.frame.size.width / 2)];
    self.classicImage.backgroundColor = self.iconColor;
    [self.classicImage sd_setImageWithURL:self.iconImage];
    [backImage addSubview:self.classicImage];
    
    self.disTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(width / 3 , height / 4 , 2 * width / 3  , height /6)];
    self.disTitleLabel.text = @"疾病分类 : ";
    self.disTitleLabel.font = [UIFont systemFontOfSize:19];
    [self.headerView addSubview:self.disTitleLabel];
    
    self.FlowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.FlowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.FlowLayout.itemSize = CGSizeMake( width / 5, height / 4);
    self.FlowLayout.minimumInteritemSpacing = 0;
    self.FlowLayout.minimumLineSpacing = 10;
    
    self.collectionView =[[UICollectionView alloc]initWithFrame :CGRectMake(width / 3 , height / 2 , 2 * width / 3 - 10 , height - 10  ) collectionViewLayout:self.FlowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.headerView addSubview:self.collectionView];
    [self.collectionView registerClass:[diseaseCollectionViewCell class] forCellWithReuseIdentifier:@"disease"];
    
    self.tableView = [[UITableView alloc]initWithFrame: self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 120;
    self.tableView.tableHeaderView = self.headerView;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[HospitalTableViewCell class] forCellReuseIdentifier:@"hospital"];
    [self.tableView registerClass:[DoctorTableViewCell class] forCellReuseIdentifier:@"doctor"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.disaseArray.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    diseaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"disease" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    cell.label.text = [self.disaseArray objectAtIndex:indexPath.row];
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.hospitalArray.count;
    }

    return self.doctorArray.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HospitalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hospital" forIndexPath:indexPath];
        cell.hospital = [self.hospitalArray objectAtIndex:indexPath.row];
        return cell;
    }
       DoctorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"doctor" forIndexPath:indexPath];
    cell.doctor = [self.doctorArray objectAtIndex:indexPath.row];
    return cell;

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"合作名医来自以下医院";
    }
    else return @"精选名医";
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        hospitalViewController *hosView = [[hospitalViewController alloc]init];
        [hosView setHospital:[self.hospitalArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:hosView animated:NO];
        
    }else {
        doctorViewController *docView = [[doctorViewController alloc]init];
        [docView setDoctor:[self.doctorArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:docView animated:NO];
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
