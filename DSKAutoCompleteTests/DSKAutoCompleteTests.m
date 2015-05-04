//
//  DSKAutoCompleteTests.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/30.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface DSKAutoCompleteTests : KIFTestCase

@end

@implementation DSKAutoCompleteTests

- (void)beforeEach {
	[tester waitForTimeInterval:2.0f];
}

- (void)afterEach {
	[tester waitForTimeInterval:2.0f];
}

- (void)testEnterText {
	[tester tapViewWithAccessibilityLabel:@"TextFieldTests"];
	[tester clearTextFromFirstResponder];
	[tester waitForTimeInterval:1.0f];

	[self enterText:@[@"肉", @"類", @"專", @"賣", @"店"]];
	[tester tapViewWithAccessibilityLabel:@"確認"];
	[tester tapViewWithAccessibilityLabel:@"完成"];
}

- (void)testAutoComplete {
	[tester tapViewWithAccessibilityLabel:@"TextFieldTests2"];
	[tester clearTextFromFirstResponder];
	[tester waitForTimeInterval:1.0f];

	[self enterText:@[@"水"]];

	[tester waitForTimeInterval:1.0f];
	[tester tapViewWithAccessibilityLabel:@"水族館遊樂園"];
	[tester waitForTimeInterval:2.0f];
	[tester tapViewWithAccessibilityLabel:@"完成"];
}

- (void)testTag {
	[tester tapViewWithAccessibilityLabel:@"TextFieldTests"];
	[tester clearTextFromFirstResponder];
	[tester waitForTimeInterval:1.0f];

	[self enterText:@[@"肉"]];
	[tester waitForTimeInterval:1.0f];
	[tester tapViewWithAccessibilityLabel:@"一樂拉麵"];
	[tester tapViewWithAccessibilityLabel:@"完成"];
}

#pragma mark - private

- (void)enterText:(NSArray *)wordArray {
	for (NSString *str in wordArray) {
		[tester enterTextIntoCurrentFirstResponder:str];
		[tester waitForTimeInterval:0.5f];
	}
}

@end
