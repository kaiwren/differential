#import "SyncTask.h"
#import "SyncPipe.h"


@implementation SyncTask
+ (id) new: (NSString *) aPath {
	return [[SyncTask alloc] initWithPath: aPath andEnv: [NSProcessInfo environmentWith: @"/opt/local/bin:/usr/local/bin" ] ];
}

- (id) initWithPath: (NSString *) aPath andEnv: (NSDictionary *) env{
	[super init];
	path = aPath;
	environment = env;
	return self;
}

- (NSString *) run:(NSArray *) command {		
	NSTask *task = [[NSTask alloc] init];
	SyncPipe *error = [SyncPipe new];
	SyncPipe *output = [SyncPipe new];

	[task setCurrentDirectoryPath: path];
	[task setLaunchPath:@"/usr/bin/env"];
	[task setArguments:command];
	[task setEnvironment:environment];
	[task setStandardOutput:[output pipe]];
	[task setStandardError:[error pipe]];
	[task launch];
	[task release];
	return [output read];
}
@end
