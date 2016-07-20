//
//  FSIFontsTableViewController.h
//  FontSizeInspector
//
//  Created by Sean Chen on 16/7/19.
//  Copyright © 2016年 Douguo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FSIFontsTableViewControllerDelegate;



@interface FSIFontsTableViewController : UITableViewController

@property (nonatomic, weak) id<FSIFontsTableViewControllerDelegate> delegate;

@end



@protocol FSIFontsTableViewControllerDelegate <NSObject>

- (void)fontsTableViewController:(FSIFontsTableViewController *)viewController didSelectFontFamilyName:(NSString *)familyName;

@end
