//
//  abroadTableViewCell.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "abroadTableViewCell.h"

@implementation abroadTableViewCell

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
        self.image = [[UIImageView alloc ]init];
        [self addSubview:self.image];
        self.titleLabel = [[UILabel alloc]init];
        [self.image addSubview:self.titleLabel];
        self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    }
    return self;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.image.frame = CGRectMake(10, 10, self.contentView.frame.size.width - 20, self.contentView.frame.size.height - 10);
    self.titleLabel.frame = CGRectMake(0, 4 * self.image.frame.size.height / 5, self.image.frame.size.width, self.image.frame.size.height / 5);
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    

}
@end
