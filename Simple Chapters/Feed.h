//
//  Feed.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (retain) NSString *title;

@property (retain) NSString *url;

@property (retain) NSDate *updated;

@property (retain) NSString *author;

@property (retain) NSString *identifier;

@property (retain) NSMutableArray *entries;

-(id) initWithData:(NSData*) data;

-(NSData *) saveToXml;

@end
