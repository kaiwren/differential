//
//  SyncPipe.h
//  differential
//
//  Created by irfn on 08/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SyncPipe : NSObject {
	NSPipe *pipe;	
}

@property(readonly) NSPipe *pipe; 

+(id) new; 
-(NSString *) read;
@end
