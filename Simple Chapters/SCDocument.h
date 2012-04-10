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

@interface SCDocument : NSDocument

@property (retain) Feed *feed;

@property (retain) IBOutlet NSWindow *documentWindow;

@property (retain) FeedEntry *currentFeedEntry;

-(IBAction) showFeedInformationSheet:(id)sender;

@end
