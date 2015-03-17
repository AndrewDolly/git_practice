//
//  MagicalCreature.h
//  MCMS
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;

@property NSString *fullName;
@property NSString *superPower;

-(instancetype)initWithFullName:(NSString *)name andSuperPower:(NSString *)superPower;



@end
