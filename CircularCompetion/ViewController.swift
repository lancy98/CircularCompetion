//
//  ViewController.swift
//  CircularCompetion
//
//  Created by Lancy on 22/05/15.
//  Copyright (c) 2015 Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progressView: ProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progressView.progress = 0.4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

