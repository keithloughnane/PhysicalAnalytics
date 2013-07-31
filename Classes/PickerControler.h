//
//  PickerControler.h
//  FitNexus
//
//  Created by Keith Loughnane on 15/04/2010.
//  Copyright 2010 none. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PickerControler : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource> {
	
	IBOutlet UIPickerView *singlePicker;
	NSArray *pickerData;

}

@property (nonatomic,retain) UIPickerView *singlePicker;

@property (nonatomic,retain) NSArray *pickerData;

-(IBAction) buttonPressed;

@end
