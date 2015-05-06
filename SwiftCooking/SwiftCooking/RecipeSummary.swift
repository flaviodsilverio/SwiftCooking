//
//  RecipeSummary.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 05/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class RecipeSummary: UIViewController {

    @IBOutlet weak var childView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clearColor()
        childView.backgroundColor = UIColor.whiteColor()
        var list : [String] = [String]()
        compare(["","",""], list2: list)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func compare(list1:[String], list2:[String]){
    
        if(list1.count != list2.count){
        
        
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
