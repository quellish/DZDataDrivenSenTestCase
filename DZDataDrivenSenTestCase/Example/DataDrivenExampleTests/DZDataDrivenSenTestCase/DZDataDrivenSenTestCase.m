//
//  DataDrivenSenTestCase.m
//  DZValueTransformers
//
//  Created by Dan Zinngrabe on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DZDataDrivenSenTestCase.h"
#import "DZTestCaseDataSource.h"
#import "DZTestCaseDictionaryDataSource.h"

@implementation DZDataDrivenSenTestCase

#pragma mark -
#pragma mark Test support properties

@synthesize unitUnderTest;
@synthesize expectedValue;
@synthesize inputValue;

#pragma mark -
#pragma Test initializer

- (id)initWithInvocation:(NSInvocation *)testInvocation 
           expectedValue:(id)value 
                   input:(id)input {
    
    self = [super initWithInvocation:testInvocation];
    if (self) {
        [self setExpectedValue:value];
        [self setInputValue:input];
    }
    
    return self;
}

#pragma mark - Default test suite

+ (id)defaultTestSuite {
    SenTestSuite                *result     = nil;
    id <DZTestCaseDataSource>   dataSource  = nil;
    
    result = [[SenTestSuite alloc] initWithName:NSStringFromClass(self)];
    
    dataSource = [[self class] dataSource];
    if (dataSource != nil){
        NSArray *allKeys = nil;
        allKeys = [dataSource allKeys];
        for (id key in allKeys){
            [self addTestWithExpectedValue:[dataSource objectForKey:key] input:key toTestSuite:result];
        }
    }
    return [result autorelease];
}

#pragma mark -
#pragma mark Data source

+ (id<DZTestCaseDataSource>)dataSource {
    static DZTestCaseDictionaryDataSource *_dataSource = nil;
    
    if (_dataSource == nil){
        NSDictionary    *plistDictionary    = nil;
        NSString        *path               = [[NSBundle bundleForClass:[self class]] pathForResource:NSStringFromClass([self class]) ofType:@"plist"];
        if (path != nil){
            plistDictionary    = [[NSDictionary alloc] initWithContentsOfFile:path];
            _dataSource = [[[DZTestCaseDictionaryDataSource alloc] initWithDictionary:plistDictionary] autorelease];
            [plistDictionary release];
        }
    }
    return _dataSource;
}

#pragma mark -
#pragma Add a test

+ (void)addTestWithExpectedValue:(id)expectedValue input:(id)inputValue toTestSuite:(SenTestSuite *)testSuite
{
    NSArray *testInvocations = [self testInvocations];
    for (NSInvocation *testInvocation in testInvocations) {
        SenTestCase *test = [[[self class] alloc] initWithInvocation:testInvocation expectedValue:expectedValue input:inputValue];
        [testSuite addTest:test];
        [test release];
    }
}

#pragma mark -


- (void)tearDown {
    [self setInputValue:nil];
    [self setExpectedValue:nil];
    [self setUnitUnderTest:nil];
    
    // Tear-down code here.
    [super tearDown];
}

@end
