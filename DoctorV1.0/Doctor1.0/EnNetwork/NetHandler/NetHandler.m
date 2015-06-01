//
//  NetHandler.m
//  Day18_UI_作业1_崔嵬
//
//  Created by Damon on 14/12/7.
//  Copyright (c) 2014年 崔嵬. All rights reserved.
//

#import "NetHandler.h"
#import "JSONKit.h"
#import <UIKit/UIKit.h>
#import "AFNetworkReachabilityManager.h"
#import "MBProgressHUD+DDF.h"
@implementation NetHandler



// get请求
+ (void)getDataWithURL:(NSString *)str completion:(void (^)(NSData *))block
{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                
                NSString *Urlstr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                
                NSURL *url = [NSURL URLWithString:Urlstr];
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:100];
                
                request.HTTPMethod = @"get";
                
                [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                    
                    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
                    
                    NSFileManager *fileManager = [NSFileManager defaultManager];
                    
                    NSString *cacheDirectory = [docPath stringByAppendingPathComponent:@"myCaches"];

                    if (![fileManager isExecutableFileAtPath:@"myCaches"]) {
                        [fileManager createDirectoryAtPath:cacheDirectory withIntermediateDirectories:YES attributes:nil error:nil];
                    }

                    NSString *strPath = [NSString stringWithFormat:@"%ld.aa", [str hash]];
                    
                    NSString *path = [cacheDirectory stringByAppendingPathComponent:strPath];
//                    NSLog(@"%@",path);
                    if (data != nil) {
                        // BOOL result = [NSKeyedArchiver archiveRootObject:data toFile:path];
                        //NSLog(@"%d", result);
                        block(data);
                    } else {
                        NSData *pickData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
                        if (pickData != nil) {
                            block(pickData);
                        }
                    }
                }];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusUnknown:
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"当前没有网哦亲~" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alertView show];
                
             
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [alertView dismissWithClickedButtonIndex:0 animated:YES];
                    
                });
             
                NSLog(@"当前无网络");
                // 没有网络或请求失败, 就从本地读取最近一次成功的数据
                NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
                NSString *path = [NSString stringWithFormat:@"%@/%ld.aa", docPath, [str hash]];
                NSData *pickData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
                if (pickData != nil) {
                    // 确保有数据才返回
                    block(pickData);
                }
            }
                
                
                break;
                
            default:
            {
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"网络不给力啊亲~" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alertView show];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [alertView dismissWithClickedButtonIndex:0 animated:YES];
                });
                
                NSLog(@"当前无网络");
                // 没有网络或请求失败, 就从本地读取最近一次成功的数据
                NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
                NSString *path = [NSString stringWithFormat:@"%@/%ld.aa", docPath, [str hash]];
                NSData *pickData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
                if (pickData != nil) {
                    // 确保有数据才返回
                    block(pickData);
                }
            }
                break;
        }

    }];
    
}


// post 请求
+ (void)getDataWithURL:(NSString *)str body:(NSDictionary *)body completion:(void(^)(NSData *data))block
{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
    
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSString *Urlstr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                
                NSURL *url = [NSURL URLWithString:Urlstr];
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
                
                NSData *bodyData = [body JSONData];
                
                request.HTTPBody = bodyData;
                
                request.HTTPMethod = @"POST";
                
                [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {


                    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
                    
                    NSFileManager *fileManager = [NSFileManager defaultManager];
                    
                    NSString *cacheDirectory = [docPath stringByAppendingPathComponent:@"myCaches"];
                    
                    if (![fileManager isExecutableFileAtPath:@"myCaches"]) {
                        [fileManager createDirectoryAtPath:cacheDirectory withIntermediateDirectories:YES attributes:nil error:nil];
                    }
                    NSString *strPath = [NSString stringWithFormat:@"%ld.aa", [str hash]];
                    NSString *path = [cacheDirectory stringByAppendingPathComponent:strPath];
                    NSLog(@"%@",path);
                    
                    if (data != nil) {
                        block(data);
                    } else {
                        NSData *pickData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
                        if (pickData != nil) {
                            block(pickData);
                        }
                    }
                    
                }];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"网络不给力啊" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alertView show];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [alertView dismissWithClickedButtonIndex:0 animated:YES];
                });
                
                NSLog(@"当前无网络");
                // 没有网络或请求失败, 就从本地读取最近一次成功的数据
                NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
                NSString *path = [NSString stringWithFormat:@"%@/%ld.aa", docPath, [str hash]];
                NSData *pickData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
                if (pickData != nil) {
                    // 确保有数据才返回
                    block(pickData);
                }
                
            }
                break;
            default:
            {
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"网络不给力啊" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alertView show];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [alertView dismissWithClickedButtonIndex:0 animated:YES];
                });
                
                NSLog(@"当前无网络");
                // 没有网络或请求失败, 就从本地读取最近一次成功的数据
                NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
                NSString *path = [NSString stringWithFormat:@"%@/%ld.aa", docPath, [str hash]];
                NSData *pickData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
                if (pickData != nil) {
                    // 确保有数据才返回
                    block(pickData);
                }
            }
                break;
        }
    }];
    
}

+ (void)getDataWithNoAFNURL:(NSString *)str body:(NSDictionary *)body completion:(void(^)(NSData *data))block
{
 
    NSString *Urlstr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:Urlstr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    NSData *bodyData = [body JSONData];
    
    request.HTTPBody = bodyData;
    
    request.HTTPMethod = @"POST";
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *cacheDirectory = [docPath stringByAppendingPathComponent:@"myCaches"];
        
        if (![fileManager isExecutableFileAtPath:@"myCaches"]) {
            [fileManager createDirectoryAtPath:cacheDirectory withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString *strPath = [NSString stringWithFormat:@"%ld.aa", [str hash]];
        NSString *path = [cacheDirectory stringByAppendingPathComponent:strPath];
        NSLog(@"%@",path);
        
        if (data != nil) {
            block(data);
        } else {
            NSData *pickData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
            if (pickData != nil) {
                block(pickData);
            }
        }
        
    }];

}


@end
