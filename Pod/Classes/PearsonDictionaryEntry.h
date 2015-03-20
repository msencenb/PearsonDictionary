//
//  PearsonDictionaryEntry.h
//  Pods
//
//  Created by Matt Sencenbaugh on 3/19/15.
//
//

#import <Foundation/Foundation.h>

@interface PearsonDictionaryEntry : NSObject

-(id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString *headword;

// definition seems to be an array, are there instances of array of definitions coming down?
// Basic app has full definition list for all entries
@property (nonatomic, copy) NSString *definition;

// Upgraded app has audio, examples, 'function_to_normal_box', etc.
@property (nonatomic, copy) NSString *partOfSpeech;
@property (nonatomic, copy) NSString *opposite;
@property (nonatomic, copy) NSString *exampleAudioURL;
@property (nonatomic, copy) NSString *exampleText;
@property (nonatomic, copy) NSString *americanPronunciationURL;
@property (nonatomic, copy) NSString *britishPronunciationURL;
// TODO function to normal stuff?
@end
