//
//  Chapter.h
//  Simple Chapters
//
//  Created by Jan Schulte on 17.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chapter : NSObject

@property (readwrite, copy) NSString *start;

@property (readwrite, copy) NSString *title;

@property (readwrite, copy) NSString *url;

-(NSXMLElement *) saveToXml;

@end
