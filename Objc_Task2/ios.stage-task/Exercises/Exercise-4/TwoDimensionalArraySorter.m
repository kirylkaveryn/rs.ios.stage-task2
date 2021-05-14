#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    // init a 2 arrays for Numbers and Names
    NSMutableArray *unsortedArrayWithNumbers = [[NSMutableArray alloc] init];
    NSMutableArray *unsortedArrayWithNames = [[NSMutableArray alloc] init];
    
    // check if array 1D (contains no arrays)
    for (int i = 0; i < [array count]; i++) {
        if (![array[i] isKindOfClass:NSArray.class]) {
            return @[];
        }
    }
    
    // if ok - add objects to different arrays
    for (int i = 0; i < [array count]; i++) {
        for (int j = 0; j < [array[i] count]; j++) {
            if ([array[i][j] isKindOfClass:NSNumber.class]) {
                [unsortedArrayWithNumbers addObject:array[i][j]];
            }
            else if ([array[i][j] isKindOfClass:NSString.class]) {
                [unsortedArrayWithNames addObject:array[i][j]];
            }
        }
    }
    
    // sorting array with numbers
    NSArray *sortedArrayWithNumbers = [unsortedArrayWithNumbers sortedArrayUsingSelector:@selector(compare:)];

    // create descriptoes for sorting
    NSSortDescriptor *sortNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    NSSortDescriptor *sortNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    
    // sort arrays
    NSArray *sortedArrayWithNamesDescend = [unsortedArrayWithNames sortedArrayUsingDescriptors:@[sortNameDesc]];
    NSArray *sortedArrayWithNamesAscend = [unsortedArrayWithNames sortedArrayUsingDescriptors:@[sortNameAsc]];
//
//    NSLog(@"sortedArrayWithNamesDescend %@",sortedArrayWithNamesDescend);
//    NSLog(@"sortedArrayWithNamesAscend %@",sortedArrayWithNamesAscend);
    
    NSMutableArray *sortedMutableArray = [[NSMutableArray alloc] init];
    
    // check if there are both of arrays - create 2d result array
    if (sortedArrayWithNumbers != nil && [sortedArrayWithNumbers count] != 0 && sortedArrayWithNamesDescend != nil && [sortedArrayWithNamesDescend count] != 0) {
        [sortedMutableArray addObject:sortedArrayWithNumbers];
        [sortedMutableArray addObject:sortedArrayWithNamesDescend];
    }
    // if Numbers or Names is empty - create 1d result array
    else if (sortedArrayWithNumbers == nil || [sortedArrayWithNumbers count] == 0) {
        [sortedMutableArray addObjectsFromArray:sortedArrayWithNamesAscend];
    }
    else if (sortedArrayWithNamesAscend == nil || [sortedArrayWithNamesAscend count] == 0) {
        [sortedMutableArray addObjectsFromArray:sortedArrayWithNumbers];
    }
    
//    NSLog(@"sortedMutableArray %@",sortedMutableArray);
    
    return [sortedMutableArray copy];
}
    
@end
