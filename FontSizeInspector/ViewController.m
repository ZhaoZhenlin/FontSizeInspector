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
	[self slided:self.slider];
}

- (void)slided:(UISlider *)slider {
	
	//	NSLog(@"slider %@", slider);
	
	CGFloat value = slider.value;
	UIFont *font = [UIFont systemFontOfSize:value];
	//	UIFont *font = [UIFont fontWithName:@"HiraKakuProN-W3" size:value];
	//	UIFont *font = [UIFont fontWithName:@"FZLanTingHeiS-L-GB" size:value];
	
	
	
	self.singleLineLabel.font = font;
	self.doubleLinesLabel.font = font;
	
	
	
	CGRect rect = CGRectZero;
	CGSize size = CGSizeZero;
	CGSize constrainedSize = CGSizeMake(self.singleLineLabel.frame.size.width, CGFLOAT_MAX);
	
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	
	
	
	NSDictionary *attributes = @{NSFontAttributeName : font,
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
	
	self.fontHeightLabel.text = [NSString stringWithFormat:@"%0.1f", size.height];
	
	
	
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
	self.fontSizeLabel.text = [NSString stringWithFormat:@"%0.1f", value];
}

@end
