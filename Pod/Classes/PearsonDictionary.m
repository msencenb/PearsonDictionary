//
//  PearsonDictionary.m
//  Pods
//
//  Created by Matt Sencenbaugh on 3/18/15.
//
//

#import "PearsonDictionary.h"
@interface PearsonDictionary()
@property (nonatomic, copy) NSString *apiKey;
@property (nonatomic, copy) NSString *consumerSecret;
@end

//http://developer.pearson.com/content-apis/get-started
@implementation PearsonDictionary
-(id)initWithApiKey:(NSString *)apiKey
{
    self = [super init];
    if (self) {
        self.apiKey = apiKey;
    }
    return self;
}

//https://api.pearson.com/v2/dictionaries/ldoce5/entries?headword=immaculate&apikey=f1Okr09CYORZSugR41U0yShivY0PNGaL
-(void)lookupInformationForHeadword:(NSString *)headword withSuccessHandler:(PearsonDictionarySuccessHandler)successHandler withErrorHandler:(PearsonDictionaryErrorHandler)errorHandler
{
    //TODO multiple dictionaries
    NSString *urlString = [NSString stringWithFormat:@"https://api.pearson.com/v2/dictionaries/ldoce5/entries?headword=%@&apikey=%@", headword, self.apiKey];
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@", [url absoluteString]);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        // Deal with connection errors
        if (error) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                errorHandler(error, [NSNumber numberWithInt:-1], error.localizedDescription);
                return;
            });

        }
        
        // Handle response errors
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if (urlResponse.statusCode != 200) {
            NSString *readableError = [self getReadableErrorFromURLResponse:urlResponse];
            NSNumber *numberStatuscode = [NSNumber numberWithInteger:urlResponse.statusCode];
            dispatch_sync(dispatch_get_main_queue(), ^{
                errorHandler(nil,numberStatuscode,readableError);
            });
            return;
        }
        
        // Actually parse the json
        NSError *parseError = nil;
        NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        if (parseError) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                errorHandler(parseError, [NSNumber numberWithInt:-1], parseError.localizedDescription);
            });
            return;
        }
        
        PearsonDictionaryResponseObject *responseObject = [[PearsonDictionaryResponseObject alloc] initWithDictionary:responseJSON];
        dispatch_sync(dispatch_get_main_queue(), ^{
            successHandler(responseObject);
        });
        
    }];
    [task resume];

}

-(NSString *)getReadableErrorFromURLResponse:(NSHTTPURLResponse *)urlResponse
{
    NSString *readableError = nil;
    switch (urlResponse.statusCode) {
        case 400:
            readableError = @"The phone number entered is invalid. Ensure you have correctly entered a 10 digit US based phone number and excluded the country code.";
            break;
            
        case 401:
            readableError = @"You are unauthorized to view this information, please check your api key.";
            break;
            
        case 402:
            readableError = @"You don't have enough money in your account for this query. Please add more money to your EveryoneAPI account.";
            break;
            
        case 403:
            readableError = @"You've been rate limited for possible malicious activity.";
            break;
        case 404:
            readableError = @"There is no information currently available for the phone number entered";
            break;
            
        default:
            readableError = @"Sorry something went wrong";
            break;
    }
    return readableError;
}
@end
