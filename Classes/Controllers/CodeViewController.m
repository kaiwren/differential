#import "CodeViewController.h"

@implementation CodeViewController
- (void)awakeFromNib
{
    // register self as textstorage delegate
    [[textview textStorage] setDelegate:self];
}


- (void)textStorageDidProcessEditing:(NSNotification *)aNotification
{
	// get text storage
    NSTextStorage *textstorage = [aNotification object];
    
    // get strings
    NSString *originalString = [textstorage string];
    
    extern char *yytext;            // pointer to string of current token
    extern double realvalue;        // value of real number if token == REAL
    NSUInteger poscounter = 0;      // position counter
    NSUInteger token = 0;           // the token
    
    // reset scanner state
    yystatereset();
    
    // scan string
    yy_scan_string([originalString UTF8String]);
    
    // fetch tokens from scanner
    while (token = yylex()) {
        // transform C string back to NSString to read UTF-8 characters
        NSString *tokenstring = [NSString stringWithUTF8String:yytext];
        
        // range of string matched by token
        NSRange range = NSMakeRange(poscounter, [tokenstring length]);
        
        // standard color
        NSColor *color = [NSColor blackColor];
        
        // new position counter
        poscounter += [tokenstring length];
        
        // token constants defined in flextokens.h
        // set new color
        if (token == REAL) {
            if (realvalue < 0) {
                color = [NSColor redColor];
            } else {
                color = [NSColor greenColor];
            }
        }
        
        // apply new color to text range
        [textstorage addAttribute:NSForegroundColorAttributeName
                            value:color
                            range:range];
        
    }
}
@end
