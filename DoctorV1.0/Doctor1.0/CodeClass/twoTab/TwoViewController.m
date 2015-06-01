//
//  TwoViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/25.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "TwoViewController.h"
#import "ClassicCollectionViewCell.h"
#import "ClassicViewController.h"
#import "UIColor+AddColor.h"
#import "NetHandler.h"
#import "Faculty.h"
#import "MBProgressHUD+DDF.h"

@interface TwoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *FlowLayout;
@property (nonatomic, strong)NSMutableArray *array;
@property (nonatomic, strong)NSMutableArray *imagebackgroundColorArray;
@property (nonatomic, strong)UIImageView *topImageView;
@property (nonatomic, strong)UIImageView *footImageView;
@property (nonatomic, strong)NSMutableArray *imageArray;
@property (nonatomic, strong)NSMutableArray *facultyArray;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"约名医";
    // Do any additional setup after loading the view.
    self.imagebackgroundColorArray = [NSMutableArray array];
    self.array = [NSMutableArray array];
    UIColor *color1 = [UIColor image1Color];
    UIColor *color2 = [UIColor image2Color];
    UIColor *color3 = [UIColor image3Color];
    UIColor *color4 = [UIColor image4Color];
    UIColor *color5 = [UIColor image5Color];
    UIColor *color6 = [UIColor image6Color];
    
    self.imagebackgroundColorArray = [NSMutableArray arrayWithObjects:color1,color2,color3,color4,color5,color6, nil];

    [self createView];
   
    [self handleData];

}
- (void)handleData
{
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
//    
//    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
//    
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
//    [self.view addSubview:self.scrollView];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    self.topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, width, height / 3)];
     [self.topImageView setImage:[UIImage imageNamed:@"girl"]];

    [self.view addSubview:self.topImageView];
    
    self.FlowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.FlowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.FlowLayout.itemSize = CGSizeMake( width / 2- 20, height / 6 - 10  );
    
    self.FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.FlowLayout.minimumInteritemSpacing = 10;
    self.FlowLayout.minimumLineSpacing = 10;
    
    self.collectionView =[[UICollectionView alloc]initWithFrame :CGRectMake(0, height / 3 , width, height ) collectionViewLayout:self.FlowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[ClassicCollectionViewCell class] forCellWithReuseIdentifier:@"classic"];
    

    
    
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
