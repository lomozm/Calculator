//
//  ViewController.m
//  Calculator
//
//  Created by lomozm on 13-11-5.
//  Copyright (c) 2013年 lomozm. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
@property (nonatomic) BOOL userInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain * brain;
@end

@implementation ViewController

@synthesize display = _display;
@synthesize userInTheMiddleOfEnteringANumber = _userInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = sender.currentTitle;  //[sender currentTitle];
//    NSLog(@"digit pressed = %@", digit);
  //  UILabel *myDisplay = self.display;
    //[self display];
  //  NSString *currentText = myDisplay.text;
    //[myDisplay text];
   // NSString *newText = [currentText stringByAppendingString:digit];
    
   // self.display.text = newText;
    if (self.userInTheMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else{
        self.display.text = digit;
        self.userInTheMiddleOfEnteringANumber = YES;
    }
    
    
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    
    self.userInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userInTheMiddleOfEnteringANumber)
        [self enterPressed];
    
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

@end
