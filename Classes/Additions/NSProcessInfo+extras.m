//
//  NSProcessInfo+extras.m
//  differential
//
//  Created by irfn on 09/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSProcessInfo+extras.h"


@implementation NSProcessInfo(extras)
+(NSDictionary *) environmentWith: (NSString *) extraPath{
	NSDictionary *env = [[self processInfo] environment];
	NSMutableDictionary *mutableEnv = [env mutableCopy];
	NSString *path = [NSString stringWithFormat:@"%@:%@",[env objectForKey:@"PATH"], extraPath];
	[mutableEnv setValue: path forKey:@"PATH"];		
	return mutableEnv;
}
@end
