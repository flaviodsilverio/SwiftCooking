//
//  ViewController.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 22/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBarHidden = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false

    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
    }

}

