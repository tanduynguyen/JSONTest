//
//  JTTableViewController.m
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JTTableViewController.h"
#import "JTPerson.h"
#import "JTDetailsViewController.h"
#import "JTDownloader.h"
#import "AFNetworking.h"
#import "JTAppApiClient.h"

@interface JTTableViewController ()


@property (strong) NSMutableArray *entries;
@property (strong) NSMutableArray *results;

@property (nonatomic, strong) JTDownloader *downloader;

@end

@implementation JTTableViewController


- (JTDownloader *)downloader
{
    if (!_downloader) {
        _downloader = [[JTDownloader alloc] init];
    }
    
    return _downloader;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//    NSURL *url = [NSURL URLWithString:@"https://search.twitter.com/search.json?q=ipad"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    AFJSONRequestOperation *operation = [AFJSONRequestOperation
//                                         JSONRequestOperationWithRequest:request
//                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id json) {
//                                             NSLog(@"Tweets: %@", [json valueForKeyPath:@"results"]);
//                                         } failure:nil];
//    
//    [operation start];
    
    [[JTAppApiClient sharedInstance] getPath:@"/api/1/databases/2359media/collections/user?apiKey=50bc7070e4b07d292a90b92b" parameters:nil
                                     success:^(AFHTTPRequestOperation *operation, id response) {
                                         NSLog(@"Response: %@", response);
                                         
                                         NSMutableArray *results = [NSMutableArray array];
                                         if ([response isKindOfClass:[NSData class]]) {
                                             NSError *error;
                                             
                                             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
                                             
                                             if (error) {
                                                 NSLog(@"%@", error);
                                                 return;
                                             }
                                             
                                             for (id obj in json)
                                             {
                                                 if ([obj isKindOfClass:[NSDictionary class]]) {
                                                     JTPerson *p = [[JTPerson alloc] initWithDictionary:(NSDictionary *)obj];
                                                     [results addObject:p];
                                                 }
                                             }
                                             self.results = results;
                                             
                                             self.filteredArray = [NSMutableArray arrayWithCapacity:[self.results count]];
                                             
                                             [self.tableView reloadData];                                             
                                             self.tableView.scrollEnabled = YES;
                                         }
                                     }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"Error fetching beers!");
                                         NSLog(@"%@", error);
                                     }];
    
    //[self.downloader loadData];
    
    //[self.downloader addObserver:self forKeyPath:@"downloadFinish" options:NSKeyValueObservingOptionInitial context:nil];
    

}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"downloadFinish"] && self.downloader.downloadFinish == YES) {
//        NSData *data = [self.downloader.data copy];
//        
//        NSError *error;
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        
//        self.entries = [[[[json objectForKey:@"responseData"] objectForKey:@"feed"] objectForKey:@"entries"] mutableCopy];
//              
//        [self.tableView reloadData];
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int rows = 0;
    // Return the number of rows in the section.
    
    if (tableView == self.tableView) {
        rows = self.results.count;
    } else if(tableView == self.searchDisplayController.searchResultsTableView){
        rows = self.filteredArray.count;
    }
    
    return rows;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[JTViewController class]]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        id obj = [self.results objectAtIndex:indexPath.row];
    
        if ([obj isKindOfClass:[JTPerson class]]) {                        
            JTViewController *destinationVC = (JTViewController *)segue.destinationViewController;
            destinationVC.person = obj;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:@"My Table View Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"My Table View Cell"];
    }
    
    // Configure the cell...
    id obj;
    if (tableView == self.tableView) {        
        obj = [self.results objectAtIndex:indexPath.row];
    } else if(tableView == self.searchDisplayController.searchResultsTableView){
        obj = [self.filteredArray objectAtIndex:indexPath.row];
    }    
        
    if ([obj isKindOfClass:[JTPerson class]]) {
        JTPerson *p = obj;        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", p.name];
    }
    
    return cell;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    self.filteredArray = [NSMutableArray arrayWithArray:[self.results filteredArrayUsingPredicate:predicate]];
}


#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
}



@end
