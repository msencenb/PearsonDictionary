//
//  PearsonDictionaryResponseObject.m
//  Pods
//
//  Created by Matt Sencenbaugh on 3/18/15.
//
//

#import "PearsonDictionaryResponseObject.h"
#import "PearsonDictionaryEntry.h"

@implementation PearsonDictionaryResponseObject
-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.total = [[dictionary objectForKey:@"total"] integerValue];
        NSMutableArray *results = [NSMutableArray arrayWithCapacity:10];
        for (NSDictionary *result in [dictionary objectForKey:@"results"]) {
            NSLog(@"%@", result);
            PearsonDictionaryEntry *entry = [[PearsonDictionaryEntry alloc] initWithDictionary:result];
            [results addObject:entry];
        }
        self.results = results;
    }
    return self;
}
@end
