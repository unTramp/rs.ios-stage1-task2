#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSInteger counter = 2;
    
    NSArray* myFib = [self doMyFib:counter];
    
    NSInteger lastElement = 0;
    
    NSInteger preLastElement = 0;
    
    NSInteger sum = lastElement * preLastElement;
    
    NSInteger flag = 0;
    
    while ([number integerValue] != sum) {
        
        myFib = [self doMyFib:counter];
        
        lastElement = [myFib[myFib.count - 1] integerValue];
        
        preLastElement = [myFib[myFib.count - 2] integerValue];
        
        sum = lastElement * preLastElement;
        
        counter += 1;
        
        flag = 1;
        
        if (sum > [number integerValue]) {
            
            flag = 0;
            
            break;
        }
    }
    
    NSArray* result = [NSArray arrayWithObjects:[NSNumber numberWithInteger:preLastElement],
                       [NSNumber numberWithInteger:lastElement],[NSNumber numberWithInteger:flag],
                       nil];
    
    return result;
}

- (NSArray*)doMyFib:(NSInteger)n {
    
    NSMutableArray* myFibonachii = [NSMutableArray arrayWithObjects:@0, @1, nil];
    
    if(n > 1) {
        while (myFibonachii.count < n) {
            
            NSInteger lastElementFib = [myFibonachii[myFibonachii.count - 1] integerValue];
            
            NSInteger preLastElementFib = [myFibonachii[myFibonachii.count - 2] integerValue];
            
            NSInteger sumFib = lastElementFib + preLastElementFib;
            
            [myFibonachii addObject:[NSNumber numberWithInteger:sumFib]];
        }
    }
    return myFibonachii;
}

@end
