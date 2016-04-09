//
//  FullFormNode.m
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "LfModel.h"
#import "LfVarModel.h"


@interface LfModel ()

@property (nonatomic, strong) NSString *fullForm;
@property (nonatomic, strong) NSMutableArray *variations;
@property (nonatomic, strong) NSString *since;
@property (nonatomic, strong) NSString *freq;

@end

@implementation LfModel

- (id)initWithDict: (NSDictionary*) dict {

    if  (self) {
        
        self.fullForm = [dict objectForKey:@"lf"];
        self.freq = [dict objectForKey:@"freq"];
        self.since = [dict objectForKey:@"since"];
        
        if ([dict objectForKey:@"vars"]) {
            self.variations = [[NSMutableArray alloc] init];
            for (NSDictionary *varDict in [dict objectForKey:@"vars"]) {
                LfVarModel *varModel = [[LfVarModel alloc] initWithDict:varDict];
                [self.variations addObject:varModel];
            }
        }
    }
    return self;
}


- (NSString *)fetchDescription {
    
    NSString *descString = [NSString stringWithFormat:@"Since %@, Frequency: %@, ", self.since, self.freq];
    if ([self.variations count] > 0) {
        descString = [NSString stringWithFormat:@"%@ with %lu variations", descString, (unsigned long)self.variations.count];
    }
    return descString;
}


- (NSString *)fetchLongForm {
    return self.fullForm;
}

@end
