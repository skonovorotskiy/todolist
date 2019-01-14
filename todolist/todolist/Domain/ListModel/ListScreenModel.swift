//
//  ListScreenModel.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

class ListScreenModel: ListScreenModelProtocol {
    
    var dataArray : [ListScreenEntity] = [ListScreenEntity]()
    
    func add(name: String) {
        let entity = ListScreenEntity(name : name)
        dataArray.append(entity)
    }
    
    func deleteData(forIndex index : Int) {
        dataArray.remove(at: index)
    }
    
    func setName(_ name : String, forIndex index : Int) {
        let entity = dataArray[index]
        entity.name = name
    }
    
    func setDescription(_ description : String, forIndex index : Int) {
        let entity = dataArray[index]
        entity.description = description
    }

    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return dataArray.count
    }
    
    func data(atIndex index: Int) -> ListScreenEntity {
        return dataArray[index]
    }
}
