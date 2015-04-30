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
	NSDictionary *dictionary = @{ @"一樂拉麵" :@{ @"item":@[@"一樂拉麵", @"麵", @"肉", @"豬肉", @"牛肉", @"羊肉"],
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
    self.autoCompleteTextField.style = DSKAutoCompleteStyleDropDown;
	self.autoCompleteTextField.dataSource = dictionary;


	NSDictionary *dictionary2 = @{ @"水族館" :@{ @"item":@[@"水族館", @"魚"],
									          @"weight": @(0.9) }
	};
	self.autoCompleteTextField2.style = DSKAutoCompleteStyleKeyboard;
	self.autoCompleteTextField2.dataSource = dictionary2;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

@end
