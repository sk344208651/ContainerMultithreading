//
//  ThreadSafeDictionary.swift
//  ContainerMultithreading
//
//  Created by Shen Kai on 2017/4/8.
//  Copyright © 2017年 SkyShen. All rights reserved.
//

import UIKit

class ThreadSafeDictionary<Key, Value>: NSObject where Key : Hashable{
    
    var dictionary = Dictionary<Key, Value>()
    
    let lock = NSLock()
    
    //自定义了下标方法，如果需要还可以按照这种方式重载其他的方法
    public subscript(key: Key) -> Value?{
        
        get {
            lock.lock()
            let value = dictionary[key]
            lock.unlock()
            return value
        }
        
        set(value) {
            lock.lock()
            dictionary[key] = value
            lock.unlock()
        }
        
    }
}
