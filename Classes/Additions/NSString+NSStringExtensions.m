#import "NSString+NSStringExtensions.h"

@implementation NSString(NSStringExtensions)
- (NSString *) trim{
	return [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
