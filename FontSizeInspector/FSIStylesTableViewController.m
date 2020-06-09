//
//  FSIStylesTableViewController.m
//  FontSizeInspector
//
//  Created by Sean Chen on 2020/6/9.
//  Copyright © 2020 Douguo Inc. All rights reserved.
//

#import "FSIStylesTableViewController.h"

@interface FSIStylesTableViewController ()

@property (nonatomic, strong) NSMutableArray *fontStyles;

@end

@implementation FSIStylesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Styles";
    
	UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																 style:UIBarButtonItemStylePlain
																target:self
																action:@selector(dismiss:)];
	
	self.navigationItem.rightBarButtonItems = @[doneItem];
	
	
	
	self.fontStyles = [NSMutableArray arrayWithCapacity:0];
	
	if (@available(iOS 11.0, *)) {
		[self.fontStyles addObject:UIFontTextStyleLargeTitle];
	}
	
	[self.fontStyles addObject:UIFontTextStyleTitle1];
	[self.fontStyles addObject:UIFontTextStyleTitle2];
	[self.fontStyles addObject:UIFontTextStyleTitle3];
	[self.fontStyles addObject:UIFontTextStyleHeadline];
	[self.fontStyles addObject:UIFontTextStyleBody];
	[self.fontStyles addObject:UIFontTextStyleCallout];
	[self.fontStyles addObject:UIFontTextStyleFootnote];
	[self.fontStyles addObject:UIFontTextStyleCaption1];
	[self.fontStyles addObject:UIFontTextStyleCaption2];
}

- (void)dismiss:(id)sender {
	[self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.fontStyles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
	
	if (!cell) {
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
		
		cell.textLabel.numberOfLines = 0;
		cell.detailTextLabel.numberOfLines = 0;
		cell.detailTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
	}
	
	NSString *style = self.fontStyles[indexPath.row];
	
	cell.textLabel.text = style;
	cell.textLabel.font = [UIFont preferredFontForTextStyle:style];
	cell.detailTextLabel.text = cell.textLabel.font.debugDescription;
	
	return cell;
}

@end
