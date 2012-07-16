//
//  EpisodeDetailController.m
//  Simple Chapters
//
//  Created by Jan Schulte on 16.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EpisodeDetailController.h"
#import "FeedDetailController.h"
#import "FeedEntry.h"

@interface EpisodeDetailController()
-(void) showEpisodeDetailSheetForEntry: (FeedEntry *) feedEntry inWindow: (NSWindow *) window;
@end

@implementation EpisodeDetailController

@synthesize detailViewController;

@synthesize feedDetailView;

-(void) awakeFromNib{
    [super awakeFromNib];
    
    id view = [detailViewController view];
    
    [self setFeedDetailView: view];
}

-(id) initWithWindowNibName:(NSString *)windowNibName{
    self = [super initWithWindowNibName:windowNibName];
    
    if(self){
        detailViewController = [[FeedDetailController alloc] initWithNibName:@"FeedDetailView" bundle:nil];
    }
    
    return self;
}

static EpisodeDetailController *sheet;

+(void) showEpisodeDetailSheetForEntry: (FeedEntry *) feedEntry inWindow: (NSWindow *) window
{
    if(!sheet)
    {
        sheet = [[EpisodeDetailController alloc] initWithWindowNibName:@"EpisodeDetailSheet"];
    }
    
    [sheet showEpisodeDetailSheetForEntry:feedEntry inWindow:window];
}

-(void) showEpisodeDetailSheetForEntry:(FeedEntry *)feedEntry inWindow:(NSWindow *)window{

    [NSApp beginSheet: [self window] modalForWindow: window modalDelegate:self didEndSelector:NULL contextInfo:NULL];
}

-(IBAction)saveAndClose:(id)sender{
    [NSApp endSheet: [self window]];
    [[self window] orderOut: self];
}

-(IBAction)closeWithoutSaving:(id)sender{
    [NSApp endSheet:[self window]];
    [[self window] orderOut:self];
}

@end
