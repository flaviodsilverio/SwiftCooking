//
//  UIViewExt.swift
//  SwiftCooking
//
//  Created by Mário Filipe Farate Marques on 12/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setX(#x:CGFloat) {
        var frame:CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    
    func setY(#y:CGFloat) {
        var frame:CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    
    func setWidth(#width:CGFloat) {
        var frame:CGRect = self.frame
        frame.size.width = width
        self.frame = frame
    }
    
    func setHeight(#height:CGFloat) {
        var frame:CGRect = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    func incrementHeight(#height:CGFloat){
        //var frame:CGRect = self.frame
        self.frame.size.height += height
    }
}