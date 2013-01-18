//
//  JTTableViewController.h
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>


@property (strong, nonatomic) NSMutableArray *filteredArray;


@end
