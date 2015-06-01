//
//  CDManager.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 30/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit
import CoreData

var context : NSManagedObjectContext = NSManagedObjectContext()

func setContext(lContext: NSManagedObjectContext){
    context = lContext;
}

func getShoppingItems() -> Array<NSManagedObject>{

    var fetch = NSFetchRequest(entityName: "ShoppingItem")
    
    return (context.executeFetchRequest(fetch, error: nil) as? [NSManagedObject])!
}

func addShoppingItem(){

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedContext = appDelegate.managedObjectContext!
    let entity =  NSEntityDescription.entityForName("ShoppingItem", inManagedObjectContext: managedContext)
    
    var item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
    item.setValue("newItem", forKey: "name")
    
    var error: NSError?
    if !managedContext.save(&error) {
        println("Could not save \(error), \(error?.userInfo)")
    }
}