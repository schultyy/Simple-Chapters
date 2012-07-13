//
//  PodcastDetailController.m
//  Simple Chapters
//
//  Created by Jan Schulte on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PodcastDetailController.h"
#import "Feed.h"

@implementation PodcastDetailController

@synthesize feedUrl;

@synthesize feedName;

@synthesize feedAuthor;

-(void) displayInformationsFor:(Feed *)feed withName:(NSString *)name{
    [self setFeedName: name];
    [self setFeedAuthor: [feed author]];
    [self setFeedUrl: [feed url]];
    
}


@end
