//
//  EditReminderViewController.h
//  week4lab
//
//  Created by BigBadEgg on 4/9/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@protocol editReminderProtocol <NSObject>

-(void)editReminder:(Reminder *)reminder;

@end

@interface EditReminderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;
@property (weak, nonatomic) IBOutlet UISwitch *completedSwitch;

@property (strong, nonatomic) Reminder* currentReminder;

- (IBAction)switchAction:(id)sender;
- (IBAction)save:(id)sender;

@property (weak, nonatomic) id<editReminderProtocol> delegate;

@end
