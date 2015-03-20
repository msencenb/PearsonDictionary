//
//  PearsonDictionary.h
//  Pods
//
//  Created by Matt Sencenbaugh on 3/18/15.
//
//

#import <Foundation/Foundation.h>
#import "PearsonDictionaryResponseObject.h"

// Block callbacks for the API methods
typedef void (^PearsonDictionarySuccessHandler)(PearsonDictionaryResponseObject *response);
typedef void (^PearsonDictionaryErrorHandler)(NSError *error, NSNumber *statusCode, NSString *readableError);

@interface PearsonDictionary : NSObject

// Purposefully not using the singleton design pattern. If you wish to do so in your own app, please feel free to do so.
-(id)initWithApiKey:(NSString *)ApiKey;

-(void)lookupInformationForHeadword:(NSString *)headword withSuccessHandler:(PearsonDictionarySuccessHandler)successHandler withErrorHandler:(PearsonDictionaryErrorHandler)errorHandler;
@end
