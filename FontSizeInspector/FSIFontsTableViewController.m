//
//  FSIFontsTableViewController.m
//  FontSizeInspector
//
//  Created by Sean Chen on 16/7/19.
//  Copyright © 2016年 Douguo Inc. All rights reserved.
//

#import "FSIFontsTableViewController.h"

@interface FSIFontsTableViewController ()

@property (nonatomic, strong) NSArray *familyNames;
@property (nonatomic, strong) NSMutableDictionary *fontNames;

@end

@implementation FSIFontsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Fonts";
	
	UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																 style:UIBarButtonItemStylePlain
																target:self
																action:@selector(dismiss:)];
	
	UIBarButtonItem *resetItem = [[UIBarButtonItem alloc] initWithTitle:@"Reset"
																  style:UIBarButtonItemStylePlain
																 target:self
																 action:@selector(reset:)];
	
	self.navigationItem.rightBarButtonItems = @[doneItem, resetItem];
	
	
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
	
	
	
	self.familyNames = [UIFont familyNames];
	self.fontNames = [NSMutableDictionary dictionaryWithCapacity:0];
	
	for (NSString *familyName in self.familyNames) {
		
		NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
		
		if (fontNames.count) {
			[self.fontNames setObject:fontNames forKey:familyName];
		} else {
			[self.fontNames setObject:@[familyName] forKey:familyName];
		}
	}
}

- (void)dismiss:(id)sender {
	[self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)reset:(id)sender {
	
	[self.delegate fontsTableViewController:self didSelectFontFamilyName:nil];
	[self dismiss:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.familyNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSString *familyName = self.familyNames[section];
	NSArray *fontNames = self.fontNames[familyName];
	
	return fontNames.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return self.familyNames[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
	
	NSString *familyName = self.familyNames[indexPath.section];
	NSString *fontName = self.fontNames[familyName][indexPath.row];
	cell.textLabel.text = fontName;
	
	UIFont *font = [UIFont fontWithName:fontName size:17.0];
	cell.textLabel.font = font;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *familyName = self.familyNames[indexPath.section];
	NSString *fontName = self.fontNames[familyName][indexPath.row];
	[self.delegate fontsTableViewController:self didSelectFontFamilyName:fontName];
	
	[self dismiss:nil];
}

@end
