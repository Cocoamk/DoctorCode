//
//  RequestManager.h
//  PKTProject
//
//  Created by young on 15/5/30.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


/**
 *  网络请求 需要导入 AFN  success 的是已经解析好的数据,failure 请求失败 可以打印 error
 */

@interface RequestManager : NSObject

//post

+ (void)POST:(NSString *)URL params:(NSDictionary * )params success:(void (^)(id response))success
     failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))Error;
//get

+ (void)GET:(NSString *)URL
    success:(void (^)(id response))success
    failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))Error;
//上传图片
+ (void)UPLOADIMAGE:(NSString *)URL
             params:(NSDictionary *)params
        uploadImage:(UIImage *)image
            success:(void (^)(id response))success
            failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))Error;

@end
