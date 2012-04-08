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

@property (retain) NSString *title;

@property (retain) NSString *link;

@property (retain) NSString *identifier;

@property (retain) NSDate *updated;

@property (retain) NSString *summary;

@property (retain) Enclosure *enclosure;

-(id) initWithData:(NSData*) data;

-(void) saveToXml: (NSData*) data;

@end
