//
//  ListScreenModelProtocol.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

protocol ListScreenModelProtocol {
    func add(name : String)
    func deleteData(forIndex index : Int)
    func save(name : String, description : String?, forIndex index : Int)
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func data(atIndex index: Int) -> ListScreenData?
    func detailsModel(forIndex index : NSInteger) -> ListScreenDetailsModelProtocol?
}

protocol ListScreenDetailsModelProtocol {
    func deleteData()
    func save(name : String, description : String?)
    func data() -> ListScreenData?
}
