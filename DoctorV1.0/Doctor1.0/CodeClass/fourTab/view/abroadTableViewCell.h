//
//  abroadTableViewCell.h
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface abroadTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *image;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)NSMutableArray *array;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
