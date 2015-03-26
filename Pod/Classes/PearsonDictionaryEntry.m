//
//  PearsonDictionaryEntry.m
//  Pods
//
//  Created by Matt Sencenbaugh on 3/19/15.
//
//

#import "PearsonDictionaryEntry.h"
#import "PearsonDictionary.h"

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
                
                NSArray *audioExamples = [exampleDictionary objectForKey:@"audio"];
                if ([audioExamples count] > 0) {
                    NSDictionary *audioExampleDictionary = [audioExamples objectAtIndex:0];
                    self.exampleAudioURL = [NSString stringWithFormat:@"%@%@", [PearsonDictionary baseURL], [audioExampleDictionary objectForKey:@"url"]];
                }
            }
        }
        
        NSArray *pronunciations = [dictionary objectForKey:@"pronunciations"];
        if ([pronunciations count] > 0) {
            NSDictionary *pronunciationDictionary = [pronunciations objectAtIndex:0];
            self.pronunciationText = [pronunciationDictionary objectForKey:@"ipa"];
            
            NSArray *audioPronunciations = [pronunciationDictionary objectForKey:@"audio"];
            for (NSDictionary *audio in audioPronunciations) {
                NSString *lang = [audio objectForKey:@"lang"];
                if ([lang isEqual:@"British English"]) {
                    self.britishPronunciationURL = [NSString stringWithFormat:@"%@%@", [PearsonDictionary baseURL], [audio objectForKey:@"url"]];
                } else if ([lang isEqual:@"American English"]) {
                    self.americanPronunciationURL = [NSString stringWithFormat:@"%@%@", [PearsonDictionary baseURL], [audio objectForKey:@"url"]];
                }
            }
        }
    }
    return self;
}
@end
