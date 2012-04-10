//
//  FeedDetailSheet.m
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedDetailSheet.h"

@interface FeedDetailSheet()
-(void) showFeedDetailSheetForWindow:(NSWindow *) window;
@end

@implementation FeedDetailSheet

static FeedDetailSheet *sheet;

+(void) showFeedDetailSheetForWindow:(NSWindow *) window{
    if(!sheet){
        sheet = [[FeedDetailSheet alloc] initWithWindowNibName:@"FeedDetailSheet"];
    }
    [sheet showFeedDetailSheetForWindow:window];
}

-(void) showFeedDetailSheetForWindow:(NSWindow *) window{
    [NSApp beginSheet:[self window]
       modalForWindow: window modalDelegate:self didEndSelector:NULL contextInfo:NULL];
}

-(IBAction)saveAndClose:(id)sender{
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

-(IBAction)closeWithoutSaving:(id)sender{
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

@end
