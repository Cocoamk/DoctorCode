//
//  diseaseCollectionViewCell.m
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "diseaseCollectionViewCell.h"

@implementation diseaseCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
        self.label = [[UILabel alloc]init];
        [self addSubview:self.label];
    }
    return self;
}
-(void)layoutSubviews
{
    
    [super layoutSubviews];

    self.label.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height );
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont systemFontOfSize:13];
    self.label.textAlignment = NSTextAlignmentCenter;
    
}
@end
