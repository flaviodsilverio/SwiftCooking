//
//  ViewController.swift
//  SwiftMineSweeper
//
//  Created by Flávio Silvério on 03/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class GameController: UIViewController {

    @IBOutlet weak var gameMap: UIView!
    var numberOfSquares = 130 as UInt32
    var allSquares : Array<Item> = []
    var numberPerLine = CGFloat(10)
    var gameEnded = false as Bool
    
    override func viewDidLoad() {
        
        super.viewDidLoad()


        startNewGame()
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateMinePositions()->Array<UInt32>{
        
        var positions = Array<UInt32>()
        
        
        while(positions.count < 20){
        
            let randN = arc4random_uniform(numberOfSquares) as UInt32
            
 
            if contains(positions, randN){
            
            }else{
                positions.append(randN)
            }
        
        }
        
        
        
        return positions
    }

    func generateMap(){
    
        var size = CGFloat((self.view.frame.width-33)/numberPerLine)
        var numberX = CGFloat(0.0)
        var numberY = CGFloat(3.0)
        var currentLine = CGFloat(0)
        
        let max = Int(numberOfSquares)
        let bombPositions = generateMinePositions()
        
        for (var i=0 ; i < max ; i++) {
            
            var square = Item(frame: CGRectMake( 3 + numberX * (size + 3), numberY, size, size))
            square.tag = i
            square.backgroundColor = UIColor.whiteColor()
            
            if contains(bombPositions,UInt32(i)){
                square.setMine(true)
            } else{
                square.setMine(false)
            }
            square.addTarget(self, action: "play:", forControlEvents: UIControlEvents.TouchUpInside)
            
            numberX++
            if(numberX==10){
                currentLine++
                numberX = CGFloat(0.0)
                numberY = CGFloat(3 + currentLine * (size + 3))
                
            }
            
            gameMap .addSubview(square)
            
            allSquares.append(square)
        }
    
    }
    
    func generateNeighbours(){
    
        var currentNumber = CGFloat(0)
        
        var compound = NSCompoundPredicate()
        
        for item in enumerate(allSquares){
        

            var predicate = NSPredicate(format: "self.tag = %d",item.element.tag-1)
            var predicate2 = NSPredicate(format: "self.tag = %d",item.element.tag+1)
            var predicate3 = NSPredicate(format: "self.tag = %d",item.element.tag-Int(numberPerLine))
            var predicate4 = NSPredicate(format: "self.tag = %d",item.element.tag+Int(numberPerLine))
            var predicate5 = NSPredicate(format: "self.tag = %d",item.element.tag-Int(numberPerLine - 1.0))
            var predicate6 = NSPredicate(format: "self.tag = %d",item.element.tag+Int(numberPerLine + 1.0))
            var predicate7 = NSPredicate(format: "self.tag = %d",item.element.tag+Int(numberPerLine - 1.0))
            var predicate8 = NSPredicate(format: "self.tag = %d",item.element.tag-Int(numberPerLine + 1.0))

            compound = NSCompoundPredicate(type: NSCompoundPredicateType.OrPredicateType, subpredicates: [predicate,predicate2,predicate3,predicate4,predicate5,predicate6,predicate7,predicate8])
            
            item.element.setNeighboursNoConflict((allSquares as NSArray).filteredArrayUsingPredicate(compound))
            
           // print((allSquares as NSArray).filteredArrayUsingPredicate(predicate))
//            if item.element.tag <= Int(numberPerLine) {
//            
//            }
//            
//            if currentNumber == numberPerLine-1 {
//                currentNumber = 0
//            } else{
//                currentNumber++
//
//            }
        
        }
        
    
    }
    @IBAction func startNewGame(sender: AnyObject) {
        
        allSquares = Array<Item> ()

        generateMap()
        generateNeighbours()
        gameEnded = false
    }

    func startNewGame(){
    
        generateMap()
        generateNeighbours()
    }
    
    func play(sender: Item){
    
        if gameEnded {
            return
        }
        gameEnded = sender.check()
        
    }
}

