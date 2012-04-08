//
//  FeedParserDelegate.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedParserDelegate.h"
#import "Feed.h"

@implementation FeedParserDelegate

@synthesize feed;

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    feed = [[Feed alloc] init];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if([elementName isEqualToString:@"title"]){
        [feed setTitle:buffer];
    }
    else if([elementName isEqualToString:@"author"])
        return;
    else if([elementName isEqualToString:@"name"]){
        [feed setAuthor:buffer];
    }
    
    buffer = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(!buffer){
        buffer = [[NSMutableString alloc] initWithString:string];
    }
    else{
        [buffer appendString:string];
    }
    
}


@end
