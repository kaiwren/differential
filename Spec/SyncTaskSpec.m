#import "SpecHelper.h"

@interface SyncTaskSpec : SenTestCase {
}
@end

@implementation SyncTaskSpec
- (void) testRunWithArguments
{	
	SyncTask *task = [ [SyncTask alloc] init ];
	NSArray *args  = [NSArray arrayWithObjects:@"foo", nil];;

	NSString *result = [task runCommand:@"/bin/echo" withArguments: args];
	STAssertEqualStrings(@"foo", [result trim], @"");
}

@end
