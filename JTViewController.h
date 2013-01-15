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

@property (strong, nonatomic) IBOutlet JTPerson *jTPerson;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *dob;


@end
