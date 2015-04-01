//
//  CityDetailViewController.h
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "CustomCity.h"

@protocol CityDetailViewControllerDelegate <NSObject>

-(void)changeTitle: (NSString *) cityName;
@end



@interface CityDetailViewController : UIViewController

@property CustomCity *city;

@property (nonatomic, weak) id<CityDetailViewControllerDelegate> delegate;

@end
