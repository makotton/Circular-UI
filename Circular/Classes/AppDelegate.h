//
//  AppDelegate.h
//  Circular
//
//  Created by Makoto Shoji on 12/01/07.
//  Copyright (c) 2012 PrimeTheory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularViewController.h"
#import "Utility.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    CircularViewController *circularViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end