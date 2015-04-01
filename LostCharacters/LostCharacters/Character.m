//
//  Character.m
//  LostCharacters
//
//  Created by andrew dahle on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "Character.h"

@implementation Character


- (instancetype) initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];

    if (self)
    {
        self.name = dictionary[@"name"];
        self.occupation = dictionary[@"occupation"];
    }
    return self;
}



@end
