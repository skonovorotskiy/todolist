//
//  ViewController.swift
//  todolist
//
//  Created by Sergey on 1/11/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

let kCellIdentifier = "Identifier"
let kSequeIdentifier = "Details"

class ListScreenVC: UITableViewController {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ListScreenCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! ListScreenCell
        if let data = model.data(atIndex: indexPath.row) {
            cell.title?.text = data.name
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSequeIdentifier {
            guard let navigation : UINavigationController = segue.destination as? UINavigationController else {
                return
            }
            guard let viewController : DetailsVC = navigation.viewControllers.first as? DetailsVC else {
                return
            }
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            guard let detailsModel = model.detailsModel(forIndex: indexPath.row) else {
                return
            }
            viewController.model = detailsModel
        }
    }
}

