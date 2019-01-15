//
//  ListScreenPresenter.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class ListScreenPresenter: NSObject, ListScreenPresenterProtocol {
    var viewController : UIViewController!
    var delegateImpl : UITextFieldDelegateImplementation!
    
    init(viewController : UIViewController) {
        super.init()
        self.viewController = viewController
    }
    
    func showNameAlert(withCompletion completion : @escaping (String) -> Swift.Void) {
        let alert = UIAlertController(title: "Enter name", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            if let name = alert.textFields?.first?.text {
                completion(name)
            }
        })
        okAction.isEnabled = false
        alert.addAction(okAction)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Name"
            self.delegateImpl = UITextFieldDelegateImplementation(textField, {(name) in
                okAction.isEnabled = (name != nil && name!.count > 0)
            })
            textField.delegate = self.delegateImpl
        })
        self.viewController.present(alert, animated: true)
    }
    
    func showError() {
        
    }
}

