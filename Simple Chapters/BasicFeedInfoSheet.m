//
//  BasicFeedInfoSheet.m
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BasicFeedInfoSheet.h"

@interface BasicFeedInfoSheet()
-(void) showSheetForWindow: (NSWindow *)window;
@end

@implementation BasicFeedInfoSheet

static BasicFeedInfoSheet *sheet;

+(void) showSheetForWindow:(NSWindow *)window{
    if(!sheet){
        sheet = [[BasicFeedInfoSheet alloc] initWithWindowNibName:@"BasicFeedInfoSheet"];
    }
    [sheet showSheetForWindow:window];
}

-(void) showSheetForWindow:(NSWindow *)window{
    [NSApp beginSheet:[self window] modalForWindow:window 
        modalDelegate:self 
        didEndSelector:NULL
          contextInfo:NULL];
}

-(IBAction)saveInformations:(id)sender{
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

-(IBAction)closeWithoutSaving:(id)sender{
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

@end
