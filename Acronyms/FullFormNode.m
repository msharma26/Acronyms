//
//  FullFormNode.m
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "FullFormNode.h"

@implementation FullFormNode

- (id) initWithDict: (NSDictionary*) dict {
    if  (self) {
        self.fullForm = [dict objectForKey:@"lf"];
        self.freq = [dict objectForKey:@"freq"];
        
    }
    return self;
}

@end
