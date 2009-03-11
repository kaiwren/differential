//
//  NSProcessInfo+extras.h
//  differential
//
//  Created by irfn on 09/03/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSProcessInfo(extras)

+(NSDictionary *) environmentWith: (NSString *) extraPath;
@end
