//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Patrick Mc Gartoll on 11/15/10.
//  Copyright Drenguin 2010. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

-(CalculatorBrain *)brain
{
	if(!brain) {
		brain = [[CalculatorBrain alloc] init];
	}
	return brain;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
    }
}


-(IBAction) digitPressed: (UIButton *)sender
{
	NSString *digit = [[sender titleLabel] text];
	if (userIsInTheMiddleOfTypingANumber) {
		[display setText:[[display text] stringByAppendingFormat:@"%@", digit]];
	} else {
		[display setText:digit];
		userIsInTheMiddleOfTypingANumber = YES;
	}

}

-(IBAction) operationPressed: (UIButton *)sender
{
	if (userIsInTheMiddleOfTypingANumber) {
		[[self brain] setOperand:[[display text] doubleValue]];
		userIsInTheMiddleOfTypingANumber = NO;
	}
	//get the title of the button and then turns that into text
	NSString *operation = [[sender titleLabel] text];
	double result = [[self brain] performOperation:operation];
	[display setText:[NSString stringWithFormat:@"%g", result]];
	decimalPressed = NO;
}

-(IBAction) decimalButtonPressed
{
	if (decimalPressed) {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"You can't have more than one decimal!"
							  message:@"In math, only one decimal,if any, may be present."
							  delegate:self
							  cancelButtonTitle:@"OK"
							  otherButtonTitles:nil];
		[alert show];
	} else {
		if (userIsInTheMiddleOfTypingANumber) {
			[display setText:[[display text] stringByAppendingFormat:@"%@", @"."]];
		} else {
			[display setText:@"0."];
			userIsInTheMiddleOfTypingANumber = YES;
		}
		decimalPressed = YES;
	}
}

-(IBAction) clearButtonPressed
{
	[[self brain] clear];
	[display setText:@"0"];
}

-(IBAction) memoryButtonPressed: (UIButton *)sender
{
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
