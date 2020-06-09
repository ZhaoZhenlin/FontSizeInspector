//
//  ViewController.h
//  FontSizeInspector
//
//  Created by Sean Chen on 11/5/14.
//  Copyright (c) 2014 Douguo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FSITextViewController.h"
#import "FSIFontsTableViewController.h"
#import "FSIStylesTableViewController.h"

@interface ViewController : UIViewController <FSITextViewControllerDelegate, FSIFontsTableViewControllerDelegate>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *fontName;

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

@property (nonatomic, weak) IBOutlet UIView *fontWeightContainer;

- (IBAction)fontWeightStepperChanged:(UIStepper *)stepper;
- (IBAction)fontSizeSliderSlided:(UISlider *)slider;
- (IBAction)kernSliderSlided:(UISlider *)slider;
- (IBAction)lineSpacingSliderSlided:(UISlider *)slider;

- (IBAction)fontItemTapped:(id)sender;
- (IBAction)textItemTapped:(id)sender;
- (IBAction)styleItemTapped:(id)sender;

- (IBAction)fontWeightLabelTapped:(UITapGestureRecognizer *)tapper;
- (IBAction)fontSizeLabelTapped:(UITapGestureRecognizer *)tapper;

@end
