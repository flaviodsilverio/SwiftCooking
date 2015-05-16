//
//  RecipeSummaryViewController.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 10/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class RecipeSummaryViewController: UIViewController {

    let transitionManager = RecipeSummaryTransition()
    
    var labelDescriptionTitle: UILabel?
    var labelDescription: UILabel?
    var labelIngredientsTitle: UILabel?
    var viewIngredientsList: UIView?
    
    
    @IBOutlet weak var imageViewRecipe: UIImageView!
    @IBOutlet weak var btnAddToFavourites: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    
    @IBOutlet weak var viewMainInformation: UIVisualEffectView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDurationTime: UILabel!
    @IBOutlet weak var lblDificulty: UILabel!
    @IBOutlet weak var lblKcal: UILabel!
    
    @IBOutlet weak var scrollViewDescription: UIScrollView!
    @IBOutlet weak var btnStartRecipe: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewWithContent()
        
        self.transitioningDelegate = self.transitionManager
    }
    
    @IBAction func cancelButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    func setupViewWithContent(){
        
        
        let usableWidth = SCREEN_WIDTH - 20
        
        
        // Setup Image
        imageViewRecipe.image = UIImage(named: "500x500")
        
        
        // Setup Recipe basic information
        
        
        
        // Setup Recipe Description
        labelDescriptionTitle = UILabel(frame: CGRectMake(10, 5, usableWidth, 0))
        labelDescriptionTitle!.text = "Description"
        labelDescriptionTitle!.font = UIFont (name: "Helvetica-Bold", size: 14)
        labelDescriptionTitle!.textColor = UIColor.groupTableViewBackgroundColor()
        labelDescriptionTitle!.numberOfLines = 0
        labelDescriptionTitle!.adjustsFontSizeToFitWidth = true
        labelDescriptionTitle!.sizeToFit()
        
        
        labelDescription = UILabel(frame: CGRectMake(20, labelDescriptionTitle!.frame.height + 16, usableWidth - 30, 0))
        labelDescription!.text = "asdasd alsdkajs dalsdjalskdjasd ldkfjdf dfsd sdlfsjdf sldfkjs lsdjfsld ldkf sldfj ldjfsdkfjsd lfksdj e mais uma coisas e tal como ef"
        labelDescription!.font = UIFont (name: "AvenirNext-Regular", size: 14)
        labelDescription!.textColor = UIColor.groupTableViewBackgroundColor()
        labelDescription!.numberOfLines = 0;
        labelDescription!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        labelDescription!.sizeToFit()
        
        var actualHeight: CGFloat = labelDescriptionTitle!.frame.height + labelDescription!.frame.height
        
        var separator: UIView = UIView(frame: CGRectMake(10, actualHeight + 40, usableWidth - 20, 0.3))
        separator.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        actualHeight += 40
        
        NSLog("SCREEN %f", SCREEN_WIDTH)
        NSLog("Image View: %f", imageViewRecipe.frame.size.width)
        
        labelIngredientsTitle = UILabel(frame:
            CGRectMake(10, labelDescriptionTitle!.frame.height + actualHeight, usableWidth, 0))
        labelIngredientsTitle!.text = "Ingredients"
        labelIngredientsTitle!.font = UIFont (name: "Helvetica-Bold", size: 14)
        labelIngredientsTitle!.textColor = UIColor.groupTableViewBackgroundColor()
        labelIngredientsTitle!.numberOfLines = 0
        labelIngredientsTitle!.adjustsFontSizeToFitWidth = true
        labelIngredientsTitle!.sizeToFit()
        
        actualHeight += labelDescriptionTitle!.frame.height
        
        
        viewIngredientsList = UIView()
        
        for var i = 0; i < 10; i++
        {
        
            var labelTextList: UILabel = UILabel() //(frame: CGRectMake(20, CGFloat(i) * (actualHeight + 30), scrollViewDescription.frame.width * 0.8, 0))
            labelTextList.text = "⭐︎  Ingredient 1" // ✦ ☆ ✙ ✚ ✧ ➤ ✯ ✩
            labelTextList.font = UIFont (name: "AvenirNext-Regular", size: 14)
            labelTextList.textColor = UIColor.groupTableViewBackgroundColor()
            labelTextList.numberOfLines = 0
            labelTextList.adjustsFontSizeToFitWidth = true
            labelTextList.sizeToFit()
            
            
            labelTextList.frame = CGRectMake(20, CGFloat(i) * (labelTextList.frame.height + 15) + (actualHeight + 40), usableWidth * 0.8, labelTextList.frame.height )
            
            
            var btnAddToShoplist: UIImageView = UIImageView(frame: CGRectMake(usableWidth * 0.9, CGFloat(i) * (labelTextList.frame.height + 15) + (actualHeight + 40), usableWidth * 0.05, 15))
            
            btnAddToShoplist.image = UIImage(named: "shoppingChart")
            btnAddToShoplist.contentMode = UIViewContentMode.ScaleAspectFit
            
            //btnAddToShoplist.setTitle("✚", forState: UIControlState.Normal)
            //btnAddToShoplist.imageView?.image = UIImage(named: "shoppingChart")
            //btnAddToShoplist.setBackgroundImage(UIImage(named: "shoppingChart"), forState: UIControlState.Normal)
            //btnAddToShoplist.sizeToFit()
            
            
            
            viewIngredientsList!.addSubview(labelTextList)
            viewIngredientsList!.addSubview(btnAddToShoplist)
            
            viewIngredientsList!.setHeight(height: CGFloat(i) * (labelTextList.frame.height + 15) + 100)
        }
        

        
        
        scrollViewDescription.addSubview(labelDescriptionTitle!)
        scrollViewDescription.addSubview(labelDescription!)
        scrollViewDescription.addSubview(separator)
        scrollViewDescription.addSubview(labelIngredientsTitle!)
        scrollViewDescription.addSubview(viewIngredientsList!)
        
        
        scrollViewDescription.contentSize = CGSize(width: usableWidth, height: actualHeight + viewIngredientsList!.frame.height)
        
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
