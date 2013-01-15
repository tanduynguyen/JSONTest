//
//  JTViewController.m
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JTViewController.h"

@interface JTViewController ()

@end

@implementation JTViewController


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
    
    self.name.text = self.jTPerson.name;
    self.address.text = self.jTPerson.address;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"ddmmYYYY"];
    
    NSDate *dobData = [dateFormatter dateFromString:self.jTPerson.dob];
    
    [dateFormatter setDateFormat:@"dd/mm/YYYY"];
    self.dob.text = [dateFormatter  stringFromDate:dobData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
