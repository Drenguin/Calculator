//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Patrick Mc Gartoll on 11/15/10.
//  Copyright Drenguin 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
	IBOutlet UILabel *display;
	CalculatorBrain *brain;
	BOOL userIsInTheMiddleOfTypingANumber;
	BOOL decimalPressed;
}

-(IBAction) memoryButtonPressed: (UIButton *)sender;
-(IBAction) decimalButtonPressed;
-(IBAction) clearButtonPressed;
-(IBAction) digitPressed: (UIButton *)sender;
-(IBAction) operationPressed: (UIButton *)sender;

@end

