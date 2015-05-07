//
//  RecipeSummary.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 05/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class RecipeSummary: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var childView: UIView!
    
    var ingredients : Array<String> = []
    var steps : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        childView.backgroundColor = UIColor.whiteColor()
        
        
        ingredients = ["carne","pao de forma", "outro", "mais um"]
        steps = ["step 1","2","3"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        if indexPath.section == 0 && indexPath.row == 1 {
            return 200
        } else {
            return 60
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (section){
            
        case 0:
            return 4
        case 1:
            return ingredients.count
        case 2:
            return steps.count
        default:
            return 0
        }
    }
    
    
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell : UITableViewCell = UITableViewCell()
    
        switch (indexPath.section){
            
        case 0:
            
            switch indexPath.row{
            
                
            case 0:
                cell = tableView.dequeueReusableCellWithIdentifier("titleCell", forIndexPath: indexPath) as! UITableViewCell
                
                break
            case 1:
                cell = tableView.dequeueReusableCellWithIdentifier("imageCell", forIndexPath: indexPath) as! UITableViewCell
                break
            case 2:
                cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! UITableViewCell
                break
            case 3:
                cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! UITableViewCell
                break
            default:
                break;
            }
            
            break
            
        case 1:
            
            cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell", forIndexPath: indexPath) as! UITableViewCell
            
            cell.textLabel?.text = ingredients[indexPath.row]
            
            
            break
        case 2:
            
            cell = tableView.dequeueReusableCellWithIdentifier("stepCell", forIndexPath: indexPath) as! UITableViewCell
            
            cell.textLabel?.text = steps[indexPath.row]
            
            break
        default:
            
            cell = tableView.dequeueReusableCellWithIdentifier("CEll", forIndexPath: indexPath) as! UITableViewCell
            
            break
            
        }
        
    
        // Configure the cell...
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        
        case 1:
            return "Ingredients"
        case 2:
            return "Steps"
        default:
            return ""
        }
    }

}
