//
//  apptViewController.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "apptViewController.h"
#import "UIColor+AddColor.h"
#import "NetHandler.h"
#import "MBProgressHUD+DDF.h"
@interface apptViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UIWebViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *topImage;
@property (nonatomic, strong)UITextField *name;
@property (nonatomic, strong)UITextField *phoneNumber;
@property (nonatomic, strong)UITextView *describe;
@property (nonatomic, strong)UIButton *facultyButton;
@property (nonatomic, strong)UIButton *agePickButton;
@property (nonatomic, strong)UIPickerView *agePick;
@property (nonatomic, strong)NSMutableArray *ageArray;
@property (nonatomic, strong)UIPickerView *agePickerView;
@property (nonatomic, strong)UIPickerView *facultyPikerView;
@property (nonatomic, strong)NSMutableArray *facultyArray;
@property (nonatomic, strong)NSPredicate *testPre;
@property (nonatomic, strong)NSString *age;
@property (nonatomic, strong)NSString *faculty;
@property (nonatomic, strong)UIWebView *webView;
@end

@implementation apptViewController
-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    self.agePickerView.hidden = YES;
    self.facultyPikerView.hidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  self.title = @"快速预约";
    self.ageArray = [NSMutableArray array];
    self.facultyArray = [NSMutableArray array];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(goAction)];
    
    
    for (NSInteger i = 1; i < 100; i++) {
        NSString *str = [NSString stringWithFormat:@"%ld",(long)i];
        [self.ageArray addObject:str];
    }
    self.facultyArray = [NSMutableArray arrayWithObjects:@"骨科",@"肝胆",@"心血管",@"妇产",@"整形美容", @"肿瘤",@"其它",@"胸外科",@"泌尿外科",nil];
    
    NSString *str = @"((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)";
    self.testPre  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
  //  [self createView];
    [self createWebView];
    [MBProgressHUD showMessage:@"加载中" toView: self.view];
}
- (void)createWebView
{
    NSString *webUrl = @"http://m.mingyihz.com/mobile/app/enquiry/addBackBtn/1";
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width ,self.view.frame.size.height)];
    NSURL *url = [NSURL URLWithString:[webUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.delegate = self;
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.view addSubview:self.webView];


}

- (void)createView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame ];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.2);
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [self.scrollView addGestureRecognizer:tap];
    [self.view addSubview:self.scrollView];

    CGFloat width = self.scrollView.frame.size.width;
    CGFloat height = self.scrollView.frame.size.height;
    
    self.topImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , width, 3 * height / 21)];
    self.topImage.image = [UIImage imageNamed:@"yuyue.png"];
    [self.scrollView addSubview:self.topImage];
    
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(width / 10, 3 * height / 20 , width, height / 20)];
    nameLabel.text = @"患者姓名";
  //  nameLabel.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:nameLabel];
    
    self.name = [[UITextField alloc]initWithFrame:CGRectMake(width / 10, 4 * height / 20 , 4 * width / 5, height / 20)];
    //self.name.backgroundColor = [UIColor redColor];
    self.name.borderStyle = UITextBorderStyleRoundedRect;
    self.name.placeholder = @"请输入患者真实姓名";
    [self.scrollView addSubview:self.name];
    
//    UILabel *ageLabel = [[UILabel alloc]initWithFrame:CGRectMake(width / 10 , 5 * height / 20, width, height /20 )];
//    ageLabel.text = @"选择年龄";
//    [self.scrollView addSubview:ageLabel];
    
    self.agePickButton = [UIButton  buttonWithType:UIButtonTypeSystem];
    self.agePickButton.frame = CGRectMake(width / 5 , 6 * height / 20, 3 * width / 5 , height / 20);
    self.agePickButton.backgroundColor = [UIColor themeGreenColor];
    [self.agePickButton setTitle:@"选择年龄" forState:UIControlStateNormal];
    
    [self.agePickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.agePickButton addTarget:self action:@selector(ageButtonAction) forControlEvents:UIControlEventTouchUpInside];

    [self.scrollView addSubview:self.agePickButton];
    
    UILabel *phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(width/ 10, 7 * height / 20, width / 1.5 , height / 20)];
    phoneLabel.text = @"手机号码";
    [self.scrollView addSubview:phoneLabel];
    
    self.phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(width / 10, 8 * height / 20 ,4 * width / 5, height / 20)];
    //self.name.backgroundColor = [UIColor redColor];
    self.phoneNumber.borderStyle = UITextBorderStyleRoundedRect;
    self.phoneNumber.placeholder = @"您的手机号码";
    [self.scrollView addSubview:self.phoneNumber];
    
//    UILabel *facultyLabel = [[UILabel alloc ]initWithFrame:CGRectMake(width / 10, 9 * height / 20 , width / 1.5, height / 20)];
//    facultyLabel.text = @"选择科室";
//    [self.scrollView addSubview:facultyLabel];
    
    self.facultyButton = [UIButton  buttonWithType:UIButtonTypeSystem];
    self.facultyButton.frame = CGRectMake(width / 5, 9.5 * height / 20, 3 * width / 5 , height / 20);
    self.facultyButton.backgroundColor = [UIColor themeGreenColor];
    [self.facultyButton setTitle:@"选择科室" forState:UIControlStateNormal];
    [self.facultyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.facultyButton addTarget:self action:@selector(facultyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.facultyButton];
    
    UILabel *describeLabel = [[UILabel alloc]initWithFrame:CGRectMake(width / 10, 11 * height / 20, width/ 1.5 , height / 20)];
    describeLabel.text = @"病情描述";
    [self.scrollView addSubview:describeLabel];
    
    self.describe = [[UITextView alloc]initWithFrame:CGRectMake(width / 10, 12 * height / 20 , 4 * width / 5, height / 5)];
    self.describe.layer.cornerRadius = 5;
    self.describe.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor;
    self.describe.layer.borderWidth = 1;
    [self.scrollView addSubview:self.describe];
    
    self.agePickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(width / 5, 7 * height / 20 , 3 * width / 5, height / 30)];
    self.agePickerView.delegate = self;
    self.agePickerView.dataSource = self;
    self.agePickerView.backgroundColor = [UIColor colorWithRed:0 green:0.3 blue:0.3 alpha:0.5];
    [self.scrollView addSubview:self.agePickerView];
    
    self.facultyPikerView = [[UIPickerView alloc]initWithFrame:CGRectMake(width / 5, 10.5 * height / 20, 3 * width / 5 , height / 30)];
    self.facultyPikerView.delegate = self;
    self.facultyPikerView.dataSource = self;
    self.facultyPikerView.backgroundColor = [UIColor colorWithRed:0 green:0.3 blue:0.3 alpha:0.5];
    [self.scrollView addSubview:self.facultyPikerView];
 
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeSystem];
    goButton.frame = CGRectMake(width / 5, 17 * height / 20, 3 * width / 5, height / 20);
    goButton.backgroundColor = [UIColor themeGreenColor];
    [goButton setTitle:@"提交" forState:UIControlStateNormal];
    [goButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [goButton addTarget:self action:@selector(goAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:goButton];

    
    

}


- (void)ageButtonAction
{
    self.agePickerView.hidden = NO;
}
- (void)facultyButtonAction
{
    
   self.facultyPikerView.hidden = NO;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];

}
- (void)singleTap:(UIGestureRecognizer *)tap
{

    [self.scrollView endEditing:YES];

}
- (void)goAction
{
  
    
  if ([self.name.text length] == 0) {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名不能为空"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
        
    }else if ([self.agePickButton.titleLabel.text isEqualToString:@"选择年龄"]) {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请选择年龄"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    
    
    
    else if (![self.testPre evaluateWithObject:self.phoneNumber.text]){
    
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确手机号" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [aler show];
    
    }
    
    else if ([self.agePickButton.titleLabel.text isEqualToString:@"选择科室"]) {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请选择年龄"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    else if ([self.describe.text length] == 0){
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"病情描述不能为空"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }else{
        NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.name.text,@"name",self.age,@"age",self.phoneNumber.text,@"phone",self.faculty, @"faculty",self.describe.text,@"describe", nil];
        
        NSLog(@"%@",infoDic);
    UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提交成功" message:@"我们的名医助手会在第一时间与您确认预约的详情"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [aler show];
        
     
        
        NSData *json = [NSJSONSerialization dataWithJSONObject:infoDic options:0 error:nil];
        NSLog(@"%@",json);
//        NSString *bodyStr = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
//
//        
        
//        //1. 建立请求
//        NSString *str = @"";
//        
//        //将字符串转换成URL
//        str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSURL *url = [NSURL URLWithString:str];
//        
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
//        request.HTTPMethod = @"POST";
//        
//     
//        
//        // 将一个字符串对象转为NSData数据
//        NSData *data = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
//        
//        request.HTTPBody = data;
//        
//        // 2, 连接服务器, 发送请求
//        
//  
//        NSURLResponse *response = nil;
//        NSError *error = nil;
//        NSData *resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//        
//        // 3. 获取数据 , 处理数据
//        
//        NSError *parseError = nil;
//        id result = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:&parseError];
//        
//        NSLog(@"%@", result);
//        NSLog(@"服务器响应信息 :%@", response);
//        NSLog(@"连接错误信息 : %@", parseError);

        
        NSString *str = @"";
        
        [NetHandler getDataWithURL:str body:infoDic completion:^(NSData *data) {
//            id result  =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            

        }];

        
        
        
        
        
        
        
        
        
        
        
        
    }
 
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (pickerView == self.agePickerView) {
         return self.ageArray.count;
    }
    return self.facultyArray.count;
   
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.agePickerView) {
        return [self.ageArray objectAtIndex:row];
    }
    return [self.facultyArray objectAtIndex:row];
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (pickerView == self.agePickerView ) {
        NSString *str1 = [@"年龄 : " stringByAppendingString:[self.ageArray objectAtIndex:row]];
        [self.agePickButton setTitle:str1 forState:UIControlStateNormal];
        self.agePickerView.hidden = YES;
        self.age = [self.ageArray objectAtIndex:row];
        
    }else if (pickerView == self.facultyPikerView ){
        
  [self.facultyButton setTitle:[self.facultyArray objectAtIndex:row] forState:UIControlStateNormal];
        self.facultyPikerView.hidden = YES;
        self.faculty = [NSString stringWithFormat:@"%@",[self.facultyArray objectAtIndex:row]];
        NSLog(@"%@",self.faculty);
       
        
    }
    
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
