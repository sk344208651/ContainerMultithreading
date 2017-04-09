//
//  ThreadSafeDictionary.swift
//  ContainerMultithreading
//
//  Created by Shen Kai on 2017/4/8.
//  Copyright © 2017年 SkyShen. All rights reserved.
//

import UIKit

class ThreadSafeDictionary<Key, Value>: NSObject where Key : Hashable{
    
    var dictionary = Dictionary<Key, Value>()//持有系统的Dictionary对象
    
    let lock = NSLock()//定义一个同步所
    
    //自定义了下标方法，如果需要还可以按照这种方式重载其他的方法
    public subscript(key: Key) -> Value?{
        
        get {
            lock.lock()//操作之前上锁
            let value = dictionary[key]//调用系统方法
            lock.unlock()//解锁
            return value
        }
        
        set(value) {
            lock.lock()
            dictionary[key] = value
            lock.unlock()
        }
        
    }
}
