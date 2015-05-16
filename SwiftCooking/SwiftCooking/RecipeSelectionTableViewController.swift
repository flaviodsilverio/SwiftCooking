//
//  RecipeSelectionTableViewController.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 07/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class RecipeSelectionTableViewController: UITableViewController, HorizontalScrollDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! RecipeSelectionTableViewCell

        cell.HorizontalScrollView.title = "Hello"
        cell.HorizontalScrollView.titleColor = UIColor.redColor()
        cell.HorizontalScrollView.scrollBackgroundColor = UIColor.grayColor()

        cell.HorizontalScrollView.scrollView.frame.size.height = 165
        
        cell.HorizontalScrollView.delegate = self
        
        cell.HorizontalScrollView.setUpScrollWithImagesPath(["backBlur.jpg", "backBlur.jpg"],
            imagesTitles: ["Titulo1 e co calr fdfg poiseisto que se ve", "Titulo2"],
            titleColor: UIColor.redColor(),
            withAddButtonImage: "backBlur.jpg")
        
        return cell
    }
    

    func HorizontalScrollDidSelectAddButton(scroll: UIScrollView, selectedView: UIView?) {
    NSLog("Select add button")
    }
    
    func HorizontalScrollDidSelectElement(scroll: UIScrollView, selectedView: UIView?, elementAtIndex: Int?) {
        
        self.performSegueWithIdentifier("showRecipeSummarySegue" , sender: elementAtIndex)
        
        
        
    }
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let destinationVC = segue.destinationViewController as! RecipeSummaryViewController
        //destinationVC.RecipeSummary = 1
        
        
        NSLog("Segue")
    }
    

}
