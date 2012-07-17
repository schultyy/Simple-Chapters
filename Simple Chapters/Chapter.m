//
//  Chapter.m
//  Simple Chapters
//
//  Created by Jan Schulte on 17.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Feed.h"
#import "Chapter.h"

@implementation Chapter

@synthesize start;

@synthesize title;

@synthesize url;

-(NSXMLElement *) saveToXml;{

    id prefix = [Feed xmlNamespacePrefix];
    
    NSXMLElement *rootEntry = [[NSXMLElement alloc] initWithKind:NSXMLElementKind];
    
    [rootEntry setName: [prefix stringByAppendingString:@":chapter"]];
    
    [rootEntry addAttribute: [NSXMLNode attributeWithName:@"start" stringValue:start]];
    [rootEntry addAttribute: [NSXMLNode attributeWithName:@"title" stringValue:title]];
    if(url)
        [rootEntry addAttribute: [NSXMLNode attributeWithName:@"url" stringValue:url]];
    
    return rootEntry;
}

@end
