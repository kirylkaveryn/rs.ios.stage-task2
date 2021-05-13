#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    UInt8 number = n;
    NSMutableString *binaryString = [[NSMutableString alloc] init];
    NSMutableString *reversedString = [[NSMutableString alloc] init];
    
    // побитовое сравнение и запись в строку
    for (int i = 0; i < 8; i++) {
        [binaryString insertString:(number & 1) ? @"1" : @"0"  atIndex:0];
        number = number / 2;
    }
    
    // reverse the binary number
    for (int i = 0; i < 8; i++) {
        NSString *buffer = [NSString stringWithFormat:@"%c", [binaryString characterAtIndex:(i)]];
        [reversedString insertString:buffer atIndex:0];
    }
    
    // strtol - convert string to long, last argument - base of int (binary in our case)
    number = strtol([reversedString UTF8String], NULL, 2);
    
    return number;
}
