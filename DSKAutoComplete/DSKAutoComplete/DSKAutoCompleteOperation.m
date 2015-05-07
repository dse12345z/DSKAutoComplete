//
//  DSKAutoCompleteOperation.m
//  DSKAutoComplete
//
//  Created by DaidoujiChen on 2015/5/7.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "DSKAutoCompleteOperation.h"

#define DSKCheckOperationIsCancelled(code) if ([self isCancelled]) { code; return; }

@implementation DSKAutoCompleteOperation

#pragma mark - methods to override

- (void)main {
    DSKCheckOperationIsCancelled()
    
    NSArray * returnArray = nil;
    //長度大於零才搜尋
    if (self.currentTextField.text.length > 0) {
        //建立模糊搜尋語法。
        NSPredicate *pred = [NSPredicate predicateWithFormat:[self predicateStr]];
        
        NSMutableDictionary *cacheDic = [NSMutableDictionary dictionaryWithDictionary:self.dataSource];
        [cacheDic enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
            DSKCheckOperationIsCancelled(*stop = YES)
            
            //搜尋 key 底下所有 value，count 等於零表示沒有搜尋到所以將其移除。
            if ([obj[@"tags"] filteredArrayUsingPredicate:pred].count == 0) {
                [cacheDic removeObjectForKey:key];
            }
        }];
        
        DSKCheckOperationIsCancelled()
        
        //取 dictionary 所有 key，大於零才做排序（按照權重排序）。
        if (cacheDic.allKeys > 0) {
            returnArray = [self sortAllKeys:cacheDic];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.delegate updatingResult:returnArray];
    });
}

#pragma mark - private instance method

- (NSString *)predicateStr {
    NSString *predicateStr = @"SELF like[cd] '*";
    for (int i = 0; i < self.currentTextField.text.length; i++) {
        predicateStr = [NSString stringWithFormat:@"%@%@*", predicateStr, [self.currentTextField.text substringWithRange:NSMakeRange(i, 1)]];
    }
    predicateStr = [NSString stringWithFormat:@"%@'", predicateStr];
    return predicateStr;
}

- (NSArray *)sortAllKeys:(NSMutableDictionary *)cacheDic {
    return [cacheDic keysSortedByValueUsingComparator: ^NSComparisonResult (id obj1, id obj2) {
        return [obj2[@"weight"] compare:obj1[@"weight"]];
    }];
}

@end
