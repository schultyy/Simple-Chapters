//
//  FeedDetailSheet.m
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedDetailSheet.h"
#import "FeedEntry.h"

@interface FeedDetailSheet()
-(void) showFeedDetailSheetForEntry:(FeedEntry*) feedEntry InWindow:(NSWindow *) window;
@end

@implementation FeedDetailSheet

@synthesize title;

@synthesize link;

@synthesize identifier;

@synthesize summary;

@synthesize entry;

@synthesize fileLink;

static FeedDetailSheet *sheet;

+(void) showFeedDetailSheetForEntry:(FeedEntry*) feedEntry InWindow:(NSWindow *) window{
    if(!sheet){
        sheet = [[FeedDetailSheet alloc] initWithWindowNibName:@"FeedDetailSheet"];
    }
    [sheet showFeedDetailSheetForEntry:feedEntry InWindow:window];
}

-(void) showFeedDetailSheetForEntry:(FeedEntry*) feedEntry InWindow:(NSWindow *) window{
    
    [self setTitle: [feedEntry title]];
    [self setLink: [feedEntry link]];
    [self setIdentifier: [feedEntry identifier]];
    [self setSummary: [feedEntry summary]];
    [self setFileLink: [[feedEntry enclosure] href]];
    
    [self setEntry: feedEntry];
    
    [NSApp beginSheet:[self window]
       modalForWindow: window modalDelegate:self didEndSelector:NULL contextInfo:NULL];
}

-(IBAction)saveAndClose:(id)sender{
    
    [entry setTitle: title];
    [entry setLink: link];
    [entry setIdentifier: identifier];
    [entry setSummary: summary];
    [[entry enclosure] setHref:fileLink];
    
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

-(IBAction)closeWithoutSaving:(id)sender{
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

@end
