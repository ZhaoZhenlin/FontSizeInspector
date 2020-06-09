//
//  ViewController.m
//  FontSizeInspector
//
//  Created by Sean Chen on 11/5/14.
//  Copyright (c) 2014 Douguo Inc. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.fontWeightLabel.text = [NSString stringWithFormat:@"%0.1f", self.fontWeightStepper.value];
	self.fontSizeLabel.text = [NSString stringWithFormat:@"%0.1f", self.fontSizeSlider.value];
	self.kernLabel.text = [NSString stringWithFormat:@"%0.1f", self.kernSlider.value];
	self.lineSpacingLabel.text = [NSString stringWithFormat:@"%0.1f", self.lineSpacingSlider.value];
	
	[self update];
}

- (void)fontWeightStepperChanged:(UIStepper *)stepper {
	
	double value = self.fontWeightStepper.value;
	
	if (value > 0) {
		self.fontWeightLabel.text = [NSString stringWithFormat:@"%0.2f", self.fontWeightStepper.value];
	} else {
		self.fontWeightLabel.text = [NSString stringWithFormat:@"%0.1f", self.fontWeightStepper.value];
	}
	
	[self update];
}

- (void)fontSizeSliderSlided:(UISlider *)slider {
	
	self.fontSizeLabel.text = [NSString stringWithFormat:@"%0.1f", self.fontSizeSlider.value];
	
	[self update];
}

- (void)kernSliderSlided:(UISlider *)slider {
	
	self.kernLabel.text = [NSString stringWithFormat:@"%0.1f", self.kernSlider.value];
	
	[self update];
}

- (void)lineSpacingSliderSlided:(UISlider *)slider {
	
	self.lineSpacingLabel.text = [NSString stringWithFormat:@"%0.1f", self.lineSpacingSlider.value];
	
	[self update];
}

- (void)fontItemTapped:(id)sender {
	
	FSIFontsTableViewController *viewController = [[FSIFontsTableViewController alloc] initWithStyle:UITableViewStylePlain];
	viewController.delegate = self;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	[self.navigationController presentViewController:navigationController
											animated:YES
										  completion:NULL];
}

- (void)textItemTapped:(id)sender {
	
	FSITextViewController *viewController = [[FSITextViewController alloc] initWithNibName:@"FSITextViewController" bundle:nil];
	viewController.delegate = self;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	[self.navigationController presentViewController:navigationController
											animated:YES
										  completion:^{
											  viewController.textView.text = self.singleLineLabel.text;
										  }];
}

- (void)styleItemTapped:(id)sender {
	
	FSIStylesTableViewController *viewController = [[FSIStylesTableViewController alloc] initWithStyle:UITableViewStylePlain];
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	[self.navigationController presentViewController:navigationController
											animated:YES
										  completion:NULL];
}

- (void)fontWeightLabelTapped:(UITapGestureRecognizer *)tapper {
	
//	2020-06-09 17:19:34.538188+0800 FontSizeInspector[23683:3232238] *** Terminating app due to uncaught exception 'NSGenericException', reason: 'Your application has presented a UIAlertController (<UIAlertController: 0x7f91d8008200>) of style UIAlertControllerStyleActionSheet from UINavigationController (<UINavigationController: 0x7f91d7808200>). The modalPresentationStyle of a UIAlertController with this style is UIModalPresentationPopover. You must provide location information for this popover through the alert controller's popoverPresentationController. You must provide either a sourceView and sourceRect or a barButtonItem.  If this information is not known when you present the alert controller, you may provide it in the UIPopoverPresentationControllerDelegate method -prepareForPopoverPresentation.'
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Choose a Font Weight"
																   message:nil
															preferredStyle:UIAlertControllerStyleActionSheet];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Ultra Light"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightUltraLight;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Thin"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightThin;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Light"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightLight;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Regular"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightRegular;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Medium"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightMedium;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Semibold"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightSemibold;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Bold"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightBold;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Heavy"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightHeavy;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Black"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		self.fontWeightStepper.value = UIFontWeightBlack;
		[self fontWeightStepperChanged:self.fontWeightStepper];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
											  style:UIAlertActionStyleCancel
											handler:^(UIAlertAction * _Nonnull action) {
		
	}]];
	
	alert.popoverPresentationController.sourceView = tapper.view;
	
	[self presentViewController:alert animated:YES completion:nil];
}

- (void)fontSizeLabelTapped:(UITapGestureRecognizer *)tapper {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Input a Font Size"
																   message:nil
															preferredStyle:UIAlertControllerStyleAlert];
	
	[alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		textField.keyboardType = UIKeyboardTypeNumberPad;
	}];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"OK"
											  style:UIAlertActionStyleDefault
											handler:^(UIAlertAction * _Nonnull action) {
		
		UITextField *textField = alert.textFields.firstObject;
		
		self.fontSizeSlider.value = textField.text.floatValue;
		[self fontSizeSliderSlided:self.fontSizeSlider];
	}]];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
											  style:UIAlertActionStyleCancel
											handler:^(UIAlertAction * _Nonnull action) {
		
	}]];
	
	[self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - private

- (void)update {
	
	UIFont *font;
	
	if (self.fontName) {
		
		self.fontWeightContainer.hidden = YES;
		font = [UIFont fontWithName:self.fontName size:self.fontSizeSlider.value];
		
	} else {
		
		self.fontWeightContainer.hidden = NO;
		font = [UIFont systemFontOfSize:self.fontSizeSlider.value weight:self.fontWeightStepper.value];
	}
	
	NSNumber *kern = [NSNumber numberWithFloat:self.kernSlider.value];
	
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.lineSpacing = self.lineSpacingSlider.value;
	
	
	
	CGRect boundingRect = CGRectZero;
	
	NSDictionary *attributes = @{NSFontAttributeName : font,
								 NSKernAttributeName : kern,
								 NSParagraphStyleAttributeName : paragraphStyle};
	
	NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.singleLineLabel.text];
	[attributedText setAttributes:attributes range:NSMakeRange(0, attributedText.length)];
	self.singleLineLabel.attributedText = attributedText;
	
	boundingRect = [self.singleLineLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
														   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
														attributes:attributes
														   context:nil];
	boundingRect = CGRectIntegral(boundingRect);
	
	self.fontHeightLabel.text = [NSString stringWithFormat:@"single line height: %0.1f", boundingRect.size.height];
	
	
	
	attributedText = [[NSMutableAttributedString alloc] initWithString:self.doubleLinesLabel.text];
	[attributedText setAttributes:attributes range:NSMakeRange(0, attributedText.length)];
	self.doubleLinesLabel.attributedText = attributedText;
}

#pragma mark - FSITextViewControllerDelegate

- (void)textViewControllerDidEndEditing:(FSITextViewController *)viewController {
	
	NSString *text = viewController.textView.text;
	
	self.singleLineLabel.text = text;
	self.doubleLinesLabel.text = [NSString stringWithFormat:@"%@ %@ %@", text, text, text];
	
	[self update];
}

#pragma mark - FSIFontsTableViewControllerDelegate

- (void)fontsTableViewController:(FSIFontsTableViewController *)viewController didSelectFontFamilyName:(NSString *)familyName {
	
	self.fontName = familyName;
	
	[self update];
}

@end
