#import "NSString+Transform.h"

 

@implementation NSString (Transform)

-(BOOL)isPangram:(NSString*)inputString {
    NSArray* alphabet = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    NSInteger counter = 0;
    BOOL marker = false;
    NSString* uppercaseInputString = inputString.uppercaseString;
    NSMutableArray* uppercaseInputArray = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < uppercaseInputString.length; index++) {
        unichar myCharacter = [uppercaseInputString characterAtIndex:index];
        NSString* myCharAsString= [NSString stringWithFormat:@"%c", myCharacter];
        [uppercaseInputArray addObject:myCharAsString];
    }
    for (NSString* letter in alphabet) {
        for (NSString* element in uppercaseInputArray) {
            if ([element isEqualToString:letter]) {
                marker = true;
            }
        }
        if (marker == true) {
            counter += 1;
            marker = false;
        }
    }
    return (counter == alphabet.count);
}

-(NSDictionary*)getDictIfPangram:(NSString*)input {
    BOOL pangram = [self isPangram:input];
    if (pangram) {
        NSDictionary* vowels = @{@"a":@"A", @"e":@"E", @"i":@"I", @"o":@"O", @"u":@"U", @"y":@"Y"};
        return vowels;
    } else {
        NSDictionary* consonants = @{@"b": @"B", @"c": @"C", @"d":@"D", @"f":@"F", @"g":@"G", @"h":@"H", @"j":@"J", @"k":@"K", @"l":@"L", @"m":@"M", @"n":@"N", @"p":@"P", @"q":@"Q", @"r":@"R", @"s":@"S", @"t":@"T", @"v":@"V", @"w":@"W", @"x":@"X", @"z":@"Z"};
        return consonants;
    }
}

-(NSString*)transform {
    NSDictionary* lettersDict = [self getDictIfPangram:self];
    NSArray* wordsArrayFromInput = [self componentsSeparatedByString:@" "];
    NSMutableArray* updatedWordArray = [[NSMutableArray alloc] init];
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    NSString*(^newWord)(NSString* word);

    newWord = ^(NSString* word) {
        NSInteger sameLettersCount = 0;
        NSMutableString* updatedWord = [NSMutableString stringWithString:@""];
        NSMutableArray* wordArray = [[NSMutableArray alloc] init];
        for (NSInteger index = 0; index < word.length; index++) {
            unichar myCharacter = [word characterAtIndex:index];
            NSString* myCharAsString= [NSString stringWithFormat:@"%c", myCharacter];
            [wordArray addObject:myCharAsString];
        }
        for (NSString* letter in wordArray) {
            if ([letter.uppercaseString isEqualToString:lettersDict[letter]]) {
                    sameLettersCount += 1;
                    [updatedWord appendString:lettersDict[letter]];
                } else if (lettersDict[[letter lowercaseString]] != nil) {
                    sameLettersCount += 1;
                    [updatedWord appendString:letter];
                } else {
                    [updatedWord appendString:letter];
                }
        }
        return [NSString stringWithFormat:@"%ld%@", sameLettersCount, updatedWord];
    };
    for (NSString* word in wordsArrayFromInput) {
        NSString* updatedWord = newWord(word);
        if (![updatedWord isEqual:@"0"] && ![updatedWord isEqual:@"0\n"]) {
            [updatedWordArray addObject:updatedWord];
        }
    }
   __block NSInteger index = 0;
   __block NSInteger counter = updatedWordArray.count;
    void(^myClosure)(void);
    myClosure = ^{
        for (NSString* word in updatedWordArray) {
            NSString* stringIndex = [NSString stringWithFormat:@"%ld", index];
            if ([word hasPrefix:stringIndex]) {
                [resultArray addObject:word];
                counter -= 1;
            }
        }
        index += 1;
    };
    while (counter != 0) {
        myClosure();
    }
    return [resultArray componentsJoinedByString:@" "];
}
@end
