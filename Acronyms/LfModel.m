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

@end

@implementation LfModel

- (id) initWithDict: (NSDictionary*) dict {

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

@end
