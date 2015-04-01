//
//  SuperHero.h
//  SuperheroPedia
//
//  Created by andrew dahle on 3/30/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperHero : NSObject
@property NSString *name;
@property NSString *textDescription;
@property NSURL *imageURL;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)getImageDataWithCompletion:(void (^)(NSData *imageData, NSError *error))complete;

+ (void)retrieveSuperHeroesWithCompletion:(void (^)(NSArray *heroes))complete;





@end
