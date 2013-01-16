//
//  JTViewController.h
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTPerson.h"

@interface JTViewController : UIViewController

@property (strong, nonatomic) NSDictionary *dictionary;

//@property (strong, nonatomic) IBOutlet JTPerson *person;

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;
@property (strong, nonatomic) IBOutlet UILabel *viewPuplishDate;
//@property (strong, nonatomic) IBOutlet UILabel *view;
@property (strong, nonatomic) IBOutlet UIWebView *viewContent;



@end
