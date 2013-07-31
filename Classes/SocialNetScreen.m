//
//  SocialNetScreen.m
//  FitNexus
//
//  Created by keith on 07/09/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SocialNetScreen.h"
#import "StatsScreen.h"

@implementation SocialNetScreen


@synthesize myDBControler;
@synthesize statsScreen;
@synthesize singlePicker;
@synthesize pickerData;
//@synthesize containerView;

-(IBAction)buttonPressed:(id)sender
{
	if(showPicker)
	{
	NSInteger row = [singlePicker selectedRowInComponent:0];
		//NSLog(@"Selected ROW: %i",row);
		selectedSession = sessions[row];
		//NSLog(@"Selected ROW: %f",selectedSession);
		[statsScreen selectCurrentSession:selectedSession];
	NSString *selected = [pickerData objectAtIndex:row];
	NSString *title = [[NSString alloc] initWithFormat:@"Replaying Workout from %@!", selected];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[title release];
	
		singlePicker.alpha = 0.0;
	//containerView.alpha =0;
	
		
		
		
		
	
	

	}
	else 
	{
		singlePicker.alpha = 1.0;
	}

	showPicker = !showPicker;
}

-(int)setSession:(double) value
{
	NSLog(@"Setting session id");
	sessions[sessionCount] =value;
	sessionCount++;
	return 0 ;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	showPicker = true;
	/*
	// Experimental subwindow code
	StatsScreen *statsNib = [[StatsScreen alloc]
								initWithNibName:@"StatsScreen" bundle:nil];
	self.statsScreen = statsNib;
	//[self.view insertSubview:statsNib.view atIndex:0];
	[statsNib release];
	
	*/
	
	
	selectedSession = 12.3;
	
	
	StatsScreen *statsNib = [[StatsScreen alloc]
							 initWithNibName:@"StatsScreen" bundle:nil];
	self.statsScreen = statsNib;
	[statsScreen initWithOwner:self];
	
	
	//[statsScreen selectCurrentSession:selectedSession];
	[self.view insertSubview:statsNib.view atIndex:0];
	[statsNib release];
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-------------------------------------
	
	//Setting up DataBase
	myDBControler = [DataBaseControler alloc];
	[myDBControler initWithOwner:self];
	
	NSLog(@"Social Net Screen Calling myDBControler DBLoadToNet");
	[myDBControler DBloadToNet];
	
	sessionCount = 0;
	
	//[myDBControler DBloadIntoStatsView];
	[myDBControler  getSessionIDs];
	
	for (int i = 0; i < sessionCount; i++) 
	{
		NSLog(@"Session test %f",sessions[i]);
	}
	
	//new experimental picker code
	
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
	
	
	
	
	
	/* OLD working picker code
	//Setting up picker
	NSArray *array = [[NSArray alloc] initWithObjects:@"Luke",@"Leia",@"Han",nil];
	self.pickerData = array;
	[array release];
	*/
	
	
	
	
	
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	
    [super dealloc];
}
	
#pragma mark -
#pragma mark Picker Data Source Methods

	-(NSInteger) numberOfComponentsInPickerView:
	(UIPickerView *)pickerView
	{
		return 1;
	}

	-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
	{
		return [pickerData count];
	}
	
#pragma mark Picker Delegate Methods
	-(NSString *)pickerView:(UIPickerView *)pickerView
titleForRow:(NSInteger)row
forComponent:(NSInteger)component
	{
		return [pickerData objectAtIndex:row];
	}

@end
