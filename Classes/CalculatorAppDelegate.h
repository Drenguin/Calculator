//
//  CalculatorAppDelegate.h
//  Calculator
//
//  Created by Patrick Mc Gartoll on 11/15/10.
//  Copyright Drenguin 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalculatorViewController;

@interface CalculatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CalculatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CalculatorViewController *viewController;

@end

