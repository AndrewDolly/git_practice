//
//  People.h
//  MyBookClub
//
//  Created by andrew dahle on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface People : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isFriend;
@property (nonatomic, retain) NSSet *friends;
@property (nonatomic, retain) NSSet *suggestedBooks;
@end

@interface People (CoreDataGeneratedAccessors)


@end
