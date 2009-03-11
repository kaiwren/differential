//
//  NSData+NSDataExtensions.m
//  differential
//
//  Created by irfn on 08/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSData+NSDataExtensions.h"


@implementation NSData(NSDataExtensions)

-(NSString *) utf8Value{
	return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
