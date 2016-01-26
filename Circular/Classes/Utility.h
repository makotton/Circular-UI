//
//  Utility.h
//  Circular
//
//  Created by Makoto Shoji on 12/01/07.
//  Copyright (c) 2012 PrimeTheory. All rights reserved.
//

#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define BAR_BASE_COLOR                      RGB(255, 255, 255)

#define TRANSFORM_FWD_TIME                  0.01f
#define TRANSFORM_BACK_TIME                 0.01f

#define FONT_HIRAGINO                       @"HiraKakuProN-W3"
#define CIRCLE_IMAGE_FILE                   @"circle.png"
#define SERVICE_LAUNCH_POINT                @"Launch"

#import <UIKit/UIKit.h>

static const int k35inch = 1;
static const int k4inch = 2;
static const int k47inch = 3;
static const int k55inch = 4;

@interface Utility : NSObject;

+ (int)checkDisplaySize;
+ (float)screenWidthSize;
+ (BOOL)is4inch;
+ (BOOL)isIOS8;

@end