//
//  IndexTableViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 7/14/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "IndexTableViewController.h"
#import "ModelController.h"
#import "PageViewController.h"

@interface IndexTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end

@implementation IndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"Index";
    

}
- (IBAction)doneButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    return [ModelController modelController].pageData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    NSString *previewText = [ModelController modelController].pageData[indexPath.row];
    previewText = [previewText substringToIndex: MIN(19, [previewText length])];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:18];
    cell.textLabel.text = [NSString stringWithFormat:@"Chapter %lu:   %@... ",(unsigned long)[[ModelController modelController].pageData indexOfObject:[ModelController modelController].pageData[indexPath.row]], previewText];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


    [self dismissViewControllerAnimated:YES completion:^{
                                                        DataViewController *zeroVC = [[ModelController modelController] viewControllerAtIndex:indexPath.row storyboard:self.storyboard];
                                                        NSArray *viewControllers = @[zeroVC];
        
        
        DataViewController *currentView = [[PageViewController pageViewController].pageViewController.viewControllers objectAtIndex:0];
        NSInteger currentIndex = [[ModelController modelController] indexOfViewController:currentView];
        if (indexPath.row > currentIndex) {
            [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        }
        else{
            [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
        }

    
    }];
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
