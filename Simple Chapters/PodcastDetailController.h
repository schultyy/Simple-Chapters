//
//  PodcastDetailController.h
//  Simple Chapters
//
//  Created by Jan Schulte on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"

@interface PodcastDetailController : NSViewController

@property (assign) NSString *feedName;

@property (assign) NSString *feedUrl;

@property (assign) NSString *feedAuthor;

-(void) displayInformationsFor:(Feed *) feed
withName: (NSString *) name;

@end
