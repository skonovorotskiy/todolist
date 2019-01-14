//
//  UITextFieldDelegateImplementation.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class UITextFieldDelegateImplementation : NSObject, UITextFieldDelegate {
    var editing: ((String?) -> Swift.Void)? = nil
    
    init(_ textField: UITextField,_ editing: @escaping (String?) -> Swift.Void) {
        super.init()
        self.editing = editing
        textField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nsString = textField.text as NSString?
        let newString = nsString?.replacingCharacters(in: range, with: string)
        if let editing = self.editing {
            editing(newString)
        }
        return true
    }
}
