//
//  Feed.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Feed.h"
#import "FeedEntry.h"
#import "FeedParserDelegate.h"

@implementation Feed

@synthesize url;

@synthesize author;

@synthesize identifier;

@synthesize title;

@synthesize updated;

@synthesize entries;

-(id) init{
    self = [self initWithData:nil];
    return self;
}

-(id) initWithData:(NSData *)data{
    self = [super init];
    if(self) {
        
        entries = [[NSMutableArray alloc] init];
        
        id parserDelegate = [[FeedParserDelegate alloc] init];
        id parser = [[NSXMLParser alloc] initWithData:data];
        [parser setDelegate: parserDelegate];
        BOOL result = [parser parse];
        if(result){
            self = [parserDelegate feed];
        }
    }
    
    return self;
}

-(NSData *) saveToXml{
    
    NSXMLElement *root = [NSXMLElement elementWithName:@"feed"];
    
    [root addNamespace: [NSXMLNode namespaceWithName:@"" stringValue:@"http://www.w3.org/2005/Atom"]];
    
    id namespace = [Feed xmlNamespace];
    
    id namespacePrefix = [Feed xmlNamespacePrefix];
    
    [root addNamespace: [NSXMLNode namespaceWithName:namespacePrefix stringValue: namespace]];
    
    id document = [[NSXMLDocument alloc] initWithRootElement:root];
    
    [document setVersion:@"1.0"];
    [document setCharacterEncoding:@"UTF-8"];
    [document setStandalone:YES];
    
    NSXMLNode *titleNode = [[NSXMLNode alloc] initWithKind:NSXMLElementKind];
    [titleNode setName:@"title"];
    [titleNode setStringValue:title];
    
    NSXMLElement *authorNode = (NSXMLElement*) [NSXMLNode elementWithName:@"author"];
    NSXMLNode *authorNameNode = [[NSXMLNode alloc] initWithKind:NSXMLElementKind];
    
    [authorNameNode setName:@"name"];
    [authorNameNode setStringValue: author];
    
    [authorNode addChild:authorNameNode];
    
    NSXMLElement *linkNode = [[NSXMLElement alloc] initWithName:@"link"];
    [linkNode addAttribute: [NSXMLNode attributeWithName:@"href" stringValue:url]];
    
    NSXMLNode *identifierNode = [[NSXMLNode alloc] initWithKind:NSXMLElementKind];
    [identifierNode setName:@"id"];
    [identifierNode setStringValue:identifier];
    
    [root addChild: titleNode];
    [root addChild: authorNode];
    [root addChild: linkNode];
    [root addChild: identifierNode];
    
    for (int i = 0; i < [entries count]; i++) {
        FeedEntry *obj = [entries objectAtIndex:i];
        
        [root addChild: [obj saveToXml]];
    }
    
    return [document XMLData];
}

+(NSString*) xmlNamespace{
    return @"http://podlove.org/simple-chapters";
}

+(NSString*) xmlNamespacePrefix{
    return @"sc";
}

@end

