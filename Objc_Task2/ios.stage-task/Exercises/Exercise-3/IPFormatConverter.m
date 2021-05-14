#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSInteger count = [numbersArray count];
    
    // check for count of input array
    if (count > 4) {
        count = 4;
    }
    
    // check for NIL or empty array
    if (numbersArray == nil || count == 0) {
        return @"";
    }
    
    for (int i = 0; i < count; i++) {
        if ([numbersArray[i] intValue] > 255) {
            return [NSString stringWithFormat:@"The numbers in the input array can be in the range from 0 to 255."];
        }
        if ([numbersArray[i] intValue] < 0) {
            return [NSString stringWithFormat:@"Negative numbers are not valid for input."];
        }
    }
    
    // create mutable array for IP numbers with capacity = 4
    NSMutableArray *ipFormatArray = [NSMutableArray arrayWithCapacity:4];
    
    // set values of IP numbers in new array
    NSInteger i = 0;
    while (i <= count - 1 || i < sizeof(ipFormatArray)) {
        if (i <= count - 1) {
            [ipFormatArray addObject:[numbersArray objectAtIndex:i]];
        }
        else {
        [ipFormatArray addObject:@"0"];
        }
    
        i++;
    }
    
    // create formatted string to output
    NSString *outputIP = [NSString stringWithFormat:@"%i.%i.%i.%i", [ipFormatArray[0] intValue], [ipFormatArray[1] intValue], [ipFormatArray[2] intValue], [ipFormatArray[3] intValue]];
    
    return outputIP;
}

@end
