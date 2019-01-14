//
//  ListScreenDetailsModel.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class ListScreenDetailsModel: ListScreenDetailsModelProtocol {
    var model : ListScreenModelProtocol
    var index : Int
    
    init(withModel model : ListScreenModelProtocol, index : Int) {
        self.model = model
        self.index = index
    }
    
    func deleteData() {
        model.deleteData(forIndex: index)
    }
    
    func save(name : String, description : String?) {
        model.save(name: name, description: description, forIndex: index)
    }
    
    func data() -> ListScreenData? {
        return model.data(atIndex: index)
    }
}
