//
//  FeedEntry.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Feed.h"
#import "FeedEntry.h"
#import "Enclosure.h"
#import "Chapter.h"

@implementation FeedEntry

@synthesize enclosure;

@synthesize identifier;

@synthesize link;

@synthesize summary;

@synthesize title;

@synthesize updated;

@synthesize chapters;

-(id) init{
    self = [super init];
    if(self){
        enclosure = [[Enclosure alloc] init];
        chapters = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSXMLElement *) saveToXml{
    NSXMLElement *rootEntry = [[NSXMLElement alloc] initWithKind:NSXMLElementKind];
    
    [rootEntry setName:@"entry"];
    
    NSXMLNode *titleNode = [NSXMLNode elementWithName:@"title" stringValue:title];
    NSXMLNode *idNode = [NSXMLNode elementWithName:@"id" stringValue:identifier];
    NSXMLElement *linkNode = [NSXMLElement elementWithName:@"link"];
    [linkNode addAttribute: [NSXMLNode attributeWithName:@"href" stringValue:link]];
    NSXMLNode *summaryNode = [NSXMLNode elementWithName:@"summary" stringValue:summary];
    NSXMLNode *updatedNode = [NSXMLNode elementWithName:@"updated" stringValue:[updated description]];
    
    NSString *nsPrefix = [Feed xmlNamespacePrefix];
    
    id chapterStr = [nsPrefix stringByAppendingString:@":chapters"];
    
    NSXMLElement *chaptersNode = [NSXMLElement elementWithName: chapterStr URI: [Feed xmlNamespace] ];
    [chaptersNode addAttribute: [NSXMLNode attributeWithName:@"version" stringValue:@"1.0"]];
    
    for(int i = 0; i < [chapters count]; i++)
    {
        Chapter *c = [chapters objectAtIndex:i];
        [chaptersNode addChild:[c saveToXml]];
    }
    
    NSXMLElement *enclosureElement = [enclosure saveToXml];
    
    [rootEntry addChild: titleNode];
    [rootEntry addChild: idNode];
    [rootEntry addChild: linkNode];
    [rootEntry addChild: summaryNode];
    [rootEntry addChild: updatedNode];
    [rootEntry addChild: enclosureElement];
    [rootEntry addChild: chaptersNode];
    
    return rootEntry;
}

@end
