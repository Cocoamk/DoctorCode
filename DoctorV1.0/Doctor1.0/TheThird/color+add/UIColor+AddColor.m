//
//  UIColor+AddColor.m
//  FlatUI
//
//  Created by lzhr on 5/3/13.
//  Copyright (c) 2013 lzhr. All rights reserved.
//

#import "UIColor+AddColor.h"

@implementation UIColor (AddColor)

// Thanks to http://stackoverflow.com/questions/3805177/how-to-convert-hex-rgb-color-codes-to-uicolor
+ (UIColor *) colorFromHexCode:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


+ (UIColor *) ngaBackColor
{
    return [UIColor colorWithRed:253.0f/255.0f green:243.0f/255.0f blue:216.0f/255.0f alpha:1];
}

+ (UIColor *) ngaDarkColor
{
    return [UIColor colorWithRed:249.0f/255.0f green:238.0f/255.0f blue:167.0f/255.0f alpha:1];
}

+ (UIColor *) turquoiseColor {
    return [UIColor colorFromHexCode:@"1ABC9C"];
}

+ (UIColor *) readColor{
    return [UIColor colorFromHexCode:@"#87CEFF"];

}
+ (UIColor *) greenSeaColor {
    return [UIColor colorFromHexCode:@"16A085"];
}

+ (UIColor *) emerlandColor {
    return [UIColor colorFromHexCode:@"2ECC71"];
}

+ (UIColor *) nephritisColor {
    return [UIColor colorFromHexCode:@"27AE60"];
}

+ (UIColor *) peterRiverColor {
    return [UIColor colorFromHexCode:@"3498DB"];
}

+ (UIColor *) belizeHoleColor {
    return [UIColor colorFromHexCode:@"2980B9"];
}

+ (UIColor *) amethystColor {
    return [UIColor colorFromHexCode:@"9B59B6"];
}

+ (UIColor *) wisteriaColor {
    return [UIColor colorFromHexCode:@"8E44AD"];
}

+ (UIColor *) wetAsphaltColor {
    return [UIColor colorFromHexCode:@"34495E"];
}

+ (UIColor *) midnightBlueColor {
    return [UIColor colorFromHexCode:@"2C3E50"];
}

+ (UIColor *) sunflowerColor {
    return [UIColor colorFromHexCode:@"F1C40F"];
}

+ (UIColor *) tangerineColor {
    return [UIColor colorFromHexCode:@"F39C12"];
}

+ (UIColor *) carrotColor {
    return [UIColor colorFromHexCode:@"E67E22"];
}

+ (UIColor *) pumpkinColor {
    return [UIColor colorFromHexCode:@"D35400"];
}

+ (UIColor *) alizarinColor {
    return [UIColor colorFromHexCode:@"E74C3C"];
}

+ (UIColor *) pomegranateColor {
    return [UIColor colorFromHexCode:@"C0392B"];
}

+ (UIColor *) cloudsColor {
    return [UIColor colorFromHexCode:@"ECF0F1"];
}

+ (UIColor *) silverColor {
    return [UIColor colorFromHexCode:@"BDC3C7"];
}

+ (UIColor *) concreteColor {
    return [UIColor colorFromHexCode:@"95A5A6"];
}

+ (UIColor *) asbestosColor {
    return [UIColor colorFromHexCode:@"7F8C8D"];
}
+ (UIColor *) greenNaColor{
    return [UIColor colorFromHexCode:@"008792"];
}
+ (UIColor *)pinkColor
{
    return [UIColor colorFromHexCode:@"f15b6c"];
}
+ (UIColor *)ticColor
{
    return [UIColor colorFromHexCode:@"5F9EA0"];
}
+ (UIColor *)myGrayColor
{
    return [UIColor colorFromHexCode:@"ececec"];
}
+ (UIColor *)f5f5f5Color
{
    return [UIColor colorFromHexCode:@"f5f5f5"];
}
+ (UIColor *)sliderPinkColor
{
    return [UIColor colorFromHexCode:@"fb2df9"];
}
+ (UIColor *)GreatyellowColor
{
    return [UIColor colorFromHexCode:@"fdb933"];
}
+ (UIColor *)greateRedColor
{
    return [UIColor colorFromHexCode:@"f26522"];
}
+ (UIColor *)deeppink
{
    return [UIColor colorFromHexCode:@"ff1493"];
}

+ (UIColor *) themeGreenColor
{
    return  [UIColor colorFromHexCode:@"096"];
}
+ (UIColor *) image1Color
{
return  [UIColor colorFromHexCode:@"C672E1"];
}
+ (UIColor *) image2Color
{
    return  [UIColor colorFromHexCode:@"FF842A"];
}
+ (UIColor *) image3Color
{
    return  [UIColor colorFromHexCode:@"C90"];
}
+ (UIColor *) image4Color
{
    return  [UIColor colorFromHexCode:@"5598DC"];
}
+ (UIColor *) image5Color
{
    return  [UIColor colorFromHexCode:@"81C220"];
}
+ (UIColor *) image6Color
{
    return  [UIColor colorFromHexCode:@"399"];
    
}
+ (UIColor *) backBlueColor
{
    return  [UIColor colorFromHexCode:@"1C86EE"];

}
+ (UIColor *) blendedColorWithForegroundColor:(UIColor *)foregroundColor
                              backgroundColor:(UIColor *)backgroundColor
                                 percentBlend:(CGFloat) percentBlend {
    CGFloat onRed, offRed, newRed, onGreen, offGreen, newGreen, onBlue, offBlue, newBlue, onWhite, offWhite;
    if ([foregroundColor getWhite:&onWhite alpha:nil]) {
        onRed = onWhite;
        onBlue = onWhite;
        onGreen = onWhite;
    }
    else {
        [foregroundColor getRed:&onRed green:&onGreen blue:&onBlue alpha:nil];
    }
    if ([backgroundColor getWhite:&offWhite alpha:nil]) {
        offRed = offWhite;
        offBlue = offWhite;
        offGreen = offWhite;
    }
    else {
        [backgroundColor getRed:&offRed green:&offGreen blue:&offBlue alpha:nil];
    }
    newRed = onRed * percentBlend + offRed * (1-percentBlend);
    newGreen = onGreen * percentBlend + offGreen * (1-percentBlend);
    newBlue = onBlue * percentBlend + offBlue * (1-percentBlend);
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1.0];
}

@end
