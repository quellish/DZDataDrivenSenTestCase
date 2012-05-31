//
//  DZTestCaseDataSource.h
//  DZValueTransformers
//
//  Created by Dan Zinngrabe on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DZTestCaseDataSource <NSObject>

- (NSUInteger)count;

- (id)objectForKey:(id)aKey;

- (NSArray *)allKeys;

@end
