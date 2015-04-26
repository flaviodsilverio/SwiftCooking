//
//  CustomCollection.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 26/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit

@objc protocol CustomCollectionDelegate{
     func numberOfColumns()
}

class CustomCollection: UIScrollView {
    

    func viewDidLoad(){
    
    
    
    }
    
    func didReceiveMemoryWarning(){
    
    
    }
    
    @objc func numberOfColumns() {
        print("implemented")
    }

}
