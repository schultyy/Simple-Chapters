//
//  EpisodeDetailController.h
//  Simple Chapters
//
//  Created by Jan Schulte on 16.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FeedDetailController.h"
#import "FeedEntry.h"

@interface EpisodeDetailController : NSWindowController

@property (retain) IBOutlet FeedDetailController *detailViewController;

@property (retain) IBOutlet NSView *feedDetailView;

-(IBAction)saveAndClose:(id)sender;

-(IBAction)closeWithoutSaving:(id)sender;

+(void) showEpisodeDetailSheetForEntry: (FeedEntry *) feedEntry inWindow: (NSWindow *) window;

@end
