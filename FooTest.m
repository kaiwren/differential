//
//  FooTest.m
//  differential
//
//  Created by irfn on 27/01/09.
//  Copyright 2009 ArcaneFlows All rights reserved.
//

#import "FooTest.h"

@implementation FooTest
	- (void) testBar {
		Foo *foo = [[Foo alloc] init];
		STAssertEquals([foo bar], (NSUInteger)42, @"Foo should know the ultimate answer"); 
	}
@end
