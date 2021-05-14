#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {

//    algorithm wit some mistakes:
//    NSInteger count = 0;
//    NSInteger length = [array count];
//
//    NSInteger i = 0;
//    NSInteger j = 1;
//
//    while (j <= length - 1) {
//        if (array[j].intValue - array[i].intValue == number.intValue) {
//            count++;
//            j++;
//            i++;
//        }
//        else if (array[j].intValue - array[i].intValue < number.intValue && j != length) {
//            j++;
//        }
//        else if (array[j].intValue - array[i].intValue > number.intValue && j != length) {
//            i++;
//        }
//    }
    
    if (array.count < 2)
    {
        return 0;
    }
    int count = 0;
    for (NSUInteger i = 0; i < array.count; i++) {
        for (NSUInteger j = i+1; j< array.count; j++) {
            if ([array objectAtIndex:j].intValue - [array objectAtIndex:i].intValue == number.intValue) {
                count++;
            }
        }
    }
    return count;
}

@end
