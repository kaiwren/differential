#import "SpecHelper.h"

@interface SyncPipeSpec : SenTestCase {
}
@end

@implementation SyncPipeSpec
- (void) testInitializesWithAPipe{	
	SyncPipe *syncPipe = [SyncPipe new];
	assertThat(syncPipe.pipe, is(notNilValue()));
	assertThat(syncPipe.pipe, is(instanceOf([NSPipe class])));
}

- (void) testInitializesAPipe{	
	SyncPipe *syncPipe = [SyncPipe new];
	assertThat(syncPipe.pipe, is(notNilValue()));
	assertThat(syncPipe.pipe, is(instanceOf([NSPipe class])));
}

@end
