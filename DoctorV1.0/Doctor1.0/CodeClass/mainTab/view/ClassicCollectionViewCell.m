//
//  ClassicCollectionViewCell.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "ClassicCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ClassicCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]init];
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        [self addSubview:self.label];
    }
    return self;
}
-(void)layoutSubviews
{

    [super layoutSubviews];
    self.imageView.frame = CGRectMake(self.contentView.frame.size.width / 2.5, self.contentView.frame.size.height / 5, 32, 32);
    self.label.frame = CGRectMake(0, 3 * self.contentView.frame.size.height / 5, self.contentView.frame.size.width, self.contentView.frame.size.height / 4);
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
   
}
- (void)setFaculty:(Faculty *)faculty
{
    if (_faculty != faculty ) {
        _faculty = faculty;
    }
 self.label.text = self.faculty.name;
    [self.imageView sd_setImageWithURL:self.faculty.urlIcon];

}
@end
