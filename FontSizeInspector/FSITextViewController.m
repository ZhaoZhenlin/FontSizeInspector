//
//  FSITextViewController.m
//  FontSizeInspector
//
//  Created by Sean Chen on 16/7/19.
//  Copyright © 2016年 Douguo Inc. All rights reserved.
//

#import "FSITextViewController.h"

@interface FSITextViewController ()

@end

@implementation FSITextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Text";
	
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Done"
															 style:UIBarButtonItemStylePlain
															target:self
															action:@selector(dismiss:)];
	
	self.navigationItem.rightBarButtonItem = item;
}

- (void)dismiss:(id)sender {
	
	[self.delegate textViewControllerDidEndEditing:self];
	[self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
