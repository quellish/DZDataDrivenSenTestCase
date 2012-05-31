//
//  DZDoublingValueTransformer.m
//  DataDrivenExample
//
//  Created by Dan Zinngrabe on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DZDoublingValueTransformer.h"

@implementation DZDoublingValueTransformer

+ (Class)transformedValueClass {
    return [NSNumber self];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (id)transformedValue:(id)aNumber {
    double val = [aNumber doubleValue];
    return [NSNumber numberWithDouble: (val * 2) ];
}

- (id)reverseTransformedValue:(id)aNumber {
    double val = [aNumber doubleValue];
    return [NSNumber numberWithDouble: (val / 2) ];
}


@end
