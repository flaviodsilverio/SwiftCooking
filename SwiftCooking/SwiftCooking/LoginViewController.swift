//
//  LoginViewController.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 18/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var viewTopSeparator: UIView!
    
    @IBOutlet weak var txtLoginEmail: UITextField!
    @IBOutlet weak var txtLoginPassword: UITextField!
    @IBOutlet weak var btnSignInFacebook: UIButton!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHasShown:", name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHasHidden:", name: UIKeyboardWillHideNotification, object: nil)
        
        setupLayout()
        
        
        mainScrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tapGestureRecognized:"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func btnLoginClick(sender: AnyObject) {
        txtLoginEmail.resignFirstResponder()
        txtLoginPassword.resignFirstResponder()
    }
    
    
    func tapGestureRecognized(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    
    func keyboardHasShown(aNotification: NSNotification)
    {
        var info: NSDictionary = aNotification.userInfo!
        var kbSize: CGSize  = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.CGRectValue().size

        self.mainScrollView.setContentOffset(CGPointMake(0, kbSize.height), animated: true)
    }
    
    func keyboardHasHidden(aNotification: NSNotification){
        self.mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    
    func setupLayout(){
        
        // Setup Top Separator Color
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRectMake(0, 0, SCREEN_WIDTH, 4)
        gradient.colors = [UIColor.groupTableViewBackgroundColor().CGColor, UIColor.grayColor().CGColor ];
        viewTopSeparator.layer.insertSublayer(gradient, atIndex: 0)
        
        
        // Add round corners to Social buttons
        btnSignInFacebook.layer.cornerRadius = 10
        btnSignInFacebook.clipsToBounds = true
        

        txtLoginEmail.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        txtLoginPassword.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        
    }
    
    
    
    
}
