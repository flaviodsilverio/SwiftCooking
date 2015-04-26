//
//  AllRecipesCollectionViewController.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 26/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit


let reuseIdentifier = "Cell"

class AllRecipes:  UITableViewController, CustomCollectionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        //var teste = CustomCollection()
                // ...
//        RFQuiltLayout* layout = (id)[self.collectionView collectionViewLayout];
//        self.collectionView?.collectionViewLayout.direction = UICollectionViewScrollDirectionVertical
//        self.collectionView?.collectionViewLayout.blockPixels = CGSizeMake(100, 100);
        

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Title Example"
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Total: 25"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell2")
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        
        if(cell==nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell2")
        }
        
        var scroll = cell!.viewWithTag(101) as! UIScrollView
        self.generateRecipeViews(scroll)
        //scroll.contentSize = CGSizeMake(1000, 150)
        
        
        return cell!
    }
    
    //MARK: Collection delegate methods
    func numberOfColumns(){
    
    }


    
    func generateRecipeViews(scroll:UIScrollView){
    
        let numberOfViews = Int(arc4random_uniform(10))
        
        for var i = 0 ; i < numberOfViews; i++ {
        
            var view = UIView()
            view.frame = CGRectMake(CGFloat(10 + i*210), 10, 200, scroll.frame.height-20)
            view.backgroundColor = UIColor.grayColor()
            
            
            scroll.addSubview(view)
            
        }
    
        scroll.contentSize = CGSizeMake(CGFloat(215 * numberOfViews), 150)
    }
}
