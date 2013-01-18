//
//  JTViewController.m
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JTDetailsViewController.h"

@interface JTViewController ()

@end

@implementation JTViewController

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
    
    self.viewName.text = self.person.name;    
    self.viewUserName.text = self.person.userName;
    self.viewTimeStamp.text = self.person.timeStamp;
    self.viewRole.text = self.person.role;
    self.viewLike.text = self.person.like;
    self.viewDislike.text = self.person.dislike;
    
    
    //NSMutableString *mu = [NSMutableString stringWithString:person.content];
    
    
   // [self.viewContent loadHTMLString:person.content baseURL:nil];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"ddmmYYYY"];
//    
//    NSDate *dobData = [dateFormatter dateFromString:self.person.dob];
//    
//    [dateFormatter setDateFormat:@"dd/mm/YYYY"];
//    self.dob.text = [dateFormatter  stringFromDate:dobData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
