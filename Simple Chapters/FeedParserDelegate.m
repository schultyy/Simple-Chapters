//
//  FeedParserDelegate.m
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedParserDelegate.h"
#import "Feed.h"
#import "FeedEntry.h"
#import "Enclosure.h"
#include "Chapter.h"

@implementation FeedParserDelegate

NSInteger const ParserStateHeader = 0;
NSInteger const ParserStateEntry = 1;

@synthesize feed;

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    feed = [[Feed alloc] init];
    state = 0;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"link"]){
        
        if(state == ParserStateHeader){
            id value = [attributeDict valueForKey:@"href"];
            [feed setUrl:value];
        }
        else{
            
            NSString *href = [attributeDict valueForKey:@"href"];
            
            NSString *rel = [attributeDict valueForKey:@"rel"];
            NSString *type = [attributeDict valueForKey:@"type"];
            NSString *length = [attributeDict valueForKey:@"length"];
                        
            if(href && (!rel && !type && !length)){
                [currentEntry setLink:href];
            }
            else
            {
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                
                Enclosure *enclosure = [[Enclosure alloc] init];
                [enclosure setHref: href];
                [enclosure setRel: rel];
                [enclosure setType: type];
                [enclosure setLength: [formatter numberFromString: length]];
                [currentEntry setEnclosure:enclosure];
            }
        }
    }
    else if([elementName isEqualToString:@"entry"]){
        state = ParserStateEntry;
        currentEntry = [[FeedEntry alloc] init];
    }
    else if([elementName isEqualToString:@"sc:chapter"]){
        id start = [attributeDict valueForKey:@"start"];
        id title = [attributeDict valueForKey:@"title"];
        id url = [attributeDict valueForKey:@"url"];
        
        Chapter *chapter = [[Chapter alloc] init];
        [chapter setUrl:url];
        [chapter setStart: start];
        [chapter setTitle:title];
        [[currentEntry chapters] addObject: chapter];
    }
        
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    id cleanedBuffer = [buffer stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(state == ParserStateEntry){
        if([elementName isEqualToString:@"title"]){
            [currentEntry setTitle: cleanedBuffer];
        }
        else if([elementName isEqualToString:@"id"]){
            [currentEntry setIdentifier:cleanedBuffer];
        }
        else if([elementName isEqualToString:@"updated"]){
            [currentEntry setUpdated: [NSDate dateWithString:cleanedBuffer]];
        }
        else if([elementName isEqualToString:@"summary"]){
            
            [currentEntry setSummary:cleanedBuffer];
        }
        else if([elementName isEqualToString:@"entry"]){
            [[feed entries] addObject: currentEntry];
            
            state = ParserStateHeader;
        }
    }
    else {

        if([elementName isEqualToString:@"title"]){
            [feed setTitle:cleanedBuffer];
        }
        else if([elementName isEqualToString:@"author"])
            return;
        else if([elementName isEqualToString:@"name"]){
            [feed setAuthor:cleanedBuffer];
        }
        else if([elementName isEqualToString:@"id"]){
            [feed setIdentifier:cleanedBuffer];
        }
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
