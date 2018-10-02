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

//This method will take any number buton pressed and append the content into the textfield.
- (IBAction)numButPressed:(UIButton *)input {
    _textField.text = [_textField.text stringByAppendingString:input.currentTitle];
}

//This method is for the "C" button
//If clicked, it will clear the textfield.
//If the textfield is empty when it is clicked, it will cancel any operation that may have been clicked
- (IBAction)clearContents:(UIButton *)sender {
    if (_textField.text != nil) {
        _textField.text = nil;
    } else {
        tempNum = nil;
        operand = nil;
    }
}

//This is the method for the "Del" key.
//It will remove the last number from the textfield.
- (IBAction)deleteInput:(UIButton *)input {
    if (_textField.text.length >= 1) {
        _textField.text = [_textField.text substringToIndex:_textField.text.length-1];
    }
}

//This is the method for "x^2"
//It will square whatever is in the textfield.
- (IBAction)xSquared:(UIButton *)sender {
    double x = [_textField.text doubleValue];
    x = pow(x, 2);
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

//This is the method for "x^3"
//It will cube whatever is in the textfield.
- (IBAction)xCubed:(UIButton *)sender {
    double x = [_textField.text doubleValue];
    x = pow(x, 3);
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

//This is the method for "√".
//It will get the square rot of whatever is in the textfield.
- (IBAction)squareRootOfX:(UIButton *)sender {
    double x = [_textField.text doubleValue];
    x = sqrt(x);
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

//This is the method for "1/x"
//It will divide 1 by whatever is in the textfield.
- (IBAction)oneOverX {
    double x = [_textField.text doubleValue];
    x = 1 / x;
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

//This is the method for "+"
//If no operation has been selected yet, it will take the contents of the textfield and put them in a temporary variable to hold, as well as putting the 'operand' variable equal to '+'.
//If this is the second click of the same operation before the '=' button is clicked, it will coplete the operation and set the tempNum variable to the answer. This allows users to do multiple operations in sequence without having to hit the '=' key, such as user inputs like '1+1+1+1' before hitting '=' will work and give the user the correct answer.
//If this is the second click, but of different operations, it will call the 'computeEquation' function to do the equation before functioning, this allows users to do inputs such as '1+3-4x7' in sequence without hitting the '=' key, and will give the correct answer.
//All methods requiring multiple number inputs function in a similar fashion, with mild tweaks as needed.
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
    } else if ([operand  isEqual: @"-"]){
        double x = [tempNum doubleValue] - [_textField.text doubleValue];
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    } else {
        [self computeEquation];
        tempNum = _textField.text;
        _textField.text = nil;
        operand = @"-";
    }
}
- (IBAction)xPowY {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"^";
        _textField.text = nil;
    } else if ([operand isEqual: @"^"]){
        double x = pow([tempNum doubleValue] ,[_textField.text doubleValue]);
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    } else {
        [self computeEquation];
        tempNum = _textField.text;
        _textField.text = nil;
        operand = @"^";
    }
}

- (IBAction)multiply {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"x";
        _textField.text = nil;
    } else if ([operand isEqual: @"x"]){
        double x = [tempNum doubleValue]*[_textField.text doubleValue];
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    } else {
        [self computeEquation];
        tempNum = _textField.text;
        _textField.text = nil;
        operand = @"x";
    }
}

- (IBAction)divide {
    if (tempNum == nil) {
        tempNum = _textField.text;
        operand = @"/";
        _textField.text = nil;
    } else if ([operand isEqual: @"/"]){
        double x = [tempNum doubleValue]/[_textField.text doubleValue];
        tempNum = [NSString stringWithFormat:@"%g",x];
        _textField.text = nil;
    } else {
        [self computeEquation];
        tempNum = _textField.text;
        _textField.text = nil;
        operand = @"/";
    }
}

//This is the '±' method.
//It changes whatever is in the textfield from positive to negative and negative to positive.
- (IBAction)plusEquals {
    double x = [_textField.text doubleValue];
    x = -x;
    _textField.text = [NSString stringWithFormat:@"%g",x];
}

//This is the '=' method.
//It acts as a completion for the methods which require 2 numerical inputs. It simply takes the first input, stored in 'tempNum' and the second input, stored in the textfield, and checks what operator should go between them, which is stored in 'operand', then preforms the calculation and puts it in the textfield, then clears 'tempNum' and 'operand'.
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

