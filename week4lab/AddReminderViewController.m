//
//  AddReminderViewController.m
//  week4lab
//
//  Created by BigBadEgg on 4/9/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(submitButton:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)submitButton:(id)sender {
    
    NSString* title = self.titleTextField.text;
    NSString* description = self.descriptionTextField.text;
    
    if (!title||!description)
    {
        NSLog(@"NO INPUT.");
    }
    else
    {
        if ([title length] == 0)
        {
            [self.titleTextField becomeFirstResponder];
            [self alert:@"Please input title!"];
            NSLog(@"NO Title.");
        }
        else if([description length] == 0)
        {
            [self.descriptionTextField becomeFirstResponder];
            [self alert:@"Please input description!"];
            NSLog(@"NO Description.");
        }else{
            NSDate* date = self.dueDatePicker.date;
            BOOL completed = NO;
            
            Reminder *reminder = [[Reminder alloc] initWithTitle:title descriptions:description dueDate:date andCompleted:completed];
            [self.delegate addReminder:reminder];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

-(void) alert:(NSString *)text{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:text delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

@end
