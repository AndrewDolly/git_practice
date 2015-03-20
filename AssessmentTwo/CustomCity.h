//
//  CustomCity.h
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CustomCity : NSObject
@property NSString *name;
@property NSString *stateProv;
@property UIImage *image;


-(instancetype)initWithName: (NSString *)name stateProv:(NSString *)stateProv;



@end
