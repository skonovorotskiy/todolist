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
    func setName(_ name : String, forIndex index : Int)
    func setDescription(_ description : String, forIndex index : Int)
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func data(atIndex index: Int) -> ListScreenEntity
}
