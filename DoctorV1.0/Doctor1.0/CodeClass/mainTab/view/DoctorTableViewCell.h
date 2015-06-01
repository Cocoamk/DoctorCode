//
//  DoctorTableViewCell.h
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
@interface DoctorTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *photoImage;
@property (nonatomic, strong)UILabel *docNameLabel;
@property (nonatomic, strong)UILabel *hosName;
//科室
@property (nonatomic, strong)UILabel *facultyLabel;
@property (nonatomic, strong)UILabel *pTitleLabel;
@property (nonatomic, retain)Doctor *doctor;


@property (nonatomic, strong)UIImageView *goImageView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
