//
//  CDManager.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 30/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import UIKit
import CoreData

//var context : NSManagedObjectContext = NSManagedObjectContext()
let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
let context = appDelegate.managedObjectContext!

//func setContext(lContext: NSManagedObjectContext){
//    context = lContext;
//}

func getShoppingItems() -> Array<NSManagedObject>{

    var fetch = NSFetchRequest(entityName: "ShoppingItem")
    
    return (context.executeFetchRequest(fetch, error: nil) as? [NSManagedObject])!
}

func addShoppingItem(){

    let entity =  NSEntityDescription.entityForName("ShoppingItem", inManagedObjectContext: context)
    
    var item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
    item.setValue("newItem", forKey: "name")
    
    var error: NSError?
    if !context.save(&error) {
        println("Could not save \(error), \(error?.userInfo)")
    }
}

func addDataToDatabase(){

    let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext: context)
    
    //Aqui vamos adicionar dois paulos
    var person1 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
    person1.setValue("paulo antonio", forKey: "name")
    var person2 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
    person2.setValue("paulo bento", forKey: "name")
    var person3 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
    person3.setValue("mario antonio", forKey: "name")
    var person4 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:context)
    person4.setValue("joao bento", forKey: "name")
    
    
    //obviamente aqui e onde vamos gravar
    var error: NSError?
    if !context.save(&error) {
        println("Could not save \(error), \(error?.userInfo)")
    }
}

func getAllPersonsWithNameContaining(name: String) -> [NSManagedObject] {

    var fetch = NSFetchRequest(entityName: "Person")
    var predicate = NSPredicate(format: "name contains[c] %@", name)
    fetch.predicate = predicate
    
    return context.executeFetchRequest(fetch, error: nil) as! [NSManagedObject]
}

func getAllPersons() -> [NSManagedObject] {
    
    var fetch = NSFetchRequest(entityName: "Person")
    
    return context.executeFetchRequest(fetch, error: nil) as! [NSManagedObject]
}

func getAllPersonsWithNameContaining(name: String, orName: String) -> [NSManagedObject] {
    
    var fetch = NSFetchRequest(entityName: "Person")
    var predicate = NSPredicate(format: "name contains[c] %@", name)
    var predicate2 = NSPredicate(format: "name contains[c] %@", orName)
    
    var compoundPredicate = NSCompoundPredicate.orPredicateWithSubpredicates([predicate,predicate2])
    
    fetch.predicate = compoundPredicate
    
    return context.executeFetchRequest(fetch, error: nil) as! [NSManagedObject]
}

func getAllPersonsInTheEasyWayWithNameContaining(name: String, orName: String) -> [NSManagedObject] {
    
    var fetch = NSFetchRequest(entityName: "Person")
    var predicate = NSPredicate(format: "name contains[c] %@ OR name contains[c] %@", name, orName)
    fetch.predicate = predicate
    
    return context.executeFetchRequest(fetch, error: nil) as! [NSManagedObject]
}

//func getAllPersons() -> [AnyObject]{
//    
//    var fetch = NSFetchRequest(entityName: "Person")
//    
//    return (context.executeFetchRequest(fetch, error: nil) as? [NSManagedObject])!
//}
//
//func getAllPersonsWithName(personName: String) -> Array <AnyObject>{
//
//    var fetch = NSFetchRequest(entityName: "Person")
//    var predicate = NSPredicate(
//    return (context.executeFetchRequest(fetch, error: nil) as? [NSManagedObject])!
//}