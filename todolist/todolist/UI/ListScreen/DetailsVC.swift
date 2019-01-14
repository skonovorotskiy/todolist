//
//  DetailsVC.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    var model : ListScreenDetailsModelProtocol?
    
    @IBOutlet weak var nameTextField : UITextField?
    @IBOutlet weak var detailsTextView : UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField?.text else {
            ///TODO show alert
            return
        }
        model?.save(name: name, description: detailsTextView?.text)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        nameTextField?.text = model?.data()?.name
        detailsTextView?.text = model?.data()?.details
    }
}
