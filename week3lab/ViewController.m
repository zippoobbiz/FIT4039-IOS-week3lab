//
//  ViewController.m
//  week3lab
//
//  Created by BigBadEgg on 4/12/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *motherNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthCityTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstCarTextField;
- (IBAction)clearAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"generateNemName"])
    {
        SecondScreenViewController * controller = segue.destinationViewController;
        
        NSString * newfirstname = [NSString stringWithFormat: @"%@%@",[self.firstNameTextField.text substringWithRange:NSMakeRange(0,3)],[self.lastNameTextField.text substringWithRange:NSMakeRange(0,2)]];
        
        NSString * newlastname = [NSString stringWithFormat:@"%@%@",[self.motherNameTextField.text substringWithRange:NSMakeRange(0, 2)],[self.birthCityTextField.text substringWithRange:NSMakeRange(0, 3)]];
        
        NSString * planetname = [NSString stringWithFormat:@"%@%@",[self.lastNameTextField.text substringWithRange:NSMakeRange(self.lastNameTextField.text.length - 2, 2)],self.firstCarTextField.text];

        controller.generatedName = [NSString stringWithFormat:@"%@ %@ of %@", newfirstname,newlastname,planetname];
    }
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if([self.firstNameTextField.text isEqualToString:@""])
    {
        [self.firstNameTextField becomeFirstResponder];
        [self alert:@"Please input your first name!"];
        return NO;
    }else if(self.firstNameTextField.text.length < 4)
    {
        [self.firstNameTextField becomeFirstResponder];
        [self alert:@"First name must be longer than 4 charactors"];
        return NO;
    }else if([self.lastNameTextField.text isEqualToString:@""])
    {
        [self.lastNameTextField becomeFirstResponder];
        [self alert:@"Please input your last name!"];
        return NO;
    }else if(self.lastNameTextField.text.length < 3)
    {
        [self.lastNameTextField becomeFirstResponder];
        [self alert:@"Last name must be longer than 2 charactors"];
        return NO;
    }else if([self.motherNameTextField.text isEqualToString:@""])
    {
        [self.motherNameTextField becomeFirstResponder];
        [self alert:@"Please input your mother's maiden name!"];
        return NO;
    }else if(self.motherNameTextField.text.length < 3)
    {
        [self.motherNameTextField becomeFirstResponder];
        [self alert:@"Mother's maiden name must be longer than 2 charactors"];
        return NO;
    }else if([self.birthCityTextField.text isEqualToString:@""])
    {
        [self.birthCityTextField becomeFirstResponder];
        [self alert:@"Please input the city you were born!"];
        return NO;
    }else if(self.birthCityTextField.text.length < 4)
    {
        [self.birthCityTextField becomeFirstResponder];
        [self alert:@"City's name must be longer than 3 charactors"];
        return NO;
    }else if([self.firstCarTextField.text isEqualToString:@""])
    {
        [self.firstCarTextField becomeFirstResponder];
        [self alert:@"Please input your first car's name!"];
        return NO;
    }else
    {
        return YES;
    }
    
}

-(void) alert:(NSString *)text{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:text delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

- (IBAction)clearAction:(id)sender {
    self.firstNameTextField.text = @"";
    self.lastNameTextField.text = @"";
    self.motherNameTextField.text = @"";
    self.birthCityTextField.text = @"";
    self.firstCarTextField.text = @"";
}
@end
