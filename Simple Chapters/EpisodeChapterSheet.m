//
//  EpisodeChapterSheet.m
//  Simple Chapters
//
//  Created by Jan Schulte on 22.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EpisodeChapterSheet.h"
#import "FeedEntry.h"

@interface EpisodeChapterSheet()
-(void) showEpisodeChapterSheetForEntry: (FeedEntry *) feedEntry InWindow: (NSWindow *) window;
@end

@implementation EpisodeChapterSheet

static EpisodeChapterSheet *sheet;

+(void) showEpisodeChapterSheetForEntry:(FeedEntry *)feedEntry InWindow:(NSWindow *)window{
    if(!sheet){
        sheet = [[EpisodeChapterSheet alloc] initWithWindowNibName:@"EpisodeChapterSheet"];
    }
    [sheet showEpisodeChapterSheetForEntry:feedEntry InWindow:window];
}

-(void) showEpisodeChapterSheetForEntry:(FeedEntry *)feedEntry InWindow:(NSWindow *)window{
    [NSApp beginSheet: [self window] modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo: NULL];
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
