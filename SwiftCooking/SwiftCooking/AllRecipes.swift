//
//  AllRecipesCollectionViewController.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 26/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit


let reuseIdentifier = "Cell"

class AllRecipes:  UIViewController, CustomCollectionDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Title Example"
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Total: 25"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell2")
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        
        if(cell==nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        
        var scroll = cell!.viewWithTag(101) as! UIScrollView
        self.generateRecipeViews(scroll)
        //scroll.contentSize = CGSizeMake(1000, 150)
        
        
        return cell!
    }
    
    //MARK: Collection delegate methods
    func numberOfColumns(){
    
    }

    func launchDetails(){
        
        let childController = self.storyboard?.instantiateViewControllerWithIdentifier("RecipeSummary") as! UIViewController!
        addChildViewController(childController)
        childController.view.frame = self.view.frame
        self.view.addSubview(childController.view)
        childController.didMoveToParentViewController(self)
        self.childViewControllers
        //var childView = RecipeSummary()
       // self.view.addSubview(childView.view)
        
        //self.performSegueWithIdentifier("showDetails", sender: self)
    }
    
    func generateRecipeViews(scroll:UIScrollView){
    
        let numberOfViews = 10//Int(arc4random_uniform(10))
        
        for var i = 0 ; i < numberOfViews; i++ {
        
            var view = UIButton()
            view.frame = CGRectMake(CGFloat(10 + i*210), 10, 200, scroll.frame.height-20)
            view.backgroundColor = UIColor.grayColor()
           // view.addTarget(self, action: "animate:", forControlEvents: UIControlEvents.TouchDown)
            view.addTarget(self, action: "launchDetails", forControlEvents: UIControlEvents.TouchDown)
            var label = UILabel()
            label.frame = CGRectMake(0, 0, 200, 25)
            view.addSubview(label)
            label.text = "Francesinha"
            label.textAlignment = NSTextAlignment.Center;
            label.textColor = UIColor.whiteColor()
            
            var image = UIImageView(frame: CGRectMake(0, 25, 200, view.frame.height))
            image.image = UIImage(named: "francesinha")
            
            view.addSubview(image)
            
            scroll.addSubview(view)
            
        }
    
        scroll.contentSize = CGSizeMake(CGFloat(215 * numberOfViews), 150)
    }
    
    func animate(sender:UIButton!){
        
       // self.tableView.userInteractionEnabled = false
        
        var shade = UIView(frame: CGRectMake(0, 0, 0, 0))
        shade.backgroundColor = UIColor.blackColor()
        shade.alpha = 0.5
        shade.center = self.view.center;
        self.view.addSubview(shade)
        
        var view = UIView()
        view.frame = CGRectMake(0, 0, 0, 0)
        view.center = self.view.center;
//        view.center = sender.center
        view.backgroundColor = UIColor.grayColor()
        self.view.addSubview(view)
        
        var label = UILabel(frame: CGRectMake(0, 0, 0, 0))
        label.text = "Francesinha"
        label.textAlignment = NSTextAlignment.Center;
        label.textColor = UIColor.whiteColor()
        label.center = view.center;
        label.alpha=0;
        
        var image = UIImageView(frame: CGRectMake(0, 0, 0, 0))
        image.image = UIImage(named: "francesinha")
        image.center = view.center;
        image.alpha=0;

        
        view.addSubview(label)
        view.addSubview(image)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {

            shade.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
            view.frame = CGRectMake(25, 20, self.view.frame.width-50, self.view.frame.height-100)
            label.frame = CGRectMake(0, 0, self.view.frame.width-50, 25)
            image.frame = CGRectMake(0, 25, self.view.frame.width-50, 250)
            image.alpha=1;
            label.alpha=1;
            
            }, completion: nil)
    }
}
