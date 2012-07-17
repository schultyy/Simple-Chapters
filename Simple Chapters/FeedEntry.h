//
//  FeedEntry.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enclosure.h"

@interface FeedEntry : NSObject

@property (readwrite, copy) NSString *title;

@property (readwrite, copy) NSString *link;

@property (readwrite, copy) NSString *identifier;

@property (readwrite, copy) NSDate *updated;

@property (readwrite, copy) NSString *summary;

@property (readwrite, copy) NSMutableArray *chapters;

@property (retain) Enclosure *enclosure;

-(NSXMLElement *) saveToXml;

@end
