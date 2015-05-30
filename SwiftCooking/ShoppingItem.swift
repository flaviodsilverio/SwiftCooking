//
//  ShoppingItem.swift
//  SwiftCooking
//
//  Created by Flávio Silvério on 30/05/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

import Foundation
import CoreData

class ShoppingItem: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var quantity: NSNumber

}
