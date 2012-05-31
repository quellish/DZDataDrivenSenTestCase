//
//  DZTestCaseDictionaryDataSource.m
//  DZValueTransformers
//
//  Created by Dan Zinngrabe on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DZTestCaseDictionaryDataSource.h"

@interface DZTestCaseDictionaryDataSource()

@property (nonatomic, retain) NSDictionary  *testData;

@end

@implementation DZTestCaseDictionaryDataSource
@synthesize testData;

- (id) initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]){
        [self setTestData:dictionary];
    }
    return self;
}

- (void) dealloc {
    [testData release];
    [super dealloc];
}

- (NSUInteger)count {
    return [testData count];
}

- (id)objectForKey:(id)aKey{
    id  result  = nil;
    
    result = [[self testData] objectForKey:aKey];
    return result;
}

- (NSArray *)allKeys {
    NSArray *result = nil;
    
    result = [[self testData] allKeys];
    return result;
}

@end
