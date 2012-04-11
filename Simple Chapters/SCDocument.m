//
//  SCDocument.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCDocument.h"

#import "Feed.h"
#import "FeedEntry.h"
#import "BasicFeedInfoSheet.h"
#import "FeedDetailSheet.h"

@implementation SCDocument

@synthesize feed;
@synthesize documentWindow;
@synthesize feedEntryArrayController;
@synthesize tableView;

- (id)init
{
    self = [super init];
    if (self) {
        feed = [[Feed alloc] init];
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"SCDocument";
}

-(void) awakeFromNib{
    [super awakeFromNib];
    [tableView setDoubleAction:@selector(doubleClick:)];
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{    
    NSData *data = [feed saveToXml];
    
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{    
    feed = [[Feed alloc] initWithData: data];
    
    return YES;
}

-(IBAction)showFeedInformationSheet:(id)sender{
    [BasicFeedInfoSheet showSheetForFeed: feed InWindow: [self documentWindow]];
}

-(IBAction)addFeedEntry:(id)sender{
    
    FeedEntry *newEntry = [[FeedEntry alloc] init];
    
    [[[self feed] entries] addObject: newEntry];
    
    [FeedDetailSheet showFeedDetailSheetForEntry:newEntry InWindow:[self documentWindow]];
    
    [feedEntryArrayController rearrangeObjects];
}

- (void)doubleClick:(id)nid{
    NSInteger index = [tableView clickedRow];
    
    id newEntry = [[feedEntryArrayController arrangedObjects] objectAtIndex:index];
    
    [FeedDetailSheet showFeedDetailSheetForEntry:newEntry InWindow:[self documentWindow]];
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
