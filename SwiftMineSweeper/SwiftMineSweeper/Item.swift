//
//  Item.swift
//  SwiftMineSweeper
//
//  Created by Flávio Silvério on 03/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class Item: UIButton {
   
    var isMine = false as Bool
    var neighbours : Array <Item> = []
    var wasChecked = false as Bool
    var isFlagged = false as Bool
    
    init(){
        super.init(frame: CGRectMake(0, 0, 100, 100))
    }
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        var label = UILabel(frame: CGRectMake(0, 0, self.frame.width, self.frame.height))
        label.tag = 900
        label.textAlignment=NSTextAlignment.Center
        label.text=""
        label.textColor=UIColor.blackColor()
        self.addSubview(label)
        
        let longPressRec = UILongPressGestureRecognizer()
        longPressRec.addTarget(self, action: "longPressedView:")
        self.addGestureRecognizer(longPressRec)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setMine(isMine: Bool){
    
        self.isMine = isMine;
    }
    
    func check()->Bool{
    
        if self.wasChecked || isFlagged{
            return false
        } else{
            wasChecked=true;
        }
        
        if(self.isMine){
            self.backgroundColor = UIColor.redColor()

            return true;
            
        } else {
        
            var count = Int(0)
            
            for var i = 0 ; i < neighbours.count ; i++ {
                if self.neighbours[i].isMine{
                    count++;
                }

            }
            
            
            if count == 0{
                

                for var i = 0 ; i < neighbours.count ; i++ {
                    
                    if self.neighbours[i].check(){
                        count++;
                    }
                    
                }
            } else {
                var label = self.viewWithTag(900) as! UILabel
                
                label.text = String(count)
                
            }
            self.backgroundColor = UIColor.greenColor()

        }
        
        return false;
    }
    
    func setNeighboursNoConflict(array: [AnyObject] ){
        
        self.neighbours = array as! Array<Item>
        //            item.element.neighbours =  (( (allSquares as NSArray).filteredArrayUsingPredicate(compound)) as? [Item])!

    }
    
    func longPressedView(sender: UIGestureRecognizer){
        
        if(self.wasChecked){
            return
        }
        
        if (sender.state == UIGestureRecognizerState.Ended) {
            //Do Whatever You want on End of Gesture
        }
       if(sender.state == UIGestureRecognizerState.Began){
        
            isFlagged = !isFlagged
        
            if isFlagged {
            
                self.backgroundColor=UIColor.blueColor()
            } else {
                self.backgroundColor = UIColor.whiteColor()
            }
        }
        

    }
}
