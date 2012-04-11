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

@interface SCDocument : NSDocument<NSTableViewDelegate>

@property (retain) Feed *feed;

@property (retain) IBOutlet NSWindow *documentWindow;

@property (retain) IBOutlet NSArrayController *feedEntryArrayController;

@property (assign) IBOutlet NSTableView *tableView;

- (void)doubleClick:(id)nid;

-(IBAction) showFeedInformationSheet:(id)sender;

-(IBAction)addFeedEntry:(id)sender;

@end
