//
//  ShoppingCart.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 22/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit



class ShoppingCart: UITableViewController {

    var data : Dictionary <String,[String]>!

    override func viewDidLoad() {
        super.viewDidLoad()

       self.getData()
        
        data["Batatas com ovos"]=["batatas", "ovos"]
        data["pao com fiambre"]=["pao","fiambre","manteiga"]
        data["Misc"]=["sdf"]


       // let item : UIBarButtonItem
        //item.title="+"
       // let navigationItem = UIBarButtonItem()
        NSLog("%@",data.keys.array)
        //navigationItem.title="+"
        let navigationItemEdit = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "enterEdit")
        
        
        
        
        self.navigationItem.rightBarButtonItem=navigationItemEdit
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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1 + data.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if(section==0 && self.tableView.editing){
            return 2
        } else if(section==0){
            return 1
        }else{
            return data[data.keys.array[section-1]]!.count
        }
        
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section==0){
            return "Add Item"
        } else {
        
            return data.keys.array[section-1]
        }
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(tableView.editing == false && indexPath.row == 1 && indexPath.section == 0){
            return 0
        }
        
        return 40
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        switch(indexPath.section){
        
        case 0:
            
            //let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "test")
 
            var cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as! UITableViewCell
            
            
            cell.textLabel?.textAlignment=NSTextAlignment.Center

            
            if indexPath.row == 0{
                cell.textLabel?.textColor = UIColor.whiteColor()

                cell.textLabel?.text = "+"
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                cell.backgroundColor = UIColor.grayColor()
            } else {
                
                cell.clipsToBounds = true
                cell.textLabel?.textColor = UIColor.redColor()
                cell.textLabel?.text = "Delete All?";
                cell.contentView.backgroundColor = UIColor.clearColor()
                cell.textLabel?.backgroundColor = UIColor.clearColor()
                cell.textLabel?.layer.cornerRadius = 20
                cell.textLabel?.layer.borderWidth = 2.0
                cell.textLabel?.layer.borderColor = UIColor.redColor().CGColor
            }
            
            break;
            
        default:
            
            cell.textLabel?.text = "This is something"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

            break;

            
        
        }
        

        // Configure the cell...
        
        return cell
    }

    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.new()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    func enterEdit(){
    
        self.tableView.editing = !self.tableView.editing
        
        if self.tableView.editing == false {
            self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
        }
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if(indexPath.section == 0){
            return false;
        } else {
            return true;
        }
        
    }
    // MARK: - getting the data
    func getData(){
    
//        var defaults = NSUserDefaults.standardUserDefaults()
//        
//        if((defaults.valueForKey("shoppingCartData")) != nil){
//            data = defaults.valueForKey("shoppingCartData")?.dictionaryRepresentation()
//        } else {
            data = Dictionary<String,[String]>()
//        }
    }
}
