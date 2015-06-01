//
//  HospitalTableViewCell.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "HospitalTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation HospitalTableViewCell

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
     //     self.photoImage.backgroundColor = [UIColor redColor];
          [self addSubview:self.photoImage];
          
          self.hosName = [[UILabel alloc]init];
     //     self.hosName.backgroundColor = [UIColor yellowColor];
          [self addSubview:self.hosName];
          
          self.hosClassLabel = [[UILabel alloc]init];
    //      self.hosClassLabel.backgroundColor = [UIColor grayColor];
          [self addSubview:self.hosClassLabel];
          
          self.hosTypeLabel = [[UILabel alloc]init];
    //      self.hosTypeLabel.backgroundColor = [UIColor blackColor];
          [self addSubview:self.hosTypeLabel];
          
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
    self.photoImage.frame = CGRectMake(10, 10, width / 3.5 , height -20);
    self.hosName.frame = CGRectMake(width / 3, height / 4,4 * width / 5, height / 4);
    
    self.hosClassLabel.frame = CGRectMake(width / 3, 3 * height / 5, width / 5, height / 4);
    self.hosClassLabel.textColor = [UIColor blueColor];
    self.hosClassLabel.font = [UIFont systemFontOfSize:14];

    self.hosTypeLabel.frame = CGRectMake(3 * width / 5, 3 * height / 5, width / 5, height / 4);
    self.hosTypeLabel.textColor = [UIColor blueColor];
    self.hosTypeLabel.font = [UIFont systemFontOfSize:14];
    self.goImageView.frame = CGRectMake( width - 40, height / 3, 32, 32);
    self.goImageView.image = [UIImage imageNamed:@"iconfont-jiantou"];
    self.hosName.text = self.hospital.name;
    self.hosClassLabel.text = self.hospital.kclass;
    self.hosTypeLabel.text = self.hospital.type;
    [self.photoImage sd_setImageWithURL:self.hospital.urlImage placeholderImage:[UIImage imageNamed:@"hoszhanwei"]];
    
    
  //  NSLog(@"~~~~~~~~~~~~%@",self.photoImage.image);
}







@end
