#import "NSTextView+additions.h"

@implementation NSTextView(PaperAdditions)
- (NSString *)selectedString {
    NSRange     range = [self selectedRange];
    return [[self attributedSubstringFromRange:range] string];
}

- (BOOL)hasSelection {
    NSRange     range = [self selectedRange];
    return (range != 0);
}
@end