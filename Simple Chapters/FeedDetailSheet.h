//
//  FeedDetailSheet.h
//  Simple Chapters
//
//  Created by Jan Schulte on 10.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FeedDetailSheet : NSWindowController

+(void) showFeedDetailSheetForWindow: (NSWindow *) window;

-(IBAction)saveAndClose:(id)sender;
-(IBAction)closeWithoutSaving:(id)sender;

@end