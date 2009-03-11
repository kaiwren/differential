#import "SpecHelper.h"

@interface SyncTaskSpec : SenTestCase {
}
@end

@implementation SyncTaskSpec
- (void) testRunWithArguments
{	
<<<<<<< HEAD:Spec/Models/SyncTaskSpec.m
	SyncTask *task = [SyncTask new: @"/Users/irfn/dev/ruby/ironruby"];
	NSString *result = [task run: [NSArray arrayWithObjects:@"echo", @"foo", nil]];
	assertThat([result trim],is(equalTo(@"foo")));
=======
    NSString *homeDir = [[[NSProcessInfo processInfo] environment] objectForKey:@"HOME"];
	SyncTask *task = [SyncTask new: [NSString stringWithFormat: @"%@/dev/ruby/ironruby", homeDir]];
	NSArray *args  = [NSArray arrayWithObjects:@"foo", nil];;

	NSString *result = [task runCommand:@"/bin/echo" withArguments: args];
	STAssertEqualStrings(@"foo", [result trim], @"should have been equal to foo");
>>>>>>> 62032fb3101b3917f775bed84fddc36ebf9a12fa:Spec/Models/SyncTaskSpec.m
}

- (void) testRunGit
{	
	SyncTask *task = [SyncTask new: @"/Users/irfn/dev/ruby/ironruby"];
	NSString *result = [task run: [NSArray arrayWithObjects:@"git", @"status", nil]];
	STAssertEqualStrings(@"foo", [result trim], @"");
}

@end
