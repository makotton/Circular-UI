//
//  CircularViewController.m
//  Circular
//
//  Created by Makoto Shoji on 12/01/07.
//  Copyright (c) 2012 PrimeTheory. All rights reserved.
//

#import "CircularViewController.h"

@implementation CircularViewController

- (id)init {
    self = [super init];
    if (self) {
        // none
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // none
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)loadView {
    [super loadView];
    [self createView];
}

- (void)initPoint {
    beginPoint = CGPointZero;
    nextPoint = CGPointZero;
}

- (void)createView {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenHeight = screenSize.height / 2;

    CGFloat offsetHeight = 0.0f;
    if ([Utility checkDisplaySize] == k55inch) {
        offsetHeight = 138.0f;
    } else if ([Utility checkDisplaySize] == k47inch) {
        offsetHeight = 103.5f;
    } else if ([Utility checkDisplaySize] == k4inch) {
        offsetHeight = 54.0f;
    } else if ([Utility checkDisplaySize] == k35inch) {
        offsetHeight = 10.0f;
    }

    CGFloat offsetWidth = 0.0f;
    if ([Utility checkDisplaySize] == k55inch) {
        offsetWidth = 47.0f;
    } else if ([Utility checkDisplaySize] == k47inch) {
        offsetWidth = 27.5f;
    } else if ([Utility checkDisplaySize] == k4inch) {
        offsetWidth = 0.0f;
    } else if ([Utility checkDisplaySize] == k35inch) {
        offsetWidth = 0.0f;
    }
    
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(240 + offsetWidth, 195 + offsetHeight, 70, 70)];
    label1.backgroundColor = [UIColor magentaColor];
    [[label1 layer] setCornerRadius:35];
    [label1 setClipsToBounds:YES];
    [self.view addSubview:label1];
    
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(206 + offsetWidth, 114 + offsetHeight, 70, 70)];
    label2.backgroundColor = [UIColor redColor];
    [[label2 layer] setCornerRadius:35];
    [label2 setClipsToBounds:YES];
    [self.view addSubview:label2];
    
    label3 = [[UILabel alloc] initWithFrame:CGRectMake(125 + offsetWidth, 80 + offsetHeight, 70, 70)];
    label3.backgroundColor = [UIColor blueColor];
    [[label3 layer] setCornerRadius:35];
    [label3 setClipsToBounds:YES];
    [self.view addSubview:label3];
    
    label4 = [[UILabel alloc] initWithFrame:CGRectMake(44 + offsetWidth, 114 + offsetHeight, 70, 70)];
    label4.backgroundColor = [UIColor orangeColor];
    [[label4 layer] setCornerRadius:35];
    [label4 setClipsToBounds:YES];
    [self.view addSubview:label4];
    
    labelLaunch = [[UILabel alloc] initWithFrame:CGRectMake(206 + offsetWidth, 276 + offsetHeight, 70, 70)];
    labelLaunch.backgroundColor = [UIColor whiteColor];
    [[labelLaunch layer] setCornerRadius:35];
    [labelLaunch setClipsToBounds:YES];
    [labelLaunch setText:SERVICE_LAUNCH_POINT];
    [labelLaunch setTextColor:[UIColor redColor]];
    [labelLaunch setTextAlignment:NSTextAlignmentCenter];
    [labelLaunch setFont:[UIFont boldSystemFontOfSize:[UIFont buttonFontSize]]];
    labelLaunch.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:labelLaunch];
    
    label5 = [[UILabel alloc] initWithFrame:CGRectMake(10 + offsetWidth, 195 + offsetHeight, 70, 70)];
    label5.backgroundColor = [UIColor greenColor];
    [[label5 layer] setCornerRadius:35];
    [label5 setClipsToBounds:YES];
    [self.view addSubview:label5];
    
    label6 = [[UILabel alloc] initWithFrame:CGRectMake(44 + offsetWidth, 276 + offsetHeight, 70, 70)];
    label6.backgroundColor = [UIColor cyanColor];
    [[label6 layer] setCornerRadius:35];
    [label6 setClipsToBounds:YES];
    [self.view addSubview:label6];
    
    label7 = [[UILabel alloc] initWithFrame:CGRectMake(125 + offsetWidth, 310 + offsetHeight, 70, 70)];
    label7.backgroundColor = [UIColor purpleColor];
    [[label7 layer] setCornerRadius:35];
    [label7 setClipsToBounds:YES];
    [self.view addSubview:label7];
    
    [self createLabelOutside];
    
    labelInSide = [[UILabel alloc] initWithFrame:CGRectMake(90 + offsetWidth, screenHeight - 70, 140, 140)];
    labelInSide.backgroundColor = [UIColor whiteColor];
    [[labelInSide layer] setCornerRadius:70];
    [labelInSide setTextColor:[UIColor whiteColor]];
    [labelInSide setFont:[UIFont fontWithName:FONT_HIRAGINO size:[UIFont systemFontSize]]];
    [labelInSide setTextAlignment:NSTextAlignmentCenter];
    [labelInSide setClipsToBounds:YES];
    [labelInSide setFont:[UIFont boldSystemFontOfSize:[UIFont buttonFontSize]]];
    labelInSide.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:labelInSide];
}

- (void)createLabelOutside {
    UIImage *image = [UIImage imageNamed:CIRCLE_IMAGE_FILE];
    labelOutside = [[UIImageView alloc] initWithImage:image];
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenHeight = screenSize.height / 2;
    CGFloat screenWidth = screenSize.width / 2;
    [labelOutside setFrame:CGRectMake(screenWidth - 160, screenHeight - 160, 320, 320)];
    [[labelOutside layer] setCornerRadius:160];
    [labelOutside setClipsToBounds:YES];
    [self.view addSubview:labelOutside];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    fit = NO;
    exception = NO;
    touchNo = 0;

    [self initPoint];
    
    UITouch *touch = [[event allTouches] anyObject];
    if (CGRectContainsPoint([label1 frame], [touch locationInView:self.view])) {
        touchNo = 1;
    } else if (CGRectContainsPoint([label2 frame], [touch locationInView:self.view])) {
        touchNo = 2;
    } else if (CGRectContainsPoint([label3 frame], [touch locationInView:self.view])) {
        touchNo = 3;
    } else if (CGRectContainsPoint([label4 frame], [touch locationInView:self.view])) {
        touchNo = 4;
    } else if (CGRectContainsPoint([label5 frame], [touch locationInView:self.view])) {
        touchNo = 5;
    } else if (CGRectContainsPoint([label6 frame], [touch locationInView:self.view])) {
        touchNo = 6;
    } else if (CGRectContainsPoint([label7 frame], [touch locationInView:self.view])) {
        touchNo = 7;
    } else if (CGRectContainsPoint([labelLaunch frame], [touch locationInView:self.view])) {
        exception = YES;
    } else {
        return;
    }
    
    [self initPoint];
    nextPoint = [[touches anyObject] locationInView:self.view];
    beginPoint = nextPoint;
    
    if ((movePoints != nil) && (movePoints.count != 0)) [movePoints release];
    movePoints = [[NSMutableArray alloc] init];
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    if (fit) return;
    if (touchNo == 0) return;
    
    UITouch *touch = [[event allTouches] anyObject];
    if (CGRectContainsPoint([labelLaunch frame], [touch locationInView:self.view])) {
        if (!exception) {
            if (0 < touchNo && touchNo < 8) {
                [labelInSide setText:[NSString stringWithFormat:@"%ld",(long)touchNo]];
            }

            if (touchNo == 1) {
                labelInSide.backgroundColor = [UIColor magentaColor];
            } else if (touchNo == 2) {
                [labelInSide setText:@"2"];
                labelInSide.backgroundColor = [UIColor redColor];
            } else if (touchNo == 3) {
                [labelInSide setText:@"3"];
                labelInSide.backgroundColor = [UIColor blueColor];
            } else if (touchNo == 4) {
                [labelInSide setText:@"4"];
                labelInSide.backgroundColor = [UIColor orangeColor];
            } else if (touchNo == 5) {
                [labelInSide setText:@"5"];
                labelInSide.backgroundColor = [UIColor greenColor];
            } else if (touchNo == 6) {
                [labelInSide setText:@"6"];
                labelInSide.backgroundColor = [UIColor cyanColor];
            } else if (touchNo == 7) {
                [labelInSide setText:@"7"];
                labelInSide.backgroundColor = [UIColor purpleColor];
            } else {
                return;
            }

            fit = YES;
            return;
        }
    }

    // Current coordinate
    CGPoint p = [[touches anyObject] locationInView:self.view];

    // Coordinate calculation
    CGFloat ax = (nextPoint.x - self.view.center.x);
    CGFloat ay = (nextPoint.y - self.view.center.y);
    CGFloat bx = (p.x - self.view.center.x);
    CGFloat by = (p.y - self.view.center.y);    
    CGFloat r = atan2(ax * by - ay * bx, ax * bx + ay * by);
    
    // Keep coordinate
    NSNumber *num = [NSNumber numberWithFloat:r];
    [movePoints addObject:num];
    
    // Rotation of outside circle
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:TRANSFORM_FWD_TIME];
    labelOutside.transform = CGAffineTransformRotate(labelOutside.transform, r);
    [UIView commitAnimations];
    
    // Set the end coordinate to next start coordinate
    nextPoint = p;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    fit = NO;
    exception = NO;

    if (touchNo == 0) return;

    [labelInSide setText:@""];
    labelInSide.backgroundColor = [UIColor whiteColor];

    timerCount = 0;
    [NSTimer scheduledTimerWithTimeInterval:TRANSFORM_BACK_TIME target:self selector:@selector(rollBack:) userInfo:nil repeats:YES];

    UITouch *touch = [[event allTouches] anyObject];
    if (!CGRectContainsPoint([labelLaunch frame], [touch locationInView:self.view])) {
        //
        // Do processing of something here (check touchNo)
        //
        return;
    }

    [self initPoint];
}

- (void)rollBack:(NSTimer*)timer {
    // Exceeds the index ?
    if ([movePoints count] <= timerCount++) {
        [labelOutside removeFromSuperview];
        [self createLabelOutside];
        [self.view bringSubviewToFront:labelInSide];

        [timer invalidate];
        timer = nil;
        return;
    }
    
    // Check for move coordinate array
    NSNumber *num = (NSNumber*)[movePoints objectAtIndex:timerCount - 1];
    float r = [num floatValue]; 

    // Rotation of outside circle
    labelOutside.transform = CGAffineTransformRotate(labelOutside.transform, -r);
}

@end
