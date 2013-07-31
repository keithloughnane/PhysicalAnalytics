//
//  SocialNetScreen.h
//  FitNexus
//
//  Created by keith on 07/09/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseControler.h"

@class StatsScreen;


@interface SocialNetScreen : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
{
	//IBOutlet UIView *containerView;
	
	StatsScreen *statsScreen;
	
	IBOutlet UIPickerView *singlePicker;
	DataBaseControler *myDBControler;
	NSArray *pickerData;
	int sessionIndex;
	double sessions[1000];
	int sessionCount;
	bool showPicker;
	double selectedSession;
}
@property (retain, nonatomic) UIView *containerView;
@property (retain, nonatomic) StatsScreen *statsScreen;
@property (retain, nonatomic) DataBaseControler *myDBControler;
@property (nonatomic, retain) UIPickerView *singlePicker;
@property (nonatomic,retain)NSArray *pickerData;
-(IBAction) buttonPressed;
-(int)setSession : (double) value;
- (void)viewDidLoad;

@end
