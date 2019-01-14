//
//  ListScreenEntity.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

class ListScreenEntity {
    public var name : String
    public var description : String? = nil
    
    init(name : String) {
        self.name = name
    }
}
