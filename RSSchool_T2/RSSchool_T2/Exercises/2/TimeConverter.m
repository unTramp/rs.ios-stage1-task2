#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSMutableString* result = [NSMutableString stringWithString:@""];
    
    if ([minutes integerValue] > 59 || [hours integerValue] > 12) {
        
        return result;
    }
    
    NSDictionary* strHour = @{@"1":@"one",   @"2":@"two",  @"3":@"three",   @"4":@"four",
                                 @"5":@"five",  @"6":@"six",  @"7":@"seven",   @"8":@"eight",
                                 @"9":@"nine", @"10":@"ten", @"11":@"eleven", @"12":@"twelve"};
    
    NSArray* strMinutes = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six",
                              @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve",
                              @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen",
                              @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two",
                              @"twenty three", @"twenty four", @"twenty five", @"twenty six",
                              @"twenty seven", @"twenty eight", @"twenty nine"];
    
    NSInteger nextHour = ([hours integerValue] % 12) + 1;
    
    NSString* nextHourStr = [NSString stringWithFormat:@"%ld", nextHour];
    
    switch ([minutes integerValue]) {
        case 0: result = [NSMutableString stringWithFormat:@"%@ o' clock", strHour[hours]];
            return result;
            
        case 1: result = [NSMutableString stringWithFormat:@"one minute past %@", strHour[hours]];
            return result;
            
        case 15: result = [NSMutableString stringWithFormat:@"quarter past %@", strHour[hours]];
            return  result;
            
        case 30: result = [NSMutableString stringWithFormat:@"half past %@", strHour[hours]];
            return result;
            
        case 45: result = [NSMutableString stringWithFormat:@"quarter to %@", strHour[nextHourStr]];
            return result;
            
        case 59: result = [NSMutableString stringWithFormat:@"one minute to %@", strHour[nextHourStr]];
            return result;
            
        default:
            break;
    }
    
    
    if ([minutes integerValue] < 30) {
        
        result = [NSMutableString stringWithFormat:@"%@ minutes past %@", strMinutes[[minutes integerValue]], strHour[hours]];
        
        return result;
    } else if ([minutes integerValue] > 30) {
        
        NSString* minutesAfter = strMinutes[60 - [minutes integerValue]];
        
        result = [NSMutableString stringWithFormat:@"%@ minutes to %@", minutesAfter, strHour[nextHourStr]];
        
        return result;
    } else {
        
        result = [NSMutableString stringWithString:@""];
        
        return result;
    }
}
@end
