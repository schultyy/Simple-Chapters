//
//  Enclosure.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Enclosure : NSObject

@property (readwrite, copy) NSString *rel;

@property (readwrite, copy) NSString *type;

@property (readwrite, copy) NSNumber *length;

@property (readwrite, copy) NSString *href;

-(NSXMLElement *) saveToXml;

@end
