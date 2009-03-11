#import <Cocoa/Cocoa.h>

@interface ESFileSystemItem : NSObject {
    ESFileSystemItem *parent;
    NSString *path;
}

+(id)new:(NSString *)thePath;
-(id)initWithPath:(NSString *)thePath;
@end
