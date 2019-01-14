//
//  ListScreenModel.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

class ListScreenModel: ListScreenModelProtocol {
    
    var dataArray : [ListScreenData] = [ListScreenData]()
    
    func add(name: String) {
        let entity = ListScreenData(name : name)
        dataArray.append(entity)
    }
    
    func deleteData(forIndex index : Int) {
        dataArray.remove(at: index)
    }
    
    func save(name : String, description : String?, forIndex index : Int) {
        let entity = dataArray[index]
        entity.name = name
        entity.details = description
    }

    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return dataArray.count
    }
    
    func data(atIndex index: Int) -> ListScreenData? {
        if (numberOfRowsInSection(0) > index) {
            return dataArray[index]
        }
        else {
            return nil
        }
    }
    
    func detailsModel(forIndex index : NSInteger) -> ListScreenDetailsModelProtocol? {
        return ListScreenDetailsModel(withModel: self, index: index)
    }
}
