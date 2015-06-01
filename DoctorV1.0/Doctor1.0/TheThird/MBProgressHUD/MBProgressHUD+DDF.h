//
//  MBProgressHUD+DDF.h
//  DaiDaiFa
//
//  Created by coder.j on 14-10-18.
//  Copyright (c) 2014年 com.daidaifa. All rights reserved.
//


#import "MBProgressHUD.h"

@interface MBProgressHUD (DDF)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
