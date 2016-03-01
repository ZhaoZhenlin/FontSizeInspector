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

@property (nonatomic, weak) IBOutlet UILabel *fontSizeLabel;
@property (nonatomic, weak) IBOutlet UILabel *fontHeightLabel;

@property (nonatomic, weak) IBOutlet UISlider *slider;

- (IBAction)slided:(UISlider *)slider;

@end

