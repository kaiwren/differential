#import <Cocoa/Cocoa.h>

@interface ESFileSystemItem : NSObject {
    ESFileSystemItem *parent;
}

+(id)new:(NSString *)thePath;

@end
