//
//  AccelGetter.m
//  FitNexus
//
//  Created by keith on 03/09/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AccelGetter.h"

@implementation AccelGetter
@synthesize owner;
@synthesize accel;

-(int)initWithOwner : (id) ownerl
{
	owner = (id)ownerl;
	[owner getsAccel:1.0 :1.0 :1.0];
	accel = [UIAccelerometer sharedAccelerometer];
	accel.delegate = self;
	accel.updateInterval = 0.1;
	return 0;
}

-(void) accelerometer:(UIAccelerometer *)
accelerometer didAccelerate: (UIAcceleration *)
acceleration
{
	[owner getsAccel:acceleration.x :acceleration.y :acceleration.z];
}
@end
