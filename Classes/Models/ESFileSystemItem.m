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
