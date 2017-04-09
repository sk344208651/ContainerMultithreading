//
//  OCThreadSafeMutableDictionary.m
//  ContainerMultithreading
//
//  Created by Shen Kai on 2017/4/8.
//  Copyright © 2017年 SkyShen. All rights reserved.
//

#import "OCThreadSafeMutableDictionary.h"

@interface OCThreadSafeMutableDictionary(){
    NSMutableDictionary *dictionary;
}

@end

@implementation OCThreadSafeMutableDictionary

-(instancetype)init{
    if (self = [super init]) {
        dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

//自定义了下标方法，如果需要还可以按照这种方式重载其他的方法
- (id)objectForKeyedSubscript:(id)key{
    id returnObject;
    @synchronized (self) {
        returnObject = dictionary[key];
    }
    return returnObject;
}

- (void)setObject:(id)obj forKeyedSubscript:(id)key{
    @synchronized (self) {
        dictionary[key] = obj;
    }
}


@end
