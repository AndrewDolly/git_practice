//
//  SuperHero.m
//  SuperheroPedia
//
//  Created by andrew dahle on 3/30/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "SuperHero.h"

@implementation SuperHero

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];

    if (self)
    {
        self.name = [dictionary objectForKey:@"name"];
        //line above and below do the same thing, one is just easier and less code
        self.textDescription = dictionary[@"description"];
        self.imageURL = [NSURL URLWithString:dictionary[@"avatar_url"]];
    }
    return self;
}

+ (void)retrieveSuperHeroesWithCompletion:(void (^)(NSArray *heroes))complete;
{
    NSURL *url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSArray *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

        NSMutableArray *superHeroes = [NSMutableArray new];
        //this is fast enumeration
        for (NSDictionary *dict in results)
        {
            SuperHero *hero = [[SuperHero alloc]initWithDictionary:dict];
            [superHeroes addObject:hero];
        }
        complete(superHeroes);
    }];
}

- (void)getImageDataWithCompletion:(void (^)(NSData *imageData, NSError *error))complete;
{
    NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError) {
            complete(nil, connectionError);
        }
        else {
        complete(data, nil);
        }
    }];
}

@end
