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

@property (nonatomic, copy) NSString *definition;

@property (nonatomic, copy) NSString *partOfSpeech;
@property (nonatomic, copy) NSString *opposite;
@property (nonatomic, copy) NSString *exampleAudioURL;
@property (nonatomic, copy) NSString *exampleText;
@property (nonatomic, copy) NSString *americanPronunciationURL;
@property (nonatomic, copy) NSString *britishPronunciationURL;
@property (nonatomic, copy) NSString *pronunciationText;
// TODO function to normal stuff?
@end
