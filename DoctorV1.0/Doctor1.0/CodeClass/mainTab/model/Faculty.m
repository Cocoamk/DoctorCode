//
//  Faculty.m
//  Doctor1.0
//
//  Created by mk on 15/5/29.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "Faculty.h"

@implementation Faculty
-(instancetype)initWithDictionary:(NSMutableDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}


-(id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
