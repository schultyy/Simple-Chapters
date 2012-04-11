//
//  BasicFeedInfoSheet.m
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BasicFeedInfoSheet.h"
#import "Feed.h"

@interface BasicFeedInfoSheet()
-(void) showSheetForFeed: (Feed *) editingFeed InWindow: (NSWindow *) window;
@property (retain, readwrite) Feed *feed;
@end

@implementation BasicFeedInfoSheet

@synthesize title;

@synthesize url;

@synthesize author;

@synthesize identifer;

@synthesize feed;

static BasicFeedInfoSheet *sheet;

+(void) showSheetForFeed: (Feed *) feed InWindow: (NSWindow *) window{
    if(!sheet){
        sheet = [[BasicFeedInfoSheet alloc] initWithWindowNibName:@"BasicFeedInfoSheet"];
    }
    [sheet showSheetForFeed: feed InWindow: window];
}

-(void) showSheetForFeed: (Feed *) editingFeed InWindow: (NSWindow *) window {
    
    [self setFeed: editingFeed];
    
    [self setTitle: [feed title]];
    [self setUrl: [feed url]];
    [self setAuthor: [feed author]];
    [self setIdentifer: [feed identifier]];
    
    [NSApp beginSheet:[self window] modalForWindow:window 
        modalDelegate:self 
        didEndSelector:NULL
          contextInfo:NULL];
}

-(IBAction)saveInformations:(id)sender{
    
    [[self feed] setTitle: title];
    [[self feed] setAuthor: author];
    [[self feed] setUrl: url];
    [[self feed] setIdentifier: identifer];
    
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

-(IBAction)closeWithoutSaving:(id)sender{
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

@end
