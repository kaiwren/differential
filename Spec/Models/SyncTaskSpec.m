#import "SpecHelper.h"

@interface SyncTaskSpec : SenTestCase {
}
@end

@implementation SyncTaskSpec
- (void) testRunWithArguments
{	
	SyncTask *task = [SyncTask new: @"/Users/irfn/dev/ruby/ironruby"];
	NSString *result = [task run: [NSArray arrayWithObjects:@"echo", @"foo", nil]];
	assertThat([result trim],is(equalTo(@"foo")));
}

- (void) testRunGit
{	
	SyncTask *task = [SyncTask new: @"/Users/irfn/dev/ruby/ironruby"];
	NSString *result = [task run: [NSArray arrayWithObjects:@"git", @"status", nil]];
	STAssertEqualStrings(@"foo", [result trim], @"");
}

@end
