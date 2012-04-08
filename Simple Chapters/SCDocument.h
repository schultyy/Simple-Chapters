//
//  SCDocument.h
//  Simple Chapters
//
//  Created by Jan Schulte on 08.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Feed.h"

@interface SCDocument : NSDocument
@property (retain) Feed *feed;
@end
