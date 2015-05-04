//
//  ViewController.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/28.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (IBAction)pushSecondViewControllerAction:(id)sender {
	[self presentViewController:[SecondViewController new] animated:YES completion: ^{
	}];
}

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.autoCompleteTextField setDataSourceItemTag:@"一樂拉麵"
	                                            item:@[@"一樂拉麵", @"麵", @"肉", @"豬肉", @"牛肉", @"羊肉"]
	                                          weight:@(0.9)];
	[self.autoCompleteTextField setDataSourceItemTag:@"燒肉蓋飯"
	                                            item:@[@"燒肉蓋飯", @"飯", @"肉", @"豬肉", @"牛肉", @"羊肉"]
	                                          weight:@(0.2)];
	[self.autoCompleteTextField setDataSourceItemTag:@"肉類專賣店"
	                                            item:@[@"肉類專賣店", @"肉", @"豬肉", @"牛肉", @"羊肉"]
	                                          weight:@(0.5)];
	[self.autoCompleteTextField setDataSourceItemTag:@"可麗餅"
	                                            item:@[@"可麗餅", @"點心", @"甜點"]
	                                          weight:@(0.5)];
	[self.autoCompleteTextField setDataSourceItemTag:@"車輪餅"
	                                            item:@[@"車輪餅", @"點心", @"甜點"]
	                                          weight:@(0.5)];
	[self.autoCompleteTextField setDataSourceItemTag:@"中古汽車買賣店"
	                                            item:@[@"中古汽車買賣店", @"車"]
	                                          weight:@(0.5)];
	[self.autoCompleteTextField setDataSourceItemTag:@"汽車貸款"
	                                            item:@[@"汽車貸款", @"中古汽車買賣店", @"車"]
	                                          weight:@(0.5)];
	self.autoCompleteTextField.style = DSKAutoCompleteStyleDropDown;
	self.autoCompleteTextField.accessibilityLabel = @"TextFieldTests";



	self.autoCompleteTextField2.dataSource = self.autoCompleteTextField.dataSource;

	NSArray *itemTag = @[@"水族館遊樂園", @"蟹堡王", @"探險活寶"];
	NSArray *itemArray = @[@[@"水族館遊樂園", @"魚"],
	                       @[@"蟹堡王", @"魚", @"蟹老闆", @"海綿寶寶"],
	                       @[@"探險活寶", @"老皮", @"阿寶"]];
	NSArray *itemWeight = @[@(0.5), @(0.7), @(1.0)];

	for (int i = 0; i < itemTag.count; i++) {
		[self.autoCompleteTextField2 setDataSourceItemTag:itemTag[i]
		                                             item:itemArray[i]
		                                           weight:itemWeight[i]];
	}

	self.autoCompleteTextField2.style = DSKAutoCompleteStyleKeyboard;
	self.autoCompleteTextField2.accessibilityLabel = @"TextFieldTests2";
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

@end
