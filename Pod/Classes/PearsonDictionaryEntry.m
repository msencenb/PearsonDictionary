//
//  PearsonDictionaryEntry.m
//  Pods
//
//  Created by Matt Sencenbaugh on 3/19/15.
//
//

#import "PearsonDictionaryEntry.h"

@implementation PearsonDictionaryEntry
-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.headword = [dictionary objectForKey:@"headword"];
        self.partOfSpeech = [dictionary objectForKey:@"part_of_speech"];
        
        
        NSArray *senses = [dictionary objectForKey:@"senses"];
        if ([senses count] > 0) {
            NSDictionary *firstSense = [senses objectAtIndex:0];
            self.opposite = [firstSense objectForKey:@"opposite"];

            
            NSArray *arrayOfDefinitions = [firstSense objectForKey:@"definition"];
            //Cherry pick the first definition if it exists
            self.definition = ([arrayOfDefinitions count] > 0) ? [arrayOfDefinitions objectAtIndex:0] : @"";
            
            NSArray *arrayOfExamples = [firstSense objectForKey:@"examples"];
            if ([arrayOfExamples count] > 0) {
                NSDictionary *exampleDictionary = [arrayOfExamples objectAtIndex:0];
                self.exampleText = [exampleDictionary objectForKey:@"text"];
            }
        }
    }
    return self;
}
@end
