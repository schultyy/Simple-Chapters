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

@implementation SCDocument

@synthesize feed;
@synthesize documentWindow;
@synthesize feedEntryArrayController;
@synthesize tableView;
@synthesize detailView;

- (id)init
{
    self = [super init];
    if (self) {
        feed = [[Feed alloc] init];
        contextMenu = [[NSMenu alloc] initWithTitle:@"Menu"];
        
        NSMenuItem *deleteItem = [[NSMenuItem alloc] initWithTitle:@"Delete episode" action:@selector(deleteEpisode:) keyEquivalent:@""];
        
        [deleteItem setTarget: self];
        
        [contextMenu addItem: deleteItem];
    }
    return self;
}

-(void) awakeFromNib{
    [super awakeFromNib];
    
    [tableView setMenu: contextMenu];
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"SCDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

-(void) deleteEpisode: (id) sender{
    
    NSInteger selectedIndex = [tableView selectedRow];
    [feedEntryArrayController removeObjectAtArrangedObjectIndex:selectedIndex];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{    
    NSData *data = [feed saveToXml];
    
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{    
    feed = [[Feed alloc] initWithData: data];

    [tableView reloadData];
    return YES;
}

-(IBAction)showFeedInformationSheet:(id)sender{
    [BasicFeedInfoSheet showSheetForFeed: feed InWindow: [self documentWindow]];
}

-(IBAction)addFeedEntry:(id)sender{
    
    FeedEntry *newEntry = [[FeedEntry alloc] init];
    
    NSDate *date = [[NSDate alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MMM.yyyy HH:mm:ss"];
    
    id dateString = [dateFormatter stringFromDate: date];
    
    id title = [@"New Episode - " stringByAppendingString: dateString];
    
    [newEntry setTitle: title];
    
    [[[self feed] entries] addObject: newEntry];
    
    [feedEntryArrayController rearrangeObjects];
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
