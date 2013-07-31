//
//  StatsScreen.m
//  FitNexus
//
//  Created by keith on 07/09/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StatsScreen.h"


@implementation StatsScreen

@synthesize myDBControler;
@synthesize myStatsView;
//@synthesize myDBControler;
@synthesize myMap;
@synthesize containerView;

// change start


@synthesize singlePicker;
@synthesize pickerData;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
-(int)initWithOwner : (id) owner
{
	myOwner = owner;

	return 0;
}

-(void)selectCurrentSession : (double) value
{
	
	NSLog(@"selected session WOOZEL %f",value);
	baseTime = value;
	
	//return 0;
}

- (IBAction) buttonPressed : (id)sender
{
	NSLog(@"Button pressed");
	
	NSInteger row = [singlePicker selectedRowInComponent:0];
	NSString *selected = [pickerData objectAtIndex:row];
	NSString *title = [[NSString alloc] initWithFormat:
					   @"you selected %@!",selected];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"Thank you for choosing" delegate:nil cancelButtonTitle:@"You're Welcome" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[title release];
}


//change end

-(int)setAT : (double) value : (int) index
{
	[myStatsView setAT:value :index];
	if(baseTime < value)
	{
		//baseTime = value;
		//[myStatsView setBaseTime:value];
	}
	return 0;
}
-(int)setAX : (double) value : (int) index
{
	[myStatsView setAX:value :index];
	return 0;
} 
-(int)setAY : (double) value : (int) index
{
	[myStatsView setAY:value :index];
	return 0;
} 
-(int)setAZ : (double) value : (int) index
{
	[myStatsView setAZ:value :index];
	return 0;
} 

-(int)setLT : (double) value : (int) index
{
	[myStatsView setLT:value :index];
	return 0;
} 
-(int)setLLat : (double) value : (int) index
{
	[myStatsView setLLat:value :index];
	return 0;
} 
-(int)setLLong : (double) value : (int) index
{
	[myStatsView setLLong:value :index];
	return 0;
}

-(void)setSession:(double) value
{
	//THIS IS NOT THE METHOD YOU ARE LOOKING FOR
	
	NSLog(@"Setting session id");
	sessions[sessionCount] =value;
	sessionCount++;
	//return 0 ;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	
	//[array addObject:@"new item"];

	
		//[self setInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
	//myDBControler = [DataBaseControler alloc];
	//[myDBControler initWithOwner:self];
	

	//myStatsView.alpha = 0.50;
	
	myDBControler = [DataBaseControler alloc];
	[myDBControler initWithOwner:self]; //any object can own rovided it has the variables need for the method it is calling
	
	sessionCount = 0;

	
	[myDBControler DBloadIntoStatsView];
	[myDBControler getSessionIDs];
	
	//just testing sessionids
	for(int i = 0; i < sessionCount; i++)
	{
		NSLog(@"Session test %f",sessions[i]);
	}
	
	
	baseTime = 0.0;
	
	//myMap.alpha = 0.0;
	
	//Setting up the map
	location.latitude = [myStatsView getLlat:locIndex ];
	location.longitude = [myStatsView getLlong:locIndex];	
	[myMap setCenterCoordinate:location];
	
	
	MKCoordinateRegion region;
	//Set Zoom level using Span
	MKCoordinateSpan span;  
	region.center=myMap.region.center;
	
	span.latitudeDelta=myMap.region.span.latitudeDelta /20000.0002;
	span.longitudeDelta=myMap.region.span.longitudeDelta /20000.0002;
	region.span=span;
	[myMap setRegion:region animated:TRUE];
	
	locIndex = 0;

	
[NSTimer scheduledTimerWithTimeInterval:(1.0/5) target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
	
	NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:nil];
	
	
	
	for(int i = 0; i < sessionCount;i++)
	{
	
	//NSNumber *myNumber = [NSNumber numberWithDouble:752.65];
	
	//[array addObject:myNumber];
		
		
		
		
		
		
		NSDate *date = [NSDate dateWithTimeIntervalSince1970:sessions[i]];		
		
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		//[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		
		[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		
		//NSString *string = [dateFormatter stringFromDate:date];
		//[dateFormatter release];
		
		//NSString* dateString = [dateFormatter stringFromDate:date];		
		
		
		//NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
		//[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		
		[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
		
		//NSString *string = [dateFormatter stringFromDate:date];
		//[dateFormatter release];
		
		NSString* timeString = [dateFormatter stringFromDate:date];	
		
		
		
		
		
		
		
	
		
	NSString *accStatus;
		

		
	accStatus = [[NSString alloc] initWithFormat:@"No Acceleration Data Yet"];
	
	//[array addObject:dateString];
		[array addObject:timeString];
		
	}
	
	//[array addObject:nil];
	
	self.pickerData = array;
	[array release];
	
    [super viewDidLoad];
	
	//CGRect rect3 = CGRectMake(0, 0, 500, 500);

	//[self drawRect: CGRectMake(0, 0, 500, 500)];
}
- (void)updateMap
{
	if([myStatsView getLlat:locIndex] != 0.0)
	   {
	location.latitude = [myStatsView getLlat:locIndex ];
	location.longitude = [myStatsView getLlong:locIndex];	
	
	[myMap setCenterCoordinate:location];
	}
	
}
- (void)tick
{
	//NSLog(@"tick");
	locIndex++;
	[self updateMap];
	baseTime ++;
	[myStatsView setBaseTime:baseTime];

	//self.interfaceOrientation = ;
	//[myStatsView drawRect: CGRectMake(100, 100, 100, 100)];


	
}
//- (void)drawRect:(CGRect)rect  {

//}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[singlePicker release];
	[pickerData release];
	
	
	[myStatsView release];
	
    [super dealloc];
}


//picker delegate methods
#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [pickerData count];
}
#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component
{
	return [pickerData objectAtIndex:row];
}

@end
