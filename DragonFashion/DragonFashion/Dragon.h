//
//  Dragon.h
//  DragonFashion
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dragon : NSObject

@property NSString *fullName;
@property NSString *signatureClothingItem;

-(instancetype)initWithFullName:(NSString *)name andClothingItem:(NSString *)clothingItem;



@end
