//
//  ViewController.swift
//  MQSlideAnimation
//
//  Created by 120v on 2018/8/17.
//  Copyright © 2018年 MQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func slideAction(_ sender: Any) {
        MQSlideViewController.show(superView: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

