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
#import "FeedDetailController.h"

@interface SCDocument : NSDocument<NSTableViewDelegate>

@property (retain) Feed *feed;

@property (retain) IBOutlet NSWindow *documentWindow;

@property (retain) IBOutlet NSArrayController *feedEntryArrayController;

@property (assign) IBOutlet NSTableView *tableView;

@property (assign) IBOutlet NSView *detailView;

@property (retain) FeedDetailController *detailController;

-(IBAction) showFeedInformationSheet:(id)sender;

-(IBAction)addFeedEntry:(id)sender;

-(void) showFeedInformations: (id) sender;

@end
