//
//  ViewController.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 22/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, SideMenuDelegate {

    
    @IBOutlet weak var btnStartCooking: UIButton!
    @IBOutlet weak var btnFavourites: UIButton!
    @IBOutlet weak var btnMyRecipes: UIButton!
    @IBOutlet weak var btnFriendsRecipes: UIButton!
    @IBOutlet weak var btnShoppingCart: UIButton!
    
    
    var showFromSideMenu = false
    
    var sideMenuTransition = SideMenuTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.sideMenuTransition.sourceViewController = self
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
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func SideMenuDidSelectOptionAtIndex(index: Int){
        
        // Do segue
        showFromSideMenu = true
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if showFromSideMenu {
            self.performSegueWithIdentifier("segueShowLogin", sender: nil)
            
            showFromSideMenu = false
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showSideMenuSegue" {
                      
            let sideMenuVC = segue.destinationViewController as! SideMenuViewController
            sideMenuVC.transitioningDelegate = sideMenuTransition
            //sideMenuVC.delegate = self
            
            self.sideMenuTransition.destinationViewController = sideMenuVC
            
            sideMenuVC.delegate = self
            
        }
        
    }
    
    
    

}

