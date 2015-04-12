//
//  ReminderListViewController.h
//  week4lab
//
//  Created by BigBadEgg on 4/9/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddReminderViewController.h"
#import "EditReminderViewController.h"
#import "ReminderCell.h"

@interface ReminderListViewController : UITableViewController <addReminderProtocol, editReminderProtocol>


@property (nonatomic) int currentIndex;
@property (strong, nonatomic) NSMutableArray* currentList;
@property (strong, nonatomic) EditReminderViewController* editcontroller;


@end
