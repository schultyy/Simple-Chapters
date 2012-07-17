//
//  Feed.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (readwrite, copy) NSString *title;

@property (readwrite, copy) NSString *url;

@property (readwrite, copy) NSDate *updated;

@property (readwrite, copy) NSString *author;

@property (readwrite, copy) NSString *identifier;

@property (retain) NSMutableArray *entries;

-(id) initWithData:(NSData*) data;

-(NSData *) saveToXml;

+(NSString *) xmlNamespacePrefix;

+(NSString *) xmlNamespace;

@end
