#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger count = 0;
    NSInteger length = [array count];
    
    NSInteger i = 0;
    NSInteger j = 1;
    
    while (j <= length - 1) {
        if (array[j].intValue - array[i].intValue == number.intValue) {
            count++;
            j++;
            i++;
        }
        else if (array[j].intValue - array[i].intValue < number.intValue && j != length) {
            j++;
        }
        else if (array[j].intValue - array[i].intValue > number.intValue && j != length) {
            i++;
        }
    }
    return count;
}

@end
