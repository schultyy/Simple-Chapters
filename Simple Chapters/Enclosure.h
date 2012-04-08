//
//  Enclosure.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Enclosure : NSObject

@property (retain) NSString *rel;

@property (retain) NSString *type;

@property (retain) NSNumber *length;

@property (retain) NSString *href;

-(NSXMLElement *) saveToXml;

@end
