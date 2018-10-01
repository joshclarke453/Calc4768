//
//  ViewController.m
//  Calc4768
//
//  Created by Joshua on 2018-09-28.
//  Copyright © 2018 jtc260. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField* textField;

@end

@implementation ViewController
NSString *tempNum = nil;
NSString *operand = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)numButPressed:(UIButton *)input {
    _textField.text = [_textField.text stringByAppendingString:input.currentTitle];
}

- (IBAction)clearContents:(UIButton *)sender {
    if (_textField.text != nil) {
        _textField.text = nil;
    } else {
        tempNum = nil;
        operand = nil;
    }
}

- (IBAction)deleteInput:(UIButton *)input {
    if (_textField.text.length >= 1) {
        _textField.text = [_textField.text substringToIndex:_textField.text.length-1];
    }
}

- (IBAction)xSquared:(UIButton *)sender {
    double x = [_textField.text doubleValue];
    x = pow(x, 2);
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

- (IBAction)xCubed:(UIButton *)sender {
    double x = [_textField.text doubleValue];
    x = pow(x, 3);
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

- (IBAction)squareRootOfX:(UIButton *)sender {
    double x = [_textField.text doubleValue];
    x = sqrt(x);
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

- (IBAction)oneOverX {
    double x = [_textField.text doubleValue];
    x = 1 / x;
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

//1+2-3= doesnt work, neither does 1+3/2^4, etc..
//but 1+1+1+1 does...
- (IBAction)add {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"+";
        _textField.text = nil;
    } else if ([operand  isEqual: @"+"]) {
        double x = [tempNum doubleValue] + [_textField.text doubleValue];
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    } else {
        [self computeEquation];
        tempNum = _textField.text;
        _textField.text = nil;
        operand = @"+";
    }
}

- (IBAction)subtract {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"-";
        _textField.text = nil;
    } else {
        double x = [tempNum doubleValue] - [_textField.text doubleValue];
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    }
}
- (IBAction)xPowY {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"^";
        _textField.text = nil;
    } else {
        double x = pow([tempNum doubleValue] ,[_textField.text doubleValue]);
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    }
}

- (IBAction)multiply {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"x";
        _textField.text = nil;
    } else {
        double x = [tempNum doubleValue]*[_textField.text doubleValue];
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    }
}

- (IBAction)divide {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"/";
        _textField.text = nil;
    } else {
        double x = [tempNum doubleValue]/[_textField.text doubleValue];
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    }
}

- (IBAction)plusEquals {
    double x = [_textField.text doubleValue]+[_textField.text doubleValue];
    _textField.text = [NSString stringWithFormat:@"%g",x];
}


- (IBAction)computeEquation {
    if ([operand  isEqual: @"+"]) {
        double x = [tempNum doubleValue] + [_textField.text doubleValue];
        _textField.text = [NSString stringWithFormat:@"%g",x];
    } else if ([operand isEqual:@"-"]) {
        double x = [tempNum doubleValue] - [_textField.text doubleValue];
        _textField.text = [NSString stringWithFormat:@"%g",x];
    } else if ([operand isEqual:@"^"]) {
        double x = pow([tempNum doubleValue], [_textField.text doubleValue]);
        _textField.text = [NSString stringWithFormat:@"%g",x];
    } else if ([operand isEqual:@"x"]) {
        double x = [tempNum doubleValue]*[_textField.text doubleValue];
        _textField.text = [NSString stringWithFormat:@"%g",x];
    } else if ([operand isEqual:@"/"]) {
        double x = [tempNum doubleValue]/[_textField.text doubleValue];
        _textField.text = [NSString stringWithFormat:@"%g",x];
    }
    tempNum = nil;
    operand = nil;
}


@end

