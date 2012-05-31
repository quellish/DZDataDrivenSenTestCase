//
//  DataDrivenExampleTests.m
//  DataDrivenExampleTests
//
//  Created by Dan Zinngrabe on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataDrivenExampleTests.h"
#import "DZDoublingValueTransformer.h"
#import "DZTestCaseDictionaryDataSource.h"

@implementation DataDrivenExampleTests

- (void)setUp {
    [super setUp];
    // Create the unit under test and set it
    DZDoublingValueTransformer *transformer = [[DZDoublingValueTransformer alloc] init];
    [self setUnitUnderTest:transformer ];
    [transformer release];
}

- (void) tearDown {
    // Release your unit under test
    [self setUnitUnderTest:nil];
    [super tearDown];
}

- (void)testExample {
    NSNumber *inputNumber       = nil;
    NSNumber *expectedNumber    = nil;
    inputNumber                 = (NSNumber *)[self inputValue];
    expectedNumber              = (NSNumber *)[self expectedValue];
    
    float theVal = [[[self unitUnderTest] transformedValue:inputNumber] floatValue];    
    STAssertEqualsWithAccuracy([expectedNumber floatValue], theVal, 0.0f, @"That's not doubling it!");
}

@end
