#import "Blocks.h"

@interface Blocks ()

@property (strong, nonatomic) __block NSArray *array;

@end

@implementation Blocks

- (instancetype)init {
    self = [super init];
    if (self) {
      
      
           self.blockA = ^(NSArray *array) {
             self.array = array;
         };
         
     
        
         self.blockB = ^(Class class) {
             NSMutableArray  *soughtClassArray = [NSMutableArray new];
                 for (NSObject *object in self.array) {
                     if ([object isKindOfClass:class]) {
                         [soughtClassArray addObject:object];  } }
             
            
                 
                 if (class == [NSString class]) {
                         NSString *result = [soughtClassArray componentsJoinedByString:@""];
                         self.blockC(result);
                 }
                 else if (class == [NSNumber class]) {
                     
                     int sum = 0;
                     for (NSNumber *number in soughtClassArray) {
                         sum += [number intValue];
                     }
                     NSNumber *result = [NSNumber numberWithInt:sum];
                     self.blockC(result);
                     
                 } else if (class == [NSDate class]){
                     
                     NSDateFormatter *formater = [[NSDateFormatter alloc] init];
                     formater.dateFormat = @"dd.MM.yyyy";
                     NSDate *myLatestDate = [soughtClassArray objectAtIndex:0];
                     for (NSDate *curDate in soughtClassArray) {
                         myLatestDate = [curDate laterDate:myLatestDate];
                     }
                     NSString *result = [formater stringFromDate:myLatestDate];
                     self.blockC(result);
                 }
         };
    }
    return self;
}
@end
