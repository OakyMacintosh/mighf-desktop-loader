#import <AppKit/NSTextView.h>

@interface NSTextView(PaperAdditions)
- (NSString *)selectedString;
- (BOOL)hasSelection;
@end