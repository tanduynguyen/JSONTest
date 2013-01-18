//
//  JTViewController.m
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JTDetailsViewController.h"

@interface JTDetailsViewController ()

@end

@implementation JTDetailsViewController

- (JTPerson *)person {
    if (!_person) {
        _person = [[JTPerson alloc] init];
    }
    return _person;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"%@ - %@", self.navigationItem.title, self.person.name];
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:@"PersonDetails"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"PersonDetails"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Name";
            cell.detailTextLabel.text = self.person.name;
            break;
            
        case 1:            
            cell.textLabel.text = @"User Name";
            cell.detailTextLabel.text = self.person.userName;
            break;
            
        case 2:
            cell.textLabel.text = @"Role";
            cell.detailTextLabel.text = self.person.role;
            break;
            
        case 3:
            cell.textLabel.text = @"Like";
            cell.detailTextLabel.text = self.person.like;
            break;
            
        case 4:
            cell.textLabel.text = @"Dislike";
            cell.detailTextLabel.text = self.person.dislike;
            break;
            
        case 5:
            cell.textLabel.text = @"Time Stamp";
           // NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            //[dateFormatter setDateFormat:@"dd/mm/YYYY"];
            cell.detailTextLabel.text = (NSString *)self.person.timeStamp;
            break;
    }
    
    [cell.detailTextLabel setNumberOfLines:0];
    [cell.detailTextLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
    return cell;
}


#define FONT_SIZE 15.0f
#define CELL_CONTENT_WIDTH 200.0f
#define CELL_CONTENT_MARGIN 10.0f

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{ 
    CGFloat height = tableView.rowHeight;    
    
    NSString *text = @"";
    
    // Get the text so we can measure it
    
    switch (indexPath.row) {
        case 0:
            text = self.person.name;
            break;
            
        case 1:
            text = self.person.userName;
            break;
            
        case 2:
            text = self.person.role;
            break;
            
        case 3:
            text = self.person.like;
            break;
            
        case 4:
            text = self.person.dislike;
            break;
            
        case 5:
            text = (NSString *)self.person.timeStamp;
            break;
    }
    
    //UILabel *content = (UILabel *)[[(UITableViewCell *)[(UITableView *)self cellForRowAtIndexPath:indexPath] contentView] viewWithTag:1];
    
    //text = content.text; //self.person.like; //[items objectAtIndex:indexPath.row];
        
    // Get a CGSize for the width and, effectively, unlimited height
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
        
    // Get the size of the text given the CGSize we just made as a constraint
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:NSLineBreakByCharWrapping];
        
    // Get the height of our measurement
    height = size.height;
    
        
    // return the height, with a bit of extra padding in
    return height + (CELL_CONTENT_MARGIN * 2);
}


@end
