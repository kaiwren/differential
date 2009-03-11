#import "SpecHelper.h"
#import "ESFileSystemItem.h"    
#import "ESFileSystemFile.h"    
#import "ESFileSystemDirectory.h"    

@interface ESFileSystemItemSpec : SenTestCase {
}
@end

@implementation ESFileSystemItemSpec
- (void) testShouldKnowHowToInstantiateADirectoryItem
{	
    NSString *pwd = [[[NSProcessInfo processInfo] environment] objectForKey: @"PWD"];

    ESFileSystemItem *item = [ESFileSystemItem new:(pwd)];
	STAssertTrue([item isKindOfClass:[ESFileSystemDirectory class]], @"should have been an ESFileSystemDirectory");
}

- (void) xtestRunGit
{	
     //   NSLog(@"%@", [pwd stringByAppendingString:@"/Woot!"]);
	// STAssertEqualStrings(@"foo", [result trim], @"");
}

@end
