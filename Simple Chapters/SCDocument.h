//
//  SCDocument.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Feed.h"
#import "FeedEntry.h"

@interface SCDocument : NSDocument<NSTableViewDelegate>{
    NSMenu *contextMenu;
}

@property (retain) Feed *feed;

@property (retain) IBOutlet NSWindow *documentWindow;

@property (retain) IBOutlet NSArrayController *feedEntryArrayController;

@property (assign) IBOutlet NSTableView *tableView;

@property (assign) IBOutlet NSView *detailView;

-(IBAction) showFeedInformationSheet:(id)sender;

-(IBAction)addFeedEntry:(id)sender;

-(void) deleteEpisode: (id) sender;

@end
