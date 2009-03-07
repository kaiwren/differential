//
//  SyncTaskSpec.m
//  differential
//
//  Created by irfn on 07/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "SyncTaskSpec.h"
#import "SyncTask.h"


@implementation SyncTaskSpec
- (void) testRunWithArguments
{
	
	SyncTask *task = [ [SyncTask alloc] init ];
	NSArray *args = [NSArray arrayWithObjects:@"foo", nil];;
	NSString *result = [task runCommand:@"/bin/echo" withArguments: args];
	STAssertEqualStrings(@"foo", [result trim], @"");
}

@end
