#import "SpecHelper.h"

@interface SyncTaskSpec : SenTestCase {
}
@end

@implementation SyncTaskSpec

- (void) testRunWithArguments
{	
	SyncTask *task = [SyncTask new: NSHomeDirectory()];
	NSString *result =  [task run: [NSArray arrayWithObjects:@"echo", @"foo", nil] ];
//	assertThat( [result trim] , should(equalTo(@"foo")));
}

@end
