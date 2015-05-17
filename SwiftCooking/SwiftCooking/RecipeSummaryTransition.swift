//
//  RecipeSummaryTransition.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 10/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class RecipeSummaryTransition: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
   
    private var presenting: Bool = false
    
    
    
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        
        
        // assign references to RecipeSummaryViewController and the 'bottom' view controller from the tuple
        // RecipeSummaryViewController will alternate between the from and to view controller depending if we're presenting or dismissing
        let RecipeSummaryVC = !self.presenting ? screens.from as! RecipeSummaryViewController : screens.to as! RecipeSummaryViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = RecipeSummaryVC.view
        let bottomView = bottomViewController.view
        
        
        
        let offstageLeft = CGAffineTransformMakeTranslation(-150, 0)
        let offstageRight = CGAffineTransformMakeTranslation(150, 0)
        let offstageBottom = CGAffineTransformMakeTranslation(0, 150)
        
        
        if(self.presenting){
            menuView.alpha = 0
            
            RecipeSummaryVC.btnCancel.transform = offstageLeft
            RecipeSummaryVC.btnAddToFavourites.transform = offstageRight
            RecipeSummaryVC.labelDescriptionTitle?.transform = offstageLeft
            RecipeSummaryVC.labelDescription?.transform = offstageRight
            RecipeSummaryVC.labelIngredientsTitle?.transform = offstageLeft
            RecipeSummaryVC.viewIngredientsList?.transform = offstageRight
            RecipeSummaryVC.btnStartRecipe?.transform = offstageBottom
            
            //RecipeSummaryVC.viewMainInformation?.alpha = 0
        }
        
        
        // add the both views to transition container
        container.addSubview(bottomView)
        container.addSubview(menuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        // perform the animation!
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.LayoutSubviews, animations: {
            
            if (self.presenting){
                
                menuView.alpha = 1 // fade in
                
                RecipeSummaryVC.btnAddToFavourites.transform = CGAffineTransformIdentity
                RecipeSummaryVC.btnCancel.transform = CGAffineTransformIdentity
                RecipeSummaryVC.labelDescriptionTitle?.transform = CGAffineTransformIdentity
                RecipeSummaryVC.labelDescription?.transform = CGAffineTransformIdentity
                RecipeSummaryVC.labelIngredientsTitle?.transform = CGAffineTransformIdentity
                RecipeSummaryVC.viewIngredientsList?.transform = CGAffineTransformIdentity
                RecipeSummaryVC.btnStartRecipe?.transform = CGAffineTransformIdentity
                RecipeSummaryVC.lblTitle?.alpha = 1
                
                //UIView.animateWithDuration(5, delay: 0.1, options: nil,  animations: {
                    //RecipeSummaryVC.viewMainInformation?.alpha = 1
                //}, completion: nil)
            }
            else {
                
                RecipeSummaryVC.btnAddToFavourites.transform = offstageRight
                RecipeSummaryVC.btnCancel.transform = offstageLeft
                RecipeSummaryVC.labelDescriptionTitle?.transform = offstageLeft
                RecipeSummaryVC.labelDescription?.transform = offstageRight
                RecipeSummaryVC.labelIngredientsTitle?.transform = offstageLeft
                RecipeSummaryVC.viewIngredientsList?.transform = offstageRight
                RecipeSummaryVC.btnStartRecipe?.transform = offstageBottom
                RecipeSummaryVC.lblTitle?.alpha = 0
                //RecipeSummaryVC.viewMainInformation?.alpha = 0
                
                
                menuView.alpha = 0 // fade out
            }
            
            
            }, completion: { finished in
                
                transitionContext.completeTransition(true)
                
                // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
        })
    }
    
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.7
    }
    
    
    
    
    
    
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}
