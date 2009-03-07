//
//  NSString.m
//  differential
//
//  Created by irfn on 07/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//



#import <Cocoa/Cocoa.h>
@implementation NSString (NSStringExtensions)
- (NSString *) trim{
	return [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end