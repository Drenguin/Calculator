//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Patrick Mc Gartoll on 11/15/10.
//  Copyright 2010 Drenguin. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

-(void) setOperand:(double)anOperand
{
	operand = anOperand;
}

-(void) performWaitingOperation
{
	if([@"+" isEqual:waitingOperation]) {
		operand = waitingOperand + operand;
	} else if([@"-" isEqual:waitingOperation]) {
		operand = waitingOperand - operand;
	} else if([@"*" isEqual:waitingOperation]) {
		operand = waitingOperand * operand;
	} else if([@"/" isEqual:waitingOperation]) {
		if(operand) {
			operand = waitingOperand / operand;
		}
	}
}

-(double) performOperation:(NSString *)operation
{
	if([operation isEqual:@"sqrt"]) {
		operand = sqrt(operand);
	} else {
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
		
	}

	
	return operand;
}

-(void) clear
{
	operand = 0;
	waitingOperand = 0;
	
}

@end
