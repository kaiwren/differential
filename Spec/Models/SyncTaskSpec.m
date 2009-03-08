#import "SpecHelper.h"

@interface SyncTaskSpec : SenTestCase {
}
@end

@implementation SyncTaskSpec
- (void) testRunWithArguments
{	
    NSString *homeDir = [[[NSProcessInfo processInfo] environment] objectForKey:@"HOME"];
	SyncTask *task = [SyncTask new: [NSString stringWithFormat: @"%@/dev/ruby/ironruby", homeDir]];
	NSArray *args  = [NSArray arrayWithObjects:@"foo", nil];;

	NSString *result = [task runCommand:@"/bin/echo" withArguments: args];
	STAssertEqualStrings(@"foo", [result trim], @"should have been equal to foo");
}

- (void) xtestRunGit
{	
	SyncTask *task = [SyncTask new: @"/Users/irfn/dev/ruby/ironruby"];
	NSArray *args  = [NSArray arrayWithObjects:@"git", @"status", nil];
	NSString *result = [task runCommand:@"/usr/bin/env" withArguments: args];
	NSLog(@"-----------------------%@-------------------------",@"start");
	NSLog(@"%@",result);
	NSLog(@"-----------------------%@-------------------------",@"end");
	STAssertEqualStrings(@"foo", [result trim], @"");
}

@end
