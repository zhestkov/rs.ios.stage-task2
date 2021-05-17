#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 res = 0;
    for (UInt8 i = 0; i < 8; i++) {
        if (n % 2 != 0) {
            res += pow(2, 7 - i);
        }
        n >>= 1;
    }

    return res;
}
