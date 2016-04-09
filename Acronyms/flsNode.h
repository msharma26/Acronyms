//
//  FullFormNode.h
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface flsNode : NSObject

- (id) initWithDict: (NSDictionary*) dict;

@property (nonatomic, strong) NSString *fullForm;
@property (nonatomic, strong) NSMutableArray *variations;
@property (nonatomic, strong) NSString *freq;

@end
