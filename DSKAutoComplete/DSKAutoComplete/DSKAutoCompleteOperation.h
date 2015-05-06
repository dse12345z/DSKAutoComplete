//
//  DSKAutoCompleteOperation.h
//  DSKAutoComplete
//
//  Created by DaidoujiChen on 2015/5/7.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DSKAutoCompleteOperationDelegate;

@interface DSKAutoCompleteOperation : NSOperation

@property (nonatomic, weak) id <DSKAutoCompleteOperationDelegate> delegate;
@property (nonatomic, strong) UITextField *currentTextField;
@property (nonatomic, strong) NSMutableDictionary *dataSource;

@end

@protocol DSKAutoCompleteOperationDelegate <NSObject>

@required
- (void)updatingResult:(NSArray *)result;

@end