//
//  ClassicCollectionViewCell.h
//  Doctor1.0
//
//  Created by mk on 15/5/26.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Faculty.h"
@interface ClassicCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)Faculty *faculty;
-(instancetype)initWithFrame:(CGRect)frame;
@end
