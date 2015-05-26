//
//  SideMenuTransition.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 16/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class SideMenuTransition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate, UIViewControllerInteractiveTransitioning {

    private var interactive: Bool = false
    private var presenting: Bool = false
    private var enterPanGesture: UIScreenEdgePanGestureRecognizer!
    private var exitPanGesture: UIPanGestureRecognizer!
    
    
    var sourceViewController: UIViewController! {
        didSet {
            // Associate a drag recognizer touch When the source View Controller is setted,
            self.enterPanGesture = UIScreenEdgePanGestureRecognizer()
            self.enterPanGesture.addTarget(self, action:"handleEnterPanGesture:")
            self.enterPanGesture.edges = UIRectEdge.Left
            self.sourceViewController.view.addGestureRecognizer(self.enterPanGesture)
        }
    }
    
    var destinationViewController : UIViewController! {
        didSet{
            self.exitPanGesture = UIPanGestureRecognizer()
            self.exitPanGesture.addTarget(self, action: "handleExitPanGesture:")
            self.destinationViewController.view.addGestureRecognizer(self.exitPanGesture)
        }
    }
    
    
    // MARK: *** UIViewControllerAnimatedTransition Protocol ***
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
        let container = transitionContext.containerView()
        
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        let sideMenuViewController = !self.presenting ? screens.from as! SideMenuViewController : screens.to as! SideMenuViewController
        let mainViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        
        
        let sideMenuView = sideMenuViewController.view
        let mainMenuView = mainViewController.view
        
        
        
        //let offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
        //let offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width, 0)
        
        
        if(self.presenting){
            sideMenuViewController.menu.transform = CGAffineTransformMakeTranslation(-250, 0)
            sideMenuView.alpha = 0
        }
        
        
        container.addSubview(mainMenuView)
        container.addSubview(sideMenuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        
        UIView.animateWithDuration(duration, delay: 0, options: nil, animations: {
            
            if (self.presenting) {
                
                sideMenuView.alpha = 1
                sideMenuViewController.menu.transform = CGAffineTransformIdentity
                
                
            }
            else {
              
                sideMenuView.alpha = 0
                sideMenuViewController.menu.transform = CGAffineTransformMakeTranslation(-250, 0)
            }

            
        }, completion: nil)
        
        
        
        
        
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: nil, animations: {
            
            
            if (self.presenting) {
                
                (self.sourceViewController as! MainMenuViewController).btnStartCooking.transform = CGAffineTransformMakeTranslation(container.frame.width + 20, 0)
                (self.sourceViewController as! MainMenuViewController).btnFavourites.transform = CGAffineTransformMakeTranslation(-container.frame.width - 20, 0)
                (self.sourceViewController as! MainMenuViewController).btnMyRecipes.transform = CGAffineTransformMakeTranslation(container.frame.width + 20, 0)
                (self.sourceViewController as! MainMenuViewController).btnFriendsRecipes.transform = CGAffineTransformMakeTranslation(-container.frame.width - 20 , 0)
                (self.sourceViewController as! MainMenuViewController).btnShoppingCart.transform = CGAffineTransformMakeTranslation(container.frame.width + 20, 0)
            }
            else {
                
                (self.sourceViewController as! MainMenuViewController).btnStartCooking.transform = CGAffineTransformIdentity
                (self.sourceViewController as! MainMenuViewController).btnFavourites.transform = CGAffineTransformIdentity
                (self.sourceViewController as! MainMenuViewController).btnMyRecipes.transform = CGAffineTransformIdentity
                (self.sourceViewController as! MainMenuViewController).btnFriendsRecipes.transform = CGAffineTransformIdentity
                (self.sourceViewController as! MainMenuViewController).btnShoppingCart.transform = CGAffineTransformIdentity
            }
            
            
            
            
            }, completion: { finished in
                
                if(transitionContext.transitionWasCancelled()){
                    
                    transitionContext.completeTransition(false)
                    // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
                    UIApplication.sharedApplication().keyWindow?.addSubview(screens.from.view)
                    
                }
                else {
                    
                    transitionContext.completeTransition(true)
                    // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
                    UIApplication.sharedApplication().keyWindow?.addSubview(screens.to.view)
                    
                }
                
        })
    }

    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    
    
    
    
    // MARK: *** UIViewControllerTransitioningDelegate protocol methods ***
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = false
        return self
    }
    
    
    
    
    // MARK: *** UIVIewControllerInteractiveTransitioning Protocol ***
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }
    
    
    
    
    
    func handleEnterPanGesture(pan: UIPanGestureRecognizer){
        
        // how much distance have we panned in reference to the parent view?
        let translation = pan.translationInView(pan.view!)
        
        // do some math to translate this to a percentage based value
        let d =  translation.x / CGRectGetWidth(pan.view!.bounds) * 0.5
        
        
        
        // now lets deal with different states that the gesture recognizer sends
        switch (pan.state) {
            
            case UIGestureRecognizerState.Began:
                
                self.interactive = true
                self.sourceViewController.performSegueWithIdentifier("showSideMenuSegue", sender: self)
            break
            
            case UIGestureRecognizerState.Changed:
            
                self.updateInteractiveTransition(d)
            break
            
            default:
            
                self.interactive = false
                if(d > 0.05){
                    // threshold crossed: finish
                    self.finishInteractiveTransition()
                }
                else {
                    // threshold not met: cancel
                    self.cancelInteractiveTransition()
                }
        }
    }
    
    func handleExitPanGesture(pan: UIPanGestureRecognizer){
        
        let translation = pan.translationInView(pan.view!)
        let d =  translation.x / CGRectGetWidth(pan.view!.bounds) * -0.5
        
        switch (pan.state) {
            
        case UIGestureRecognizerState.Began:
            self.interactive = true
            self.destinationViewController.performSegueWithIdentifier("dismissSideMenuSegue", sender: self)
            break
            
        case UIGestureRecognizerState.Changed:
            self.updateInteractiveTransition(d)
            break
            
        default: // .Ended, .Cancelled, .Failed ...
            self.interactive = false
            if(d > 0.1){
                self.finishInteractiveTransition()
            }
            else {
                self.cancelInteractiveTransition()
            }
        }

    }
    
}