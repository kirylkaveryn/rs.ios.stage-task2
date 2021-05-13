#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger count = 0;
    NSInteger length = [array count];
    
    for (NSInteger i = 0; i < length -1; i++) {
        for (NSInteger j = i + 1; j < length; j++) {
            if ([[array objectAtIndex:j]intValue] - [[array objectAtIndex:i]intValue] == [number intValue]) {
                count ++;
            }
        }
    }
    return count;
}

@end
