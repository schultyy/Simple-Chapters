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

@implementation SCDocument

@synthesize feed;
@synthesize entryDetailSheet;
@synthesize documentWindow;
@synthesize currentFeedEntry;
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

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    /*
     Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
     You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
     */
    //    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    //    @throw exception;
    
    return [feed saveToXml];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    /*
     Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
     You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
     If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
     */
    //    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    //    @throw exception;
    
    feed = [[Feed alloc] initWithData: data];
    
    return YES;
}

-(IBAction)showEntryDetailSheet:(id)sender{
    
    currentFeedEntry = [[FeedEntry alloc] init];
    
    [NSApp beginSheet:entryDetailSheet
            modalForWindow:documentWindow
            modalDelegate:nil
            didEndSelector:NULL
            contextInfo:NULL];
}

-(IBAction)endEntryDetailSheet:(id)sender{
    [NSApp endSheet: entryDetailSheet];
    [entryDetailSheet orderOut:sender];
}

-(IBAction)closeAndSaveEntryDetailSheet:(id)sender{
    [self endEntryDetailSheet:sender];
    [currentFeedEntry setUpdated: [NSDate date]];
    [[feed entries] addObject: currentFeedEntry];
    currentFeedEntry = nil;
    [tableView reloadData];
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
