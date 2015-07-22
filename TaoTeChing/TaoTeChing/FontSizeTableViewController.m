//
//  FontSizeTableViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 7/21/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "FontSizeTableViewController.h"
#import "SettingsManager.h"
#import "UIFont+FontSize.h"

@interface FontSizeTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *smallFontSizeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *mediumFontSizeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *largeFontSizeCell;
@property(retain)  NSIndexPath* lastIndexPath;
@end

@implementation FontSizeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Set Font Size";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[SettingsManager sharedManager]updateFontSize:indexPath.row];
    self.lastIndexPath = indexPath;
    [tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    
    // Configure the cell...
    if (indexPath.row == 0) {
        if ([indexPath compare:self.lastIndexPath] == NSOrderedSame)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.textLabel.text = @"Small";
        cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:18];
    }
    else if(indexPath.row == 1){
        if ([indexPath compare:self.lastIndexPath] == NSOrderedSame)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.textLabel.text = @"Medium";
        cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:22];
    }
    else{
        if ([indexPath compare:self.lastIndexPath] == NSOrderedSame)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.textLabel.text = @"Large";
        cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:26];
    }
    
    
    if ([UIFont fontSize]==18 && indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else if ([UIFont fontSize]==22  && indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else if ([UIFont fontSize]==26   && indexPath.row == 2) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
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
