//
//  ViewController.swift
//  todolist
//
//  Created by Sergey on 1/11/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class ListScreenVC: UITableViewController {
    
    let identifier = "Identifier"
    var model : ListScreenModelProtocol!
    var presenter : ListScreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = ListScreenModel()
        self.model = model
        let presenter = ListScreenPresenter(viewController: self)
        self.presenter = presenter
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ListScreenCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ListScreenCell
        cell.title?.text = model.data(atIndex: indexPath.row).name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction  = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in
            self.model.deleteData(forIndex: indexPath.row)
            self.tableView.deleteRows(at:[indexPath], with:.automatic)
        }
        return [deleteAction]
    }
    
    @IBAction func addTapped(_ sender: Any) {
        self.presenter.showNameAlert { (name) in
            self.model.add(name: name)
            self.tableView.reloadData()
        }
    }
}

