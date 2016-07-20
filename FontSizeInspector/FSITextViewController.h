//
//  FSITextViewController.h
//  FontSizeInspector
//
//  Created by Sean Chen on 16/7/19.
//  Copyright © 2016年 Douguo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FSITextViewControllerDelegate;



@interface FSITextViewController : UIViewController

@property (nonatomic, weak) id<FSITextViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end



@protocol FSITextViewControllerDelegate <NSObject>

- (void)textViewControllerDidEndEditing:(FSITextViewController *)viewController;

@end
