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

@synthesize timeStamp = _timeStamp;

- (void) setTimeStamp:(NSDate *)timeStamp
{
    if (!_timeStamp) {
        _timeStamp = [[NSDate alloc] init];
    }
    _timeStamp = timeStamp;
}

- (id)initWithDictionary:(NSDictionary *)personDictionary
{
    self = [super init];
    
    if (self) {
        self.name = [personDictionary objectForKey:@"name"];
        self.userName = [personDictionary objectForKey:@"userName"];
        self.role = [personDictionary objectForKey:@"role"];
        self.like = [personDictionary objectForKey:@"like"];
        self.dislike = [personDictionary objectForKey:@"dislike"];        
        self.timeStamp = [personDictionary objectForKey:@"timeStamp"];
        
        
//        self.title = [personDictionary objectForKey:@"title"];
//        self.content = [personDictionary objectForKey:@"content"];
//        self.content = [self.content stringByReplacingOccurrencesOfString:@"<src=\"//" withString:@"<src=\"http://"];
//        self.publishDate = [personDictionary objectForKey:@"publishedDate"];
//        self.dob = [personDictionary objectForKey:@"dob"];
    }
    
    return self;
}

@end
