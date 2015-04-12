//
//  Reminder.h
//  week4lab
//
//  Created by BigBadEgg on 4/9/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Reminder : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* descriptions;
@property (strong, nonatomic) NSDate*  dueDate;
@property (nonatomic) BOOL completed;

-(id)init;

-(id)initWithTitle:(NSString*) title descriptions:(NSString*) descriptions dueDate:(NSDate*) dueDate andCompleted:(BOOL) completed;

@end
