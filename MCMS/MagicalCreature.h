//
//  MagicalCreature.h
//  MCMS
//
//  Created by teacher on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *description;

-(MagicalCreature *) initWithName: (NSString *) name;
-(MagicalCreature *) initWithName: (NSString *) name andDescription: (NSString *) description;
@end
