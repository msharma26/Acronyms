//
//  lfsVarModel.m
//  Acronyms
//
//  Created by Manu Sharma on 4/9/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "LfVarModel.h"

@interface LfVarModel ()

@property (nonatomic, strong) NSString *fullForm;
@property (nonatomic, strong) NSString *since;
@property (nonatomic, strong) NSString *freq;

@end

@implementation LfVarModel

- (id)initWithDict: (NSDictionary*) dict {
    if  (self) {
        self.fullForm = [dict objectForKey:@"lf"];
        self.freq = [dict objectForKey:@"freq"];
        self.since = [dict objectForKey:@"since"];
    }
    return self;
}

- (NSString *)fetchDescription {
    NSString *descString = [NSString stringWithFormat:@"Since %@ & Frequency: %@, ", self.since, self.freq];
    return descString;
}

- (NSString *)fetchLongForm {
    return self.fullForm;
}

@end
