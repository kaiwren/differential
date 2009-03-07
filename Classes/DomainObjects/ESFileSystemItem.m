//
//  ESFileSystemItem.m
//  008
//
//  Created by schonira on 02/Mar/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ESFileSystemItem.h"
#import "ESFileSystemFile.h"
#import "ESFileSystemDirectory.h"

@implementation ESFileSystemItem
+(id)new:(NSString *)thePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir, valid = [fileManager fileExistsAtPath:thePath isDirectory:&isDir];
    if (valid) {
        if (isDir){
            return [[ESFileSystemDirectory alloc] initWithPath:thePath];
        }
        else{
            return [[ESFileSystemFile alloc] initWithPath:thePath];
        }
    }
    return nil;
}
@end
