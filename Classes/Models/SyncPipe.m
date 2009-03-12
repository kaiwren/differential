//
//  SyncPipe.m
//  differential
//
//  Created by irfn on 08/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SyncPipe.h"


@implementation SyncPipe
@synthesize pipe; 

+ (id) new{
	return [[SyncPipe alloc] initPipe];
}
-(NSString *) read{	
	NSFileHandle *readHandle = [pipe fileHandleForReading];
	NSData *outputData = [readHandle readDataToEndOfFile];
	return [outputData utf8Value];	
}

-(id) initPipe{
	[self init];
	pipe = [NSPipe pipe];
	return self;
}
@end