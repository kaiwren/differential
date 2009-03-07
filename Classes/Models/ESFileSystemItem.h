//
//  ESFileSystemItem.h
//  008
//
//  Created by schonira on 02/Mar/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ESFileSystemItem : NSObject {
    ESFileSystemItem *parent;
}

+(id)new:(NSString *)thePath;

@end
