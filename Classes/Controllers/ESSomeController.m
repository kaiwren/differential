//
//  SomeController.m
//  008
//
//  Created by schonira on 02/Mar/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ESSomeController.h"
#import "ESFileSystemItem.h"

@implementation ESSomeController
- (void)doSomething:(id)sender
{
    NSLog(@"message");
    NSString *thePath = [pathField stringValue];
    NSLog(@"%@", thePath);
    ESFileSystemItem *item = [ESFileSystemItem new:thePath];
    NSLog(@"item %@", [item class]);
}
@end
