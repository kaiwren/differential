//
//  SyncTask.m
//  differential
//
//  Created by irfn on 07/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SyncTask.h"


@implementation SyncTask
- (NSString *) runCommand:(NSString *) command withArguments:(NSArray *) args
{
	NSTask *task = [[NSTask alloc] init];
	NSPipe *newPipe = [NSPipe pipe];
	NSPipe *errorPipe = [NSPipe pipe];
	NSFileHandle *readHandle = [newPipe fileHandleForReading];
	NSData *inData;
	NSString *tempString;
	
	[task setCurrentDirectoryPath:NSHomeDirectory()];
	[task setLaunchPath:command];
	[task setArguments:args];
	[task setStandardOutput:newPipe];
	[task setStandardError:errorPipe];
	[task launch];
	inData = [readHandle readDataToEndOfFile];
	tempString = [[NSString alloc] initWithData:inData encoding:NSUTF8StringEncoding];
	[task release];
	[tempString autorelease];
	return tempString;
}
@end
