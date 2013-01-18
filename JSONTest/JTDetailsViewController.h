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

@property (strong, nonatomic) JTPerson *person;

@property (strong, nonatomic) IBOutlet UILabel *viewName;
@property (strong, nonatomic) IBOutlet UILabel *viewUserName;
//@property (strong, nonatomic) IBOutlet UILabel *view;
//@property (strong, nonatomic) IBOutlet UIWebView *viewContent;
@property (strong, nonatomic) IBOutlet UILabel *viewTimeStamp;
@property (strong, nonatomic) IBOutlet UILabel *viewRole;
@property (strong, nonatomic) IBOutlet UILabel *viewLike;
@property (strong, nonatomic) IBOutlet UILabel *viewDislike;



@end
