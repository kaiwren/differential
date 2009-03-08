//
//  SyncTask.h
//  differential
//
//  Created by irfn on 07/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SyncTask : NSObject {
	NSString *path;
}

+ (id) new: (NSString *) aPath;
- (id) initWithPath: (NSString *) aPath;
- (NSString *)runCommand:(NSString *)command withArguments:(NSArray *)args;
@end