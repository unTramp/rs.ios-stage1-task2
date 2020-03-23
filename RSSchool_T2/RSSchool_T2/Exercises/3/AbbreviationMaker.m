#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    
    if(a.length < b.length) {
        
        return @"NO";
    }
    
    NSString* bigA = [a uppercaseString];
    
    NSMutableArray* arrayWithA = [[NSMutableArray alloc] init];
    
    NSMutableArray* arrayWithB = [[NSMutableArray alloc] init];
    
    __block NSMutableString* comparedLetters = [[NSMutableString alloc] init];
    
    
    for (NSInteger i = 0; i < bigA.length; i++) {
        
        unichar charack = [bigA characterAtIndex:i];
        
        NSString* myCharAsString= [NSString stringWithFormat:@"%c", charack];
        
        [arrayWithA addObject:myCharAsString];
        
    }
    
    for (NSInteger index = 0; index < b.length; index++) {
        
        unichar charack = [b characterAtIndex:index];
        
        NSString* charStrEnd= [NSString stringWithFormat:@"%c", charack];
        
        [arrayWithB addObject:charStrEnd];
    }
    
    
    void(^doArray)(void);
    
    doArray = ^{
        
        NSMutableString* firstElementA = [arrayWithA firstObject];
        
        NSMutableString* firstElementB = [arrayWithB firstObject];
        
        if (firstElementA == firstElementB) {
            
            [arrayWithA removeObjectAtIndex:0];
            
            [arrayWithB removeObjectAtIndex:0];
            
            NSMutableString* str = [NSMutableString stringWithFormat:@"%@", firstElementA];
            
            [comparedLetters appendString: str];
            
            NSLog(@"comparedLetters = %@", comparedLetters);
        } else {
            
            [arrayWithA removeObjectAtIndex:0];
        }
    };
    
    while (arrayWithB.count != 0 && arrayWithA.count > 0) {
        doArray();
    }
    
    if ([comparedLetters isEqualToString:b]) {
        
        return @"YES";
    } else {
        
        NSLog(@"b = %@, comparedLetters = %@", b, comparedLetters);
        
        return @"NO";
    }
    
}
@end
