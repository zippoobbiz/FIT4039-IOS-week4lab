//
//  Reminder.m
//  week4lab
//
//  Created by BigBadEgg on 4/9/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

-(id)init{
    return self;
}

-(id)initWithTitle:(NSString *)title descriptions:(NSString *)descriptions dueDate:(NSDate *)dueDate andCompleted:(BOOL)completed
{
    if(self = [super init])
    {
        self.title = title;
        self.descriptions = descriptions;
        self.dueDate = dueDate;
        self.completed = completed;
    }
    
    return self;
}

@end
