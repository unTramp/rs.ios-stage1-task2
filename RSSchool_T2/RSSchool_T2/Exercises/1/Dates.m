#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDictionary* dictionaryMonth = @{@"1":@"января",@"2":@"февраля",@"3":@"марта",@"4":@"апреля",@"5":@"мая",
@"6" :@"июня",@"7":@"июля",@"8":@"августа",@"9":@"сентября",@"10":@"октября",@"11":@"ноября",@"12":@"декабря"};
    
    NSDictionary* dictionaryDay = @{@"1": @"воскресенье",@"2":@"понедельник",@"3":@"вторник",@"4":@"среда",
                              @"5":@"четверг",@"6":@"пятница",@"7":@"суббота"};
    
    NSDateFormatter* getDateFormat = [[NSDateFormatter alloc] init];
    
    getDateFormat.dateFormat = @"yyyy-MM-dd";
    
    NSDate* someDate = [[NSDate alloc] init];
    NSString* strMonth = @"";
    NSString* strDay = @"";
    
    NSString* strDate = [NSString stringWithFormat:@"%@-%@-%@", year, month, day];
    
    NSDate* getDateFormatString = [getDateFormat dateFromString:strDate];
    
    if (getDateFormatString != nil) {
        someDate = getDateFormatString;
    } else {
        return @"Такого дня не существует";
    }
    
    NSCalendar* currentCalendar = [NSCalendar currentCalendar];
    
    NSString* someDay = [NSString stringWithFormat:@"%ld", [currentCalendar component:NSCalendarUnitWeekday fromDate:getDateFormatString]];
    
    if (dictionaryMonth[month] != nil && dictionaryDay[someDay] != nil) {
        
        strMonth = dictionaryMonth[month];
        strDay = dictionaryDay[someDay];
        
    }
    
    NSString* result = [NSString stringWithFormat:@"%@ %@, %@", day, strMonth, strDay];
    
    return result;
}

@end
