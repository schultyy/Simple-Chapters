//
//  FeedDetailSheet.m
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedDetailController.h"
#import "FeedEntry.h"


@implementation FeedDetailController

@synthesize title;

@synthesize link;

@synthesize identifier;

@synthesize summary;

@synthesize entry;

@synthesize fileLink;


-(void) showFeedDetailSheetForEntry:(FeedEntry*) feedEntry InWindow:(NSWindow *) window{
    
    [self setTitle: [feedEntry title]];
    [self setLink: [feedEntry link]];
    [self setIdentifier: [feedEntry identifier]];
    [self setSummary: [feedEntry summary]];
    [self setFileLink: [[feedEntry enclosure] href]];
    
    [self setEntry: feedEntry];
}

-(IBAction)saveAndClose:(id)sender{
    
    [entry setTitle: title];
    [entry setLink: link];
    [entry setIdentifier: identifier];
    [entry setSummary: summary];
    [[entry enclosure] setHref:fileLink];
    
}

-(IBAction)closeWithoutSaving:(id)sender{

}

@end
