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
//NSString *tempString = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)numButPressed:(UIButton *)input {
    _textField.text = [_textField.text stringByAppendingString:input.currentTitle];
}

//Fix this before subitting, it should cancel any actions aswell
- (IBAction)clearContents:(UIButton *)sender {
    _textField.text = nil;
}

- (IBAction)deleteInput:(UIButton *)input {
    _textField.text = [_textField.text substringToIndex:_textField.text.length-1];
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

//- (IBAction)add {
//    tempString = _textField.text;
//
//}


@end
