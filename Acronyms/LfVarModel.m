//
//  lfsVarModel.m
//  Acronyms
//
//  Created by Manu Sharma on 4/9/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "LfVarModel.h"

@implementation LfVarModel

- (id) initWithDict: (NSDictionary*) dict {
    if  (self) {
        self.fullForm = [dict objectForKey:@"lf"];
        self.freq = [dict objectForKey:@"freq"];
        self.since = [dict objectForKey:@"since"];
        
    }
    return self;
}

@end
