//
//  Faculty.h
//  Doctor1.0
//
//  Created by mk on 15/5/29.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Faculty : NSObject
@property (nonatomic, strong)NSString *urlIcon;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *code;
@property (nonatomic, strong)NSString *desc;
@property (nonatomic, strong)NSString *url;
-(instancetype)initWithDictionary:(NSMutableDictionary *)dic;
@end
