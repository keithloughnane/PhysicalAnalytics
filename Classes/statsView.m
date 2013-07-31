//
//  statsView.m
//  FitNexus
//
//  Created by keith on 07/10/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "statsView.h"


@implementation statsView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

-(int)initWithOwner : (id) owner
{
	myOwner = owner;
	redraw = false;
	for(int i = 0; i<254; i++)
	{
		aTime[i] = aX[i] = aY[i] = aZ[i] =lTime[i] = llat[i] = llong[i] = 0.0;
	}
	return 0;
}
-(int)setAT : (double) value : (int) index
{
	aTime[index] = value;
	//NSLog(@"got AT");
	//self.alpha = value;
	return 0;
}
-(int)setAX : (double) value : (int) index
{
	aX[index] = value;
	//NSLog(@"got AX");
	return 0;
} 
-(int)setAY : (double) value : (int) index
{
	aY[index] = value;
	//NSLog(@"got AY");
	return 0;
} 
-(int)setAZ : (double) value : (int) index
{
	aZ[index] = value;
	//NSLog(@"got AZ");
	return 0;
} 

-(int)setLT : (double) value : (int) index
{
	lTime[index] = value;
	//NSLog(@"got LT");
	return 0;
} 
-(int)setLLat : (double) value : (int) index
{
	llat[index] = value;
	//NSLog(@"got Lat");
	return 0;
} 
-(int)setLLong : (double) value : (int) index
{
	llong[index] = value;
	//NSLog(@"got Long");
	return 0;
}
-(int)setBaseTime : (double) time
{
	if(time>(baseTime+1.0))
	{
	baseTime = time;
	//NSLog(@"Setting basetime");
	//[self drawRect: CGRectMake(100, 100, 100, 100)];
	redraw = !redraw;
	[self setNeedsDisplay];
	}
	return 0;
}

-(double)getLlat: (int) index
{
	return llat[index];
}
-(double)getLlong: (int) index
{
	return llong[index];
}

- (void)drawRect:(CGRect)rect {
	NSLog(@"draw Rect called");
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 2.0);
	UIColor		*currentColor;
	//currentColor = [UIColor redColor];
	//CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
	//NSLog(@"Begining loop");
	for(int i = 1; i < 254; i++)
	{
		//NSLog(@"drawing red line");
		//if(redraw)
		{
			//NSLog(@"setting colour");
		currentColor = [UIColor redColor];
		}
		//NSLog(@"seting context to color");
		CGContextSetStrokeColorWithColor(context, currentColor.CGColor);  //Breaks here after 3 runs of this method
		//NSLog(@"moving to point");
	CGContextMoveToPoint(context, (i-baseTime) *2.5, (aZ[i-1]*-60)+25);
		//NSLog(@"adding line");
	CGContextAddLineToPoint(context, ( (i-baseTime)*2.5)+2.5, (aZ[i]*-60)+25);
		//NSLog(@"doing stroke path");
		//NSLog(@"drawing from %f to %f",aZ[i-1],aZ[i]);
		CGContextStrokePath(context);
				//NSLog(@"drawing blue line");
		//if(redraw)
		currentColor = [UIColor blueColor];
		CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
		CGContextMoveToPoint(context, (i-baseTime) *2.5, (aY[i-1]*-60)+50);
		CGContextAddLineToPoint(context, ( (i-baseTime)*2.5)+2.5, (aY[i]*-60)+50);
		//NSLog(@"drawing from %f to %f",aY[i-1],aY[i]);
		CGContextStrokePath(context);
				//NSLog(@"drawing green line");
		//if(redraw)
		currentColor = [UIColor greenColor];
		CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
		CGContextMoveToPoint(context, (i-baseTime) *2.5, (aX[i-1]*-60)+75);
		CGContextAddLineToPoint(context, ( (i-baseTime)*2.5)+2.5, (aX[i]*-60)+75);
		//NSLog(@"drawing from %f to %f",aX[i-1],aX[i]);
		CGContextStrokePath(context);
}
	//redraw = true;
	
}


- (void)dealloc {
    [super dealloc];
}


@end
