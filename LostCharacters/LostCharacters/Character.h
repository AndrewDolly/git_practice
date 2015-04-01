//
//  Character.h
//  LostCharacters
//
//  Created by andrew dahle on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject


@property NSString *name;
@property BOOL *gender;
@property NSString *actor;
@property NSString *occupation;
@property UIImage *image;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;


@end
