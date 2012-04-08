//
//  FeedEntry.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedEntry.h"
#import "Enclosure.h"

@implementation FeedEntry

@synthesize enclosure;

@synthesize identifier;

@synthesize link;

@synthesize summary;

@synthesize title;

@synthesize updated;

-(id) init{
    self = [super init];
    if(self){
        enclosure = [[Enclosure alloc] init];
    }
    return self;
}

@end
