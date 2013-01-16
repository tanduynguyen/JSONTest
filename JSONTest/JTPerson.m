//
//  JTPerson.m
//  JSONTest
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JTPerson.h"

@interface JTPerson()


@end

@implementation JTPerson



- (id)initWithDictionary:(NSDictionary *)personDictionary
{
    self = [super init];
    
    if (self) {
        self.title = [personDictionary objectForKey:@"title"];
        self.content = [personDictionary objectForKey:@"content"];
        self.publishDate = [personDictionary objectForKey:@"publishedDate"];
     //   self.dob = [personDictionary objectForKey:@"dob"];
    }
    
    return self;
}

@end
