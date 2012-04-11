//
//  BasicFeedInfoSheet.h
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Feed.h"

@interface BasicFeedInfoSheet : NSWindowController

+(void) showSheetForFeed: (Feed *) feed InWindow: (NSWindow *) window;

@property (retain, readwrite) NSString *title;

@property (retain, readwrite) NSString *author;

@property (retain, readwrite) NSString *identifer;

@property (retain, readwrite) NSString *url;

-(IBAction) saveInformations:(id) sender;
-(IBAction) closeWithoutSaving:(id)sender;

@end
