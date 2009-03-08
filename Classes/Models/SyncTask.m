#import "SyncTask.h"


@implementation SyncTask
+ (id) new: (NSString *) aPath {
	return [[SyncTask alloc] initWithPath: aPath];
}

- (id) initWithPath: (NSString *) aPath {
	[super init];
	path = aPath;
	return self;
}

- (NSString *) runCommand:(NSString *) command withArguments:(NSArray *) args
{
	NSDictionary *env = [[NSProcessInfo processInfo] environment];
	NSMutableDictionary *myEnv = [env mutableCopy];
	NSString *path = [NSString stringWithFormat:@"%@:%@:%@",[env objectForKey:@"PATH"],@"/opt/local/bin",@"/usr/local/bin"];
	[myEnv setValue: path forKey:@"PATH"];
	
	NSTask *task = [[NSTask alloc] init];
	NSPipe *newPipe = [NSPipe pipe];
	NSPipe *errorPipe = [NSPipe pipe];
	NSFileHandle *readHandle = [newPipe fileHandleForReading];
	NSFileHandle *errorHandle = [errorPipe fileHandleForReading];
	NSData *inData;
	NSData *errorData;
	NSString *tempString;
	NSString *errorString;

	[task setCurrentDirectoryPath: path];

//	[task setCurrentDirectoryPath:NSHomeDirectory()];
//	NSTask *hdiTask = [NSTask launchedTaskWithLaunchPath:@"/usr/bin/env" arguments:[NSArray arrayWithObjects:@"hdiutil", @"internet-enable", @"-quiet", archivePath, nil]];
	[task setLaunchPath:command];
	[task setArguments:args];
	[task setEnvironment:myEnv];
	[task setStandardOutput:newPipe];
	[task setStandardError:errorPipe];
	[task launch];
	inData = [readHandle readDataToEndOfFile];
	errorData = [errorHandle readDataToEndOfFile];
	tempString = [[NSString alloc] initWithData:inData encoding:NSUTF8StringEncoding];
	errorString = [[NSString alloc] initWithData:errorData encoding:NSUTF8StringEncoding];
	[task release];
	[tempString autorelease];
	[errorString autorelease];
//	NSLog(@"----------------------ERROR-----------------------%@",errorString);
	return tempString;
}
@end
