//
//  ReminderListViewController.m
//  week4lab
//
//  Created by BigBadEgg on 4/9/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "ReminderListViewController.h"

@interface ReminderListViewController ()

@end



@implementation ReminderListViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.currentList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.currentList count];
}

- (void)addReminder:(Reminder *)reminder{
    [self.currentList addObject:reminder];
    self.currentList = [[NSMutableArray alloc] initWithArray:[self.currentList sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Reminder*)a dueDate];
        NSDate *second = [(Reminder*)b dueDate];
        return [first compare:second];
    }]];
    [self.tableView reloadData];
}

- (void)editReminder:(Reminder *)reminder{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"addReminder"])
    {
        AddReminderViewController * controller = segue.destinationViewController;
        controller.delegate = self;
    }else if([segue.identifier isEqualToString:@"editReminder"]){
        _editcontroller = segue.destinationViewController;
        _editcontroller.delegate = self;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReminderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReminderCell" forIndexPath:indexPath];
    Reminder* r = [self.currentList objectAtIndex:indexPath.row];
    cell.titleLabel.text = [[NSString alloc] initWithFormat:@"Title: %@",r.title];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.DateFormat =@"yyyy-MM-dd";
    cell.dueDateLabel.text = [[NSString alloc] initWithFormat:@"Due date: %@",[dateFormatter stringFromDate:r.dueDate]];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did select at %ld",indexPath.row);
    self.currentIndex = indexPath.row;
    _editcontroller.currentReminder = [self.currentList objectAtIndex:indexPath.row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
