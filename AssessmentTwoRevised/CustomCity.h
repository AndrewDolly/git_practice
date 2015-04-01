//
//  CustomCity.h
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CityDelegate
-(void)wikipediaURLForCity:(NSString *)cityName;
@end

@interface CustomCity : NSObject


@property id <CityDelegate> delegate;

@property NSString *name;
@property NSString *stateProv;
@property UIImage *image;


-(instancetype)initWithName: (NSString *)name andStateProv:(NSString *)stateProv andImage:(UIImage *)image;




-(void)getWikipediaURL;

@end
