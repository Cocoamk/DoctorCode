//
//  MainViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/25.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "MainViewController.h"
#import "ClassicViewController.h"
#import "UIImageView+WebCache.h"
#import "UIColor+AddColor.h"
#import "ClassicCollectionViewCell.h"
#import "MBProgressHUD+DDF.h"
#import "NetHandler.h"
#import "Faculty.h"
@interface MainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)UIImageView *lianxiImageView;
@property (nonatomic, strong)UIImageView *topImageView;
@property (nonatomic, strong)UIImageView *footImageView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *FlowLayout;
@property (nonatomic, strong)NSMutableArray *imagebackgroundColorArray;
@property (nonatomic, strong)NSMutableArray *facultyArray;


@end

@implementation MainViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
    [self handData];
}
- (void)handData
{
    
    [self.topImageView sd_setImageWithURL:@"http://mingyihz.oss-cn-hangzhou.aliyuncs.com/static/hb_hospital.jpg" ];
    [self.footImageView sd_setImageWithURL:@"http://m.mingyihz.com/themes/m1/images/hb_overseas.jpg"];
    [self.lianxiImageView sd_setImageWithURL:@"http://mingyihz.oss-cn-hangzhou.aliyuncs.com/static/app-home_header.png" ];
    self.imagebackgroundColorArray = [NSMutableArray array];
    UIColor *color1 = [UIColor image1Color];
    UIColor *color2 = [UIColor image2Color];
    UIColor *color3 = [UIColor image3Color];
    UIColor *color4 = [UIColor image4Color];
    UIColor *color5 = [UIColor image5Color];
    UIColor *color6 = [UIColor image6Color];
    self.imagebackgroundColorArray = [NSMutableArray arrayWithObjects:color1,color2,color3,color4,color5,color6, nil];
    [MBProgressHUD showMessage:@"加载中" toView: self.view];
    
    NSString *str = API;
    [NetHandler getDataWithURL:str completion:^(NSData *data) {
        
        NSMutableArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.facultyArray = [NSMutableArray array];
        for (NSMutableDictionary *dic  in arr) {
            Faculty *faculty = [[Faculty alloc]initWithDictionary:dic];
            [self.facultyArray addObject:faculty];
        //    NSLog(@"%@",faculty.name);
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        [self.collectionView reloadData];
        
    }];
}
- (void)createView
{
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    self.lianxiImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, width, 30)];
    self.lianxiImageView.backgroundColor = [UIColor themeGreenColor];
    [self.view addSubview:self.lianxiImageView];
    self.topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, width, height / 3)];
    // self.topImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.topImageView];
    
    self.FlowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.FlowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.FlowLayout.itemSize = CGSizeMake( width / 3 - 10, height / 6 - 10  );
    self.FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.FlowLayout.minimumInteritemSpacing = 0;
    self.FlowLayout.minimumLineSpacing = 10;
    
    self.collectionView =[[UICollectionView alloc]initWithFrame :CGRectMake(0, height / 3 , width, height / 2.5) collectionViewLayout:self.FlowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[ClassicCollectionViewCell class] forCellWithReuseIdentifier:@"classic"];
    
    self.footImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, height / 3 + height / 2.5 - 25, width, height / 5 + 20)];
    // self.footImageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.footImageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ClassicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"classic" forIndexPath:indexPath];
    cell.faculty = [self.facultyArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [self.imagebackgroundColorArray objectAtIndex:indexPath.row];
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Faculty *facy = _facultyArray[indexPath.row];
    ClassicViewController *view = [[ClassicViewController alloc]init];
    [view setUrl:facy.url];
    [view setIconImage:facy.urlIcon];
    [view setIconColor:[self.imagebackgroundColorArray objectAtIndex:indexPath.row ]];
    
    [self.navigationController pushViewController:view animated:NO];
    
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
