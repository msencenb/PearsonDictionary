//
//  PearsonDictionaryTests.m
//  PearsonDictionaryTests
//
//  Created by Matt Sencenbaugh on 03/18/2015.
//  Copyright (c) 2014 Matt Sencenbaugh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <PearsonDictionary/PearsonDictionary.h>

@interface PearsonDictionaryTests : XCTestCase
@property (nonatomic, strong) PearsonDictionary *dictionary;
@end

@implementation PearsonDictionaryTests

- (void)setUp
{
    [super setUp];
    //NOTE - This is a free tier key granted by Pearson, it is knowingly compromised so that jenkins can test the status of this cocoapod. Not for use in production apps. 
    self.dictionary = [[PearsonDictionary alloc] initWithApiKey:@"X1PI46NOGgGF9dqSnsQ7xQhEbx9HGDGh"];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testResponseObjectCreation
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing retrieve information for happy"];
    
    [self.dictionary lookupInformationForHeadword:@"happy" withSuccessHandler:^(PearsonDictionaryResponseObject *responseObject){
        NSLog(@"%@",responseObject);
        XCTAssertNotNil(responseObject);
        [expectation fulfill];
    } withErrorHandler:^(NSError *error, NSNumber *statusCode, NSString *readableError){
        XCTFail(@"Failed to get info for happy");
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if(error)
        {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
    }];}

@end