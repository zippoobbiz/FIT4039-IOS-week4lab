//
//  EditReminderViewController.m
//  week4lab
//
//  Created by BigBadEgg on 4/9/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "EditReminderViewController.h"

@interface EditReminderViewController ()

@end

@implementation EditReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set all details of a reminder
    _titleLabel.text = _currentReminder.title;
    _descriptionLabel.text = _currentReminder.descriptions;
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat =@"yyyy-MM-dd";
    
    _dueDateLabel.text = [dateFormatter stringFromDate:_currentReminder.dueDate];
    [_completedSwitch setOn:_currentReminder.completed];
    
    //create save button by coding
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
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

- (IBAction)switchAction:(id)sender {
    
  
}

- (IBAction)save:(id)sender{
    
    //get the status of switch
    if(_completedSwitch.on)
    {
        _currentReminder.completed = YES;
    }else{
        _currentReminder.completed = NO;
    }
    
    //call editReminder by delegate
    [self.delegate editReminder:_currentReminder];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
