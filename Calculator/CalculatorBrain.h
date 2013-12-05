//
//  CalculatorBrain.h
//  Calculator
//
//  Created by lomozm on 13-12-3.
//  Copyright (c) 2013年 lomozm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand: (double)operand;

- (double)performOperation: (NSString *)operation;

@end
