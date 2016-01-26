//
//  Utility.m
//  Circular
//
//  Created by Makoto Shoji on 12/01/07.
//  Copyright (c) 2012 PrimeTheory. All rights reserved.
//

#import "Utility.h"

@implementation Utility

- (void)dealloc {
    [super dealloc];
}

+ (int)checkDisplaySize
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if(screenSize.width == 414.0 && screenSize.height == 736.0){
        // 5.5inch / iPhone6+
        return k55inch;
    } else if(screenSize.width == 375.0 && screenSize.height == 667.0){
        // 4.7inch / iPhone6
        return k47inch;
    } else if(screenSize.width == 320.0 && screenSize.height == 568.0){
        // 4inch / iPhone5/5S/5C
        return k4inch;
    } else if(screenSize.width == 320.0 && screenSize.height == 480.0){
        // 3.5inch / iPhone4/4S/3GS/3G
        return k35inch;
    } else {
        return k35inch;
    }
}

+ (float)screenWidthSize
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return screenSize.width;
}

+ (BOOL)is4inch {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return screenSize.width == 320.0 && screenSize.height == 568.0;
}

+ (BOOL)isIOS8
{
    return (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) ? NO : YES;
}

@end
