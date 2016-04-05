//
//  LongForm.h
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LongForm : NSObject

- (id) initWithDictionary: (NSDictionary *) dict;

// properties
@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSString *freq;


@end
