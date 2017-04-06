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
    var operation : BlockOperation?
    
    var dictionary : [String : String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operation = BlockOperation()
//        dictionary = dic
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func threadSafeWay(_ sender: UIButton) {
        operation!.addExecutionBlock(safeCopyingDictionaryClosure)
    }

    @IBAction func nonThreadSafeWay(_ sender: UIButton) {
        operation!.addExecutionBlock(unsafeCopyingDictionaryClosure)
    }
    
    
    // MARK: - closure to operate dictionary
    
    var safeCopyingDictionaryClosure = { () -> Void in
        while(runningWay != .none){
            
        }
    }
    
    var unsafeCopyingDictionaryClosure = { () -> Void in
        
    }
}








