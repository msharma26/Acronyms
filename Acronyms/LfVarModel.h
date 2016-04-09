//
//  lfsVarModel.h
//  Acronyms
//
//  Created by Manu Sharma on 4/9/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LfVarModel : NSObject

- (id)initWithDict: (NSDictionary*) dict;
- (NSString *)fetchDescription;
- (NSString *)fetchLongForm;

@end
