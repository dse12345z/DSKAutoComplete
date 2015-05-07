//
//  DSKAutoCompleteQuickMenu.m
//  DSKAutoComplete
//
//  Created by daisuke on 2015/4/23.
//  Copyright (c) 2015年 guante_lu. All rights reserved.
//

#import "DSKAutoCompleteQuickMenu.h"
#import <objc/runtime.h>

#define DSKQuicklyMenuHeight 90

@interface DSKAutoCompleteQuickMenu ()

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) NSOperationQueue *quickQueue;

@end

@implementation DSKAutoCompleteQuickMenu

- (UITextField *)currentTextField {
	return (UITextField *)self.delegate;
}

#pragma mark - life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.quickQueue = [NSOperationQueue new];
    }
    return self;
}

#pragma mark - instance method

- (void)tableviewWithStyle:(DSKAutoCompleteStyle)style {
	[self.quickMenu removeFromSuperview];
	self.quickMenu = nil;
	self.quickMenu = [UITableView new];
	self.quickMenu.delegate = self;
	self.quickMenu.dataSource = self;
	self.quickMenu.layer.borderWidth = 0.5;
	self.quickMenu.layer.cornerRadius = 5.0;
	self.quickMenu.layer.borderColor = [UIColor grayColor].CGColor;
	self.quickMenu.separatorStyle = UITableViewCellSeparatorStyleNone;
	[self.quickMenu registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DSKAutoCompleteQuickMenu"];
}

- (void)hidden {
	NSAssert(0, @"you must override this method");
}

- (void)show {
	NSAssert(0, @"you must override this method");
}

- (void)refreshDataUsing:(NSMutableDictionary *)dataSource {
    [self.quickQueue cancelAllOperations];
    DSKAutoCompleteOperation *newOperation = [DSKAutoCompleteOperation new];
    newOperation.currentTextField = [self currentTextField];
    newOperation.dataSource = dataSource;
    newOperation.delegate = self;
    [self.quickQueue addOperation:newOperation];
}

#pragma mark - private method

- (NSMutableAttributedString *)drawColorString:(NSString *)oStr ruleString:(NSString *)rStr {
    NSMutableAttributedString *dataStr = [[NSMutableAttributedString alloc] initWithString:oStr];
    
    int rStrIndex = 0; //規則字串的單字索引
    
    for (int i = 0; i < oStr.length; i++) {
        NSRange currentWordRange = NSMakeRange(i, 1);
        NSString *rStrOneWord = [rStr substringWithRange:NSMakeRange(rStrIndex, 1)];
        NSString *oStrOneWord = [oStr substringWithRange:currentWordRange];
        
        //比較兩個字是否一樣，一樣就上色。
        if ([oStrOneWord caseInsensitiveCompare:rStrOneWord] == NSOrderedSame) {
            [dataStr addAttribute:NSForegroundColorAttributeName
                            value:[UIColor redColor]
                            range:NSMakeRange(currentWordRange.location, currentWordRange.length)];
            rStrIndex++;
        }
        
        //規則字串的單字索引等於規則字串就返回
        if (rStrIndex == rStr.length) {
            break;
        }
    }
    return dataStr;
}

#pragma mark - DSKAutoCompleteOperationDelegate

- (void)updatingResult:(NSArray *)result {
    self.results = result;
    [self.quickMenu reloadData];
}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.delegate tableViewDidSelect:self.results[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *headerView = [UIView new];
	headerView.backgroundColor = [UIColor clearColor];
	return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 5;
}

#pragma mark - tableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"DSKAutoCompleteQuickMenu";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
	if ([self currentTextField].text.length != 0) {
		NSAttributedString *colorString = [self drawColorString:self.results[indexPath.row]
		                                             ruleString:[self currentTextField].text];
		cell.textLabel.attributedText = colorString;
	}
	else {
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.text = self.results[indexPath.row];
	}
	return cell;
}

@end
