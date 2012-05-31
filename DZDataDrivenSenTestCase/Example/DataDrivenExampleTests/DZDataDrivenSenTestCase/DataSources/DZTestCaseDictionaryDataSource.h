//
//  DZTestCaseDictionaryDataSource.h
//  DZValueTransformers
//
//  Created by Dan Zinngrabe on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZTestCaseDataSource.h"

@interface DZTestCaseDictionaryDataSource : NSObject<DZTestCaseDataSource>

-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
