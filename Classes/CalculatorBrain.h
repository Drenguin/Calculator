//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Patrick Mc Gartoll on 11/15/10.
//  Copyright 2010 Drenguin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
	double operand;
	NSString *waitingOperation;
	double waitingOperand;
}

-(void) setOperand:(double)anOperand;
-(double) performOperation:(NSString *)operation;
-(void) clear;

@end
