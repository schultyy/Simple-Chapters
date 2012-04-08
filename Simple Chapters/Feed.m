//
//  Feed.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Feed.h"
#import "FeedParserDelegate.h"

@implementation Feed

@synthesize url;

@synthesize author;

@synthesize identifier;

@synthesize title;

@synthesize updated;

-(id) initWithData:(NSData *)data{
    
    id parserDelegate = [[FeedParserDelegate alloc] init];
    id parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate: parserDelegate];
    BOOL result = [parser parse];
    if(result){
        self = [parserDelegate feed];
    }
    else
        self = nil;
    return self;
}

-(NSData *) saveToXml{
    
    NSXMLElement *root = (NSXMLElement *) [NSXMLNode elementWithName:@"feed"];
    
    [root addNamespace: [NSXMLNode namespaceWithName:@"" stringValue:@"http://www.w3.org/2005/Atom"]];
    
    [root addNamespace: [NSXMLNode namespaceWithName:@"sc" stringValue:@"http://podlove.org/simple-chapters"]];
    
    id document = [[NSXMLDocument alloc] initWithRootElement:root];
    
    [document setVersion:@"1.0"];
    [document setCharacterEncoding:@"UTF-8"];
    
    NSXMLNode *titleNode = [[NSXMLNode alloc] initWithKind:NSXMLElementKind];
    [titleNode setName:@"title"];
    [titleNode setStringValue:title];
    
    NSXMLElement *authorNode = (NSXMLElement*) [NSXMLNode elementWithName:@"author"];
    NSXMLNode *authorNameNode = [[NSXMLNode alloc] initWithKind:NSXMLElementKind];
    
    [authorNameNode setName:@"name"];
    [authorNameNode setStringValue: author];
    
    [authorNode addChild:authorNameNode];
    
    [root addChild:titleNode];
    [root addChild:authorNode];
    return [document XMLData];
}

@end
