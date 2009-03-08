#import "ESFileTreeDataSource.h"
#import "ESFileSystemItem.h"

@implementation ESFileTreeDataSource

// Data Source methods

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    return (item == nil) ? 1 : [item numberOfChildren];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return (item == nil) ? YES : ([item numberOfChildren] != -1);
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    return (item == nil) ? [item rootItem] : [(ESFileSystemItem *)item childAtIndex:index];
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    return (item == nil) ? @"/" : (id)[item relativePath];
}

// Delegate methods

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldEditTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    return NO;
}

@end
