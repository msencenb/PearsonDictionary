//
//  PearsonDictionaryResponseObject.h
//  Pods
//
//  Created by Matt Sencenbaugh on 3/18/15.
//
//

#import <Foundation/Foundation.h>

@interface PearsonDictionaryResponseObject : NSObject

-(id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, assign) NSInteger total;

@end
