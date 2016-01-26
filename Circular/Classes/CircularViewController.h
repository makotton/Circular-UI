//
//  CircularViewController.h
//  Circular
//
//  Created by Makoto Shoji on 12/01/07.
//  Copyright (c) 2012 PrimeTheory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Utility.h"

@interface CircularViewController : UIViewController {
    CGPoint beginPoint;
    CGPoint nextPoint;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
    UILabel *label6;
    UILabel *label7;
    UILabel *labelLaunch;
    UILabel *labelInSide;           // Circle of Inside
    UIImageView *labelOutside;      // Circle of Outside（image file）
    NSInteger touchNo;
    BOOL exception;
    NSMutableArray *movePoints;
    NSInteger timerCount;
    BOOL fit;                       // Reaching flag
}

- (void)initPoint;
- (void)createView;
- (void)createLabelOutside;
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event;
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event;
- (void)rollBack:(NSTimer*)timer;


@end
