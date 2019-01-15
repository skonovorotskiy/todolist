//
//  Entity+CoreDataClass.swift
//  todolist
//
//  Created by Sergey on 1/15/19.
//  Copyright © 2019 Sergey. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Entity)
public class Entity: NSManagedObject {
    func data() -> ListScreenData {
        let data = ListScreenData(name : self.name!)
        data.details = self.details
        return data
    }
}
