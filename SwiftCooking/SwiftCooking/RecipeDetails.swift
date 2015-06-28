//
//  RecipeDetails.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 04/06/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

class RecipeDetails: UIViewController {


    var totalSteps = 9
    var currentStep = 0
    var barHeight = CGFloat(64)
    var goingForward : Bool = true
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
     //   self.view.bounds = CGRectInset(self.view.frame, 0, -64)
      //  self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - 64)
        println(self.view)
        configurePage()
        refreshView()

    }
    
    
    func configurePage(){
        
        var btnView = UIView(frame: CGRectMake(0, barHeight, self.view.frame.width, 60))
     //   btnView.backgroundColor = UIColor.redColor()
        self.view.addSubview(btnView)
    
        createNavigationButtons(btnView)
        
        var previousButtton = UIButton(frame: CGRectMake(0, self.view.frame.height - 60, self.view.frame.width / 2, 60))
        previousButtton.tag = 201
        previousButtton.setTitle(" < Previous", forState: UIControlState.Normal)
        previousButtton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        previousButtton.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(previousButtton)
        
        var nextButtton = UIButton(frame: CGRectMake(self.view.frame.width / 2, self.view.frame.height - 60, self.view.frame.width / 2, 60))
        nextButtton.setTitle("Next > ", forState: UIControlState.Normal)
        nextButtton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        nextButtton.tag = 202
        nextButtton.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(nextButtton)
        
        var contentView = UIScrollView(frame: CGRectMake(0, btnView.frame.height + btnView.frame.origin.y, self.view.frame.width, self.view.frame.height - 60 - 64 - btnView.frame.height))
        contentView.tag = 200
        self.view.addSubview(contentView)
        addMainViewRecognizers(contentView)

    }
    
    func createNavigationButtons(view: UIView){
    
        var buttonsHeight = view.frame.height
        var buttonsWidth = (view.frame.width - 100) / CGFloat(totalSteps)
        var currentTag = 300
        
        var buttonBegin = UIButton(frame: CGRectMake(0, 0, 50, buttonsHeight))
        buttonBegin.setTitle("Begin", forState: UIControlState.Normal)
        buttonBegin.tag = currentTag
        buttonBegin.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonBegin.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.TouchUpInside)

        currentTag++
//        buttonBegin.titleLabel?.textColor = UIColor.whiteColor()
//        buttonBegin.titleLabel?.backgroundColor = UIColor.blueColor()
        view .addSubview(buttonBegin)
        
        for var i = 0 ; i < totalSteps ; i++ {
        
            var step = UIButton(frame: CGRectMake(CGFloat(50) + CGFloat(i) * buttonsWidth, 0, buttonsWidth, buttonsHeight))
            step.tag = currentTag
            currentTag++
            step.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            step.setTitle("\(i + 1)", forState: UIControlState.Normal)
            step.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(step)
        
        }
        
        var buttonEnd = UIButton(frame: CGRectMake(view.frame.width - 50, 0, 50, buttonsHeight))
        buttonEnd.setTitle("End", forState: UIControlState.Normal)
        buttonEnd.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonEnd.tag = currentTag
        buttonEnd.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.TouchUpInside)
        view .addSubview(buttonEnd)
    }
    
    func changePage(sender: AnyObject){
    
        if sender.isKindOfClass(UISwipeGestureRecognizer){
            
            var recognizer = sender as! UISwipeGestureRecognizer
            if recognizer.direction == UISwipeGestureRecognizerDirection.Right {
            
                if currentStep == 0 {
                   
                } else {
                    currentStep--
                    goingForward = false

                }
                
            } else if recognizer.direction == UISwipeGestureRecognizerDirection.Left {
                
                if currentStep == totalSteps + 1 {
                    
                } else {
                    currentStep++
                    goingForward = true
                }
                
            }
            
        } else{
        
            var button = sender as! UIButton

            if button.tag < 300 {
                return
                //button.tag == 201 ? totalSteps-- : totalSteps++
            }
            else {
                if(button.tag - 300 < currentStep) {
                    goingForward = false
                } else {
                    goingForward = true
                }
                currentStep = button.tag - 300
            }
        }
   
        refreshView()
    }
    
    func refreshView(){
    
        if currentStep == 0 {
            
            self.view.viewWithTag(201)?.hidden = true
            self.view.viewWithTag(202)?.hidden=false
            
        } else if currentStep == totalSteps + 1 {
            
            self.view.viewWithTag(202)?.hidden=true
            self.view.viewWithTag(201)?.hidden=false
            
        } else {
            
            self.view.viewWithTag(202)?.hidden=false
            self.view.viewWithTag(201)?.hidden=false
        }
        
        for var i = 300 ; i < totalSteps + 302 ; i++ {
        
            var currentButton = self.view.viewWithTag(i) as! UIButton
            currentButton.backgroundColor = UIColor.whiteColor()
            currentButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            
            if i == 300 + currentStep {
                currentButton.backgroundColor = UIColor.blueColor()
                currentButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            }
        }
        
        animate()
    }
    
    func animate(){
    
        var newView = UIView(frame: self.view.viewWithTag(200)!.frame)
        newView.alpha = 0
        addMainViewRecognizers(newView)
        
        var xPos = 0.0
        
        if goingForward {
            xPos = -500.0
        } else {
            xPos = 500.0
        }
        
        UIView.animateWithDuration(0.5, animations: {
        
                self.view.viewWithTag(200)!.alpha = 0
                self.view.viewWithTag(200)!.frame = CGRectMake(CGFloat(xPos) + self.view.viewWithTag(200)!.frame.origin.x, self.view.viewWithTag(200)!.frame.origin.y, self.view.viewWithTag(200)!.frame.size.width, self.view.viewWithTag(200)!.frame.size.height)
            
            }, completion:{ (value: Bool) in
                
                self.view.viewWithTag(200)!.removeFromSuperview()
                newView.tag = 200
                self.generatePage(newView)
                self.view.addSubview(newView)
                
                UIView.animateWithDuration(0.5, animations: {
                
                    newView.alpha = 1
                    
                    })
            
        })
    
    }
    
    func generatePage(view: UIView){
    
        view.viewWithTag(401)?.removeFromSuperview()
        view.viewWithTag(402)?.removeFromSuperview()

        
        var title = UILabel(frame: CGRectMake(10, 0, view.viewWithTag(200)!.frame.size.width - 20, 50))
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont.systemFontOfSize(25)
        title.tag = 401
        
        var text = UITextView(frame: CGRectMake(10.0, 60.0, view.viewWithTag(200)!.frame.width - 20.0, view.viewWithTag(200)!.frame.height - 70.0))
        text.editable = false
        text.tag = 402
        
        if(currentStep == 0){
            title.text = "Let's Begin!"
            text.text = "Aqui pode \nlevar o resumo\n dos ingrediente\ntempo\ne essas cenas"

            
        } else if(currentStep == totalSteps+1) {
            title.text = "We did it!"
            text.text = "Aqui pode \nlevar a imagem que tinhamos\n apresentado no inicio\nmas nao me apeteceu\nmete-la\nlol"

        } else {
            title.text = "Step: \(currentStep)"
            text.text = "Aqui vamos \nter que separar as coisas\ncom tempos e cenas mas para agora\nestava so a brincar com navegacoes\nmete-la\nlol"

        }
        
        view.viewWithTag(200)!.addSubview(title)
        view.viewWithTag(200)!.addSubview(text)

        
    
    }
    
    func addMainViewRecognizers(view: UIView){
    
        var recognizerRight = UISwipeGestureRecognizer(target: self, action: "changePage:")
        recognizerRight.direction = UISwipeGestureRecognizerDirection.Right
        view.addGestureRecognizer(recognizerRight)
        
        var recognizerLeft = UISwipeGestureRecognizer(target: self, action: "changePage:")
        recognizerLeft.direction = UISwipeGestureRecognizerDirection.Left
        view.addGestureRecognizer(recognizerLeft)
    }
}
