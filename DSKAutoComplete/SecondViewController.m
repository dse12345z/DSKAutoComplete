//
//  SecondViewController.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/29.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (IBAction)popViewButtonAction:(id)sender {
	[self dismissViewControllerAnimated:YES completion: ^{
	}];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.autoCompleteTextField.style = DSKAutoCompleteStyleKeyboard;
	self.autoCompleteTextField.dataSource = @{ @"一樂拉麵" :@{ @"item":@[@"一樂拉麵", @"麵", @"肉", @"豬肉", @"牛肉", @"羊肉"],
													           @"weight": @(0.9) },
		                                           @"燒肉蓋飯" :@{ @"item":@[@"燒肉蓋飯", @"飯", @"肉", @"豬肉", @"牛肉", @"羊肉"],
													           @"weight": @(0.2) },
		                                           @"肉類專賣店" :@{ @"item":@[@"肉類專賣店", @"肉", @"豬肉", @"牛肉", @"羊肉"],
													            @"weight": @(0.5) },
		                                           @"可麗餅" :@{ @"item":@[@"可麗餅", @"點心", @"甜點"],
													          @"weight": @(0.01) },
		                                           @"車輪餅" :@{ @"item":@[@"車輪餅", @"點心", @"甜點"],
													          @"weight": @(0.2) },
		                                           @"中古汽車買賣店" :@{ @"item":@[@"中古汽車買賣店", @"車"],
													              @"weight": @(0.1) },
		                                           @"汽車貸款" :@{ @"item":@[@"汽車貸款", @"中古汽車買賣店", @"車"],
													           @"weight": @(1.0) }
	};
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
