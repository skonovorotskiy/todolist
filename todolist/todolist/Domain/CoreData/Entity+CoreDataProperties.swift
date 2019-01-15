//
//  Entity+CoreDataProperties.swift
//  todolist
//
//  Created by Sergey on 1/15/19.
//  Copyright © 2019 Sergey. All rights reserved.
//
//

import Foundation
import CoreData

extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: entityName())
    }
    
    @nonobjc public class func entityName() -> String {
        return "Entity"
    }

    @NSManaged public var details: String?
    @NSManaged public var name: String?

}
