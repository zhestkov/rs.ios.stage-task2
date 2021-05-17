#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray == nil) {
        return @"";
    }
    for (NSInteger i = 0; i < numbersArray.count; i++) {
        if ([[numbersArray objectAtIndex:i] intValue] > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        if ([[numbersArray objectAtIndex:i] intValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }
    }
    
    if (numbersArray.count > 4) {
        NSRange theRange;
        theRange.location = 0;
        theRange.length = 4;
        numbersArray = [numbersArray subarrayWithRange:theRange];
    }
    NSString *address = [numbersArray componentsJoinedByString:@"."];
    
    if (numbersArray.count < 4 && numbersArray.count > 0) {
        for (NSInteger i = numbersArray.count; i < 4; i++) {
            address = [address stringByAppendingString:@".0"];
        }
    }
    return address;
}

@end
