#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array == nil || array.count == 0 || ![array[0] isKindOfClass:NSArray.class]){
            return @[];
    }
    BOOL hasNumbers = false;
    BOOL hasLetters = false;
    NSMutableArray<NSNumber*> *tmpNumbers = [NSMutableArray new];
    NSMutableArray<NSString*> *tmpLetters = [NSMutableArray new];
    
    for (NSArray *innerArr in array) {
        for (id el in innerArr) {
            if ([el isMemberOfClass:NSString.class]) {
                [tmpLetters addObject:el];
                hasLetters = true;
            } else {
                [tmpNumbers addObject:el];
                hasNumbers = true;
            }
        }
    }
    
    if (tmpLetters.count == 0) {
        return [tmpNumbers sortedArrayUsingSelector:@selector(compare:)];
    } else if (tmpNumbers.count == 0) {
        return [tmpLetters sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    
    [tmpNumbers sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    [tmpLetters sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)]]];
    return [NSArray arrayWithObjects:tmpNumbers, tmpLetters, nil];

}

@end
