//
//  ViewController.swift
//  ContainerMultithreading
//
//  Created by Shen Kai on 2017/3/26.
//  Copyright © 2017年 SkyShen. All rights reserved.
//

import UIKit

enum ThreadRunningWay {
    case none
    case safe
    case unsafe
}

class ViewController: UIViewController {
    
    var threadSafewayContinuing = false
    var threadUnSafewayContinuing = false
    
    var runningWay : ThreadRunningWay = .none
    var operationQueue : OperationQueue?
    
    var dictionary : [String : String]?
    
    var threadSafeDictionary : ThreadSafeDictionary<String,String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operationQueue = OperationQueue()
        
        dictionary = Dictionary<String,String>()
        
        threadSafeDictionary = ThreadSafeDictionary<String,String>()
    }

    @IBAction func threadSafeWay(_ sender: UIButton) {
        runningWay = .safe
        
        operationQueue!.addOperation({ () -> Void in
            while self.runningWay == .safe {
                self.threadSafeDictionary!["111"] = NSDate().description
                print(self.threadSafeDictionary!["111"] ?? "nil")
            }
        })
        
        operationQueue!.addOperation({ () -> Void in
            while self.runningWay == .safe {
                self.threadSafeDictionary!["111"] = NSDate().description
                print(self.threadSafeDictionary!["111"] ?? "nil")
            }
        })
    }

    @IBAction func nonThreadSafeWay(_ sender: UIButton) {
        runningWay = .unsafe
        
        operationQueue!.addOperation({ () -> Void in
            while self.runningWay == .unsafe {
                self.dictionary!["111"] = NSDate().description
                print(self.dictionary!["111"] ?? "nil")
            }
        })
        
        operationQueue!.addOperation({ () -> Void in
            while self.runningWay == .unsafe {
                self.dictionary!["111"] = NSDate().description
                print(self.dictionary!["111"] ?? "nil")
            }
        })
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        runningWay = .none
    }
    
}








