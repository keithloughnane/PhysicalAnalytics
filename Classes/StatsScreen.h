//
//  StatsScreen.h
//  FitNexus
//
//  Created by keith on 07/09/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DataBaseControler.h"
#import "statsView.h"
#import "DataBaseControler.h"
@interface StatsScreen : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource> {
	
	IBOutlet UIPickerView *singlePicker;
	NSArray *pickerData;
	
	IBOutlet UIView *containerView;
	
	
	
IBOutlet statsView *myStatsView;
	IBOutlet MKMapView *myMap;
	DataBaseControler *myDBControler;
	CLLocationCoordinate2D location;
	
	NSTimer *repeatingTimer;
	
	id myOwner;

	int locIndex;
	double baseTime;
	int sessionIndex;
	double sessionBegan;
	double sessions[1000];
	int sessionCount;
	
	
	
}
@property (retain, nonatomic) DataBaseControler *myDBControler;
@property (retain,nonatomic) statsView *myStatsView;
@property (retain, nonatomic) MKMapView *myMap;
@property (assign) NSTimer *repeatingTimer;

-(int)initWithOwner : (id) owner;

@property (nonatomic,retain) UIPickerView *singlePicker;
@property (nonatomic,retain) NSArray *pickerData;
@property (retain, nonatomic) UIView *containerView;



-(IBAction) buttonPressed:(id)sender;

-(int)setAT : (double) value : (int) index; 
-(int)setAX : (double) value : (int) index; 
-(int)setAY : (double) value : (int) index; 
-(int)setAZ : (double) value : (int) index; 

-(int)setLT : (double) value : (int) index; 
-(int)setLLat : (double) value : (int) index; 
-(int)setLLong : (double) value : (int) index;
-(int)setSession : (double) value;

-(void)selectCurrentSession : (double) value;

- (void)tick;
- (void)updateMap;


@end
