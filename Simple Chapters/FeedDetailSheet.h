//
//  FeedDetailSheet.h
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FeedEntry.h"

@interface FeedDetailSheet : NSWindowController

@property (retain, readwrite) NSString *title;

@property (retain, readwrite) NSString *identifier;

@property (retain, readwrite) NSString *link;

@property (retain, readwrite) NSString *summary;

@property (retain, readwrite) FeedEntry *entry;

+(void) showFeedDetailSheetForEntry:(FeedEntry*) feedEntry InWindow:(NSWindow *) window;

-(IBAction)saveAndClose:(id)sender;
-(IBAction)closeWithoutSaving:(id)sender;

@end
