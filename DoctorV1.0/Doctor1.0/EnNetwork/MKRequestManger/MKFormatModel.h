//
//  NSObject+MKFormatModel.h
//  PlanB
//
//  Created by young on 15/5/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  字典转模型  
 *  替换键值
 */
@interface NSObject (MKFormatModel)

@property (nonatomic, strong) NSDictionary *mapDictionary;

- (void)setDataDictionary:(NSDictionary*)dataDictionary;
- (NSDictionary *)dataDictionary;

@end
