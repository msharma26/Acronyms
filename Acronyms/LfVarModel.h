//
//  lfsVarModel.h
//  Acronyms
//
//  Created by Manu Sharma on 4/9/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LfVarModel : NSObject

- (id) initWithDict: (NSDictionary*) dict;

@property (nonatomic, strong) NSString *fullForm;
@property (nonatomic, strong) NSString *since;
@property (nonatomic, strong) NSString *freq;


@end
