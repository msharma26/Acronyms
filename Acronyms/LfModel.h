//
//  FullFormNode.h
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LfModel : NSObject

- (id)initWithDict: (NSDictionary *)dict;

- (NSString *)fetchDescription;
- (NSString *)fetchLongForm;
- (BOOL)hasVariations;
- (NSArray *) fetchVariationArray;

@end
