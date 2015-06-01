//
//  HospitalTableViewCell.h
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hospital.h"
@interface HospitalTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *photoImage;
@property (nonatomic, strong)UILabel *hosName;
@property (nonatomic, strong)UILabel *hosClassLabel;
@property (nonatomic, strong)UILabel *hosTypeLabel;
@property (nonatomic, strong)UIImageView *goImageView;
@property (nonatomic, strong)Hospital *hospital;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



@end
