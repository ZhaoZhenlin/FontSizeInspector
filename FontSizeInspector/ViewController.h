//
//  ViewController.h
//  FontSizeInspector
//
//  Created by Sean Chen on 11/5/14.
//  Copyright (c) 2014 Douguo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *singleLineLabel;
@property (nonatomic, weak) IBOutlet UILabel *doubleLinesLabel;

@property (nonatomic, weak) IBOutlet UILabel *fontWeightLabel;
@property (nonatomic, weak) IBOutlet UILabel *fontSizeLabel;
@property (nonatomic, weak) IBOutlet UILabel *kernLabel;
@property (nonatomic, weak) IBOutlet UILabel *lineSpacingLabel;

@property (nonatomic, weak) IBOutlet UILabel *fontHeightLabel;

@property (nonatomic, weak) IBOutlet UIStepper *fontWeightStepper;
@property (nonatomic, weak) IBOutlet UISlider *fontSizeSlider;
@property (nonatomic, weak) IBOutlet UISlider *kernSlider;
@property (nonatomic, weak) IBOutlet UISlider *lineSpacingSlider;

- (IBAction)fontWeightStepperChanged:(UIStepper *)stepper;
- (IBAction)fontSizeSliderSlided:(UISlider *)slider;
- (IBAction)kernSliderSlided:(UISlider *)slider;
- (IBAction)lineSpacingSliderSlided:(UISlider *)slider;

@end
