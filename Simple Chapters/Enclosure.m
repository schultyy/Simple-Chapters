//
//  Enclosure.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Enclosure.h"

@implementation Enclosure

@synthesize href;

@synthesize length;

@synthesize rel;

@synthesize type;

-(NSXMLElement *) saveToXml{
    NSXMLElement *root = [[NSXMLElement alloc] initWithKind:NSXMLElementKind];
    [root setName: @"link"];
    
    [root addAttribute: [NSXMLNode attributeWithName:@"rel" stringValue: rel]];
    [root addAttribute: [NSXMLNode attributeWithName:@"type" stringValue:type]];
    [root addAttribute: [NSXMLNode attributeWithName:@"length" stringValue: [length stringValue]]];
    [root addAttribute: [NSXMLNode attributeWithName:@"href" stringValue: href]];
    return root;
}

@end
