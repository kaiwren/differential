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
	NSDictionary *environment;
}

+ (id) new: (NSString *) aPath;
- (id) initWithPath: (NSString *) aPath andEnv: (NSDictionary *) env;
- (NSString *) run:(NSArray *) command ;
@end