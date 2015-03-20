//
//  Dragon.m
//  DragonFashion
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "Dragon.h"

@implementation Dragon

-(instancetype)initWithFullName:(NSString *)name andClothingItem:(NSString *)clothingItem
{
    //setting up custom initializer

    self = [super init];
    if (self)
    {
        self.fullName = name;
        self.signatureClothingItem = clothingItem;
    }
    return self;
}



@end
