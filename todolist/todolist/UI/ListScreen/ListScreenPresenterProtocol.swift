//
//  ListScreenPresenterProtocol.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

protocol ListScreenPresenterProtocol {
    func showNameAlert(withCompletion completion : @escaping (String) -> Swift.Void)
}
