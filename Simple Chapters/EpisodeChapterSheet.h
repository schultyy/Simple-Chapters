//
//  EpisodeChapterSheet.h
//  Simple Chapters
//
//  Created by Jan Schulte on 22.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FeedEntry.h"
#import "Enclosure.h"

@interface EpisodeChapterSheet : NSWindowController

+(void) showEpisodeChapterSheetForEntry: (FeedEntry *) feedEntry InWindow: (NSWindow *) window;

-(void) saveAndClose: (id) sender;
-(void) closeWithoutSaving: (id) sender;

@end
