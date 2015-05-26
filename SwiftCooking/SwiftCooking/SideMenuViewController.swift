//
//  SideMenuViewController.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 16/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var menu: UIVisualEffectView!
    @IBOutlet weak var viewVerticalSeparator: UIView!

    var delegate: SideMenuDelegate?
    
    
    
    let cellIdentifier = "cell"
    let menuOptions = ["Option1", "Option2"]
    let menuImages = ["clock", "clock"]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func removeViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    func setupLayout(){
        
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRectMake(0, 0, 2, SCREEN_HEIGHT)
        gradient.colors = [UIColor.lightGrayColor().CGColor, UIColor.grayColor().CGColor ];
        viewVerticalSeparator.layer.insertSublayer(gradient, atIndex: 0)
    }

    
    
    // MARK - Side Menu Table View
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SideMenuTableViewCell
        
        let row = indexPath.row
        
        cell.cellImage.image = UIImage(named: menuImages[indexPath.item])
        cell.cellLabel.text = menuOptions[indexPath.item]
        
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.dismissViewControllerAnimated(true, completion: {
            
        
            self.delegate?.SideMenuDidSelectOptionAtIndex(1)
        });
        
        
        
        
        //self.dismissViewControllerAnimated(true, completion: {
        
        //    var loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            
        //    let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
       //    var navigationController = appDelegate.window!.rootViewController as! UINavigationController
            
       //     var MainViewController = navigationController.viewControllers[0] as! MainMenuViewController
            
       //     navigationController.pushViewController(loginVC, animated: true)
            
            //MainViewController.presentViewController(loginVC, animated: true, completion: nil)
            
            //navigationController.presentViewController(loginVC, animated: true, completion: nil)
            
            
            
            //MainViewController.performSegueWithIdentifier("segueShowLogin", sender: nil)
            
            //navigationController.popToRootViewControllerAnimated(true)
            //navigationController.pushViewController(loginVC, animated: true)
            
            
            
            
            //let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
            //let viewController = appDelegate.window!.rootViewController as! UINavigationController
        
            //var mainMenu = viewController.viewControllers[0] as! MainMenuViewController
            
            
            //mainMenu.performSegueWithIdentifier("segueShowLogin", sender: nil)
            
       // })
            
        //
        
        
        
        
    }
    

}
