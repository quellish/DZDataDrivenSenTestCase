//
//  DataDrivenSenTestCase.h
//  DZValueTransformers
//
//  Created by Dan Zinngrabe on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DZTestCaseDataSource.h"

@interface DZDataDrivenSenTestCase : SenTestCase

@property (nonatomic, retain) id                        unitUnderTest;
@property (nonatomic, retain) id                        expectedValue;
@property (nonatomic, retain) id                        inputValue;

/*!
 dataSource
 @abstract Subclasses can override this class method to provide an alternate data source.
 @discussion The default data source reads a plist from the test bundle and uses that to drive tests.
 @return Instance implementing the DZTestCaseDataSource protocol
 */

+ (id<DZTestCaseDataSource>)dataSource;

@end
