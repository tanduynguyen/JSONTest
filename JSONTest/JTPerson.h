//
//  JTPerson.h
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTPerson : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *publishDate;
@property (nonatomic,strong) NSString *link;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *category;

- (id)initWithDictionary:(NSDictionary *)personDictionary;

@end
