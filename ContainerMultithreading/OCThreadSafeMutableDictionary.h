//
//  OCThreadSafeMutableDictionary.h
//  ContainerMultithreading
//
//  Created by Shen Kai on 2017/4/8.
//  Copyright © 2017年 SkyShen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCThreadSafeMutableDictionary<KeyType, ObjectType> : NSObject

- (nullable ObjectType)objectForKeyedSubscript:(KeyType _Nonnull )key;

- (void)setObject:(nullable ObjectType)obj forKeyedSubscript:(KeyType <NSCopying> _Nonnull)key;
@end
