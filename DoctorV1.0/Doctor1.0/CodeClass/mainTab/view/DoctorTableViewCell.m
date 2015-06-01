//
//  DoctorTableViewCell.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "DoctorTableViewCell.h"
#import "UIColor+AddColor.h"
#import "Doctor.h"
#import "UIImageView+WebCache.h"
@implementation DoctorTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    

 
    if (self) {
        self.photoImage = [[UIImageView alloc]init];
    //    self.photoImage.backgroundColor = [UIColor redColor];
        [self addSubview:self.photoImage];
        
        self.docNameLabel = [[UILabel alloc]init];
    //    self.docNameLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.docNameLabel];
        
        self.hosName = [[UILabel alloc]init];
    //    self.hosName.backgroundColor = [UIColor blackColor];
        [self addSubview:self.hosName];
        
        self.facultyLabel = [[UILabel alloc]init];
    //    self.facultyLabel.backgroundColor = [UIColor blackColor];
        [self addSubview:self.facultyLabel];
        
        self.pTitleLabel= [[UILabel alloc]init];
    //    self.pTitleLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:self.pTitleLabel];
        
        self.goImageView = [[UIImageView alloc]init];
        [self addSubview:self.goImageView];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    self.photoImage.frame = CGRectMake(20, 20, width / 4, width / 4);
    self.photoImage.layer.cornerRadius = width / 8;
   
    self.docNameLabel.frame = CGRectMake(width/ 3,height / 8, 5* width /5, height / 4);
    self.docNameLabel.textColor = [UIColor themeGreenColor];
    
    self.hosName.frame = CGRectMake(width/ 3,2 * height / 5,2 * width / 3, height / 6);
    self.facultyLabel.frame = CGRectMake(width/ 3, 3 * height / 5, width / 2  , height / 6);

    self.pTitleLabel.frame = CGRectMake(width / 3, 4 * height / 5, width / 4, height / 6);
        self.pTitleLabel.textColor = [UIColor whiteColor];
    self.pTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.pTitleLabel.backgroundColor = [UIColor backBlueColor];
    
    
    
    self.hosName.font = [UIFont systemFontOfSize:14];
    self.facultyLabel.font = [UIFont systemFontOfSize:14];
    self.pTitleLabel.font = [UIFont systemFontOfSize:14];

    
    self.goImageView.frame = CGRectMake( width - 40, height / 2, 32, 32);
    self.goImageView.image = [UIImage imageNamed:@"iconfont-jiantou"];
    
    [self.photoImage sd_setImageWithURL:self.doctor.urlImage placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.docNameLabel.text = self.doctor.name;
    self.hosName.text = self.doctor.hospital;
    self.facultyLabel.text = self.doctor.hFaculty;
    self.pTitleLabel.text = self.doctor.mTitle;
    
}

@end
