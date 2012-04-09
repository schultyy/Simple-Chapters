//
//  FeedParserDelegate.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
#import "FeedEntry.h"

@interface FeedParserDelegate : NSObject<NSXMLParserDelegate>{
    NSMutableString *buffer;
    NSInteger state;
    FeedEntry *currentEntry;
}

extern NSInteger const ParserStateHeader;
extern NSInteger const ParserStateEntry;

@property (retain) Feed *feed;

- (void)parserDidStartDocument:(NSXMLParser *)parser;

- (void)parserDidEndDocument:(NSXMLParser *)parser;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

@end
