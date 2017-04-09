//
//  OCViewController.m
//  ContainerMultithreading
//
//  Created by Shen Kai on 2017/4/8.
//  Copyright © 2017年 SkyShen. All rights reserved.
//

#import "OCViewController.h"
#import "OCThreadSafeMutableDictionary.h"

typedef enum : NSUInteger {
    ThreadSafeNone,
    ThreadSafeSafe,
    ThreadSafeUnSafe,
} ThreadSafe;

@interface OCViewController (){
    NSMutableDictionary *dictionary;
    OCThreadSafeMutableDictionary *safeDictionary;
    NSOperationQueue *operationQueue;
    ThreadSafe threadsafe;
}

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dictionary = [NSMutableDictionary dictionary];
    safeDictionary = [[OCThreadSafeMutableDictionary alloc] init];
    operationQueue = [[NSOperationQueue alloc] init];
    threadsafe = ThreadSafeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)threadSafeButtonPressed:(UIButton *)sender {
    threadsafe = ThreadSafeSafe;
    
    [operationQueue addOperationWithBlock:^(){
        while (threadsafe == ThreadSafeSafe) {
            safeDictionary[@"111"] = [NSDate date].description;
            safeDictionary[@"222"] = [NSDate date].description;
            NSLog(@"%@",safeDictionary[@"111"]);
        }
    }];
    
    [operationQueue addOperationWithBlock:^(){
        while (threadsafe == ThreadSafeSafe) {
            safeDictionary[@"111"] = nil;
        }
    }];
}

- (IBAction)nonThreadSafeButtonPressed:(id)sender {
    threadsafe = ThreadSafeUnSafe;
    
    [operationQueue addOperationWithBlock:^(){
        while (threadsafe == ThreadSafeUnSafe) {
            dictionary[@"111"] = [NSDate date].description;
            dictionary[@"222"] = [NSDate date].description;
            NSLog(@"%@",dictionary[@"111"]);
        }
    }];
    
    [operationQueue addOperationWithBlock:^(){
        while (threadsafe == ThreadSafeUnSafe) {
            dictionary[@"111"] = nil;
        }
    }];
}

- (IBAction)stopButtonPressed:(id)sender {
    threadsafe = ThreadSafeNone;
}

@end
