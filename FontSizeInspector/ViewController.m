//
//  ViewController.m
//  FontSizeInspector
//
//  Created by Sean Chen on 11/5/14.
//  Copyright (c) 2014 Douguo Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.fontSizeLabel.text = [NSString stringWithFormat:@"%0.1f", self.fontSizeSlider.value];
	self.kernLabel.text = [NSString stringWithFormat:@"%0.1f", self.kernSlider.value];
	self.lineSpacingLabel.text = [NSString stringWithFormat:@"%0.1f", self.lineSpacingSlider.value];
	
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

#pragma mark - private

- (void)update {
	
	UIFont *font = [UIFont systemFontOfSize:self.fontSizeSlider.value];
//	UIFont *font = [UIFont fontWithName:@"HiraKakuProN-W3" size:value];
//	UIFont *font = [UIFont fontWithName:@"FZLanTingHeiS-L-GB" size:value];
	
	NSNumber *kern = [NSNumber numberWithFloat:self.kernSlider.value];
	
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.lineSpacing = self.lineSpacingSlider.value;
	
	
	
	CGRect rect = CGRectZero;
	CGSize size = CGSizeZero;
	CGSize constrainedSize = CGSizeMake(self.singleLineLabel.frame.size.width, CGFLOAT_MAX);
	
	
	
	NSDictionary *attributes = @{NSFontAttributeName : font,
								 NSKernAttributeName : kern,
								 NSParagraphStyleAttributeName : paragraphStyle};
	
	NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.singleLineLabel.text];
	[attributedText setAttributes:attributes range:NSMakeRange(0, attributedText.length)];
	self.singleLineLabel.attributedText = attributedText;
	
	rect = self.singleLineLabel.frame;
	size = [self.singleLineLabel.text boundingRectWithSize:constrainedSize
												   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
												attributes:attributes
												   context:nil].size;
	rect.size.height = size.height;
	self.singleLineLabel.frame = rect;
	
	self.fontHeightLabel.text = [NSString stringWithFormat:@"single line height: %0.1f", size.height];
	
	
	
	attributedText = [[NSMutableAttributedString alloc] initWithString:self.doubleLinesLabel.text];
	[attributedText setAttributes:attributes range:NSMakeRange(0, attributedText.length)];
	self.doubleLinesLabel.attributedText = attributedText;
	
	rect = self.doubleLinesLabel.frame;
	size = [self.doubleLinesLabel.text boundingRectWithSize:constrainedSize
													options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
												 attributes:attributes
													context:nil].size;
	rect.size.height = size.height;
	self.doubleLinesLabel.frame = rect;
	
	self.doubleLinesLabel.center = self.view.center;
}

@end
