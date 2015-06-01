//
//  NetHandler.h
//  Day18_UI_作业1_崔嵬
//
//  Created by Damon on 14/12/7.
//  Copyright (c) 2014年 崔嵬. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface NetHandler : NSObject

+ (void)getDataWithURL:(NSString *)str completion:(void(^)(NSData *data))block;


+ (void)getDataWithURL:(NSString *)str body:(NSDictionary *)body completion:(void(^)(NSData *data))block;

+ (void)getDataWithNoAFNURL:(NSString *)str body:(NSDictionary *)body completion:(void(^)(NSData *data))block;


@end
