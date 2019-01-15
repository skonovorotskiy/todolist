//
//  ListScreenModel.swift
//  todolist
//
//  Created by Sergey on 1/14/19.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation
import CoreData

class ListScreenModel: ListScreenModelProtocol {
    
    fileprivate var dataArray : [ListScreenData] = [ListScreenData]()
    var presenter : ListScreenPresenterProtocol!
    var delegate : ListScreenDetailsModelDelegate!

    public func loadData() {
        do {
            let context = CoreDataAccessor.shared.persistentContainer.viewContext
            let result = try context.fetch(Entity.fetchRequest())
            for data in result as! [Entity] {
                dataArray.append(data.data())
            }
        }
        catch {
            self.presenter.showError()
        }
    }
    
    func add() {
        self.presenter.showNameAlert { (name) in
            let context = CoreDataAccessor.shared.persistentContainer.viewContext
            let entityDescription = NSEntityDescription.entity(forEntityName: Entity.entityName(), in: context)
            let newUser : Entity = NSManagedObject(entity: entityDescription!, insertInto: context) as! Entity
            newUser.name = name
            do {
                try context.save()
                
                let data = ListScreenData(name : name)
                self.dataArray.append(data)
                self.delegate.needsReloadData()
            }
            catch {
                self.presenter.showError()
            }
        }
    }
    
    func deleteData(forIndex index : Int) {
        let data = dataArray[index]
        
        let context = CoreDataAccessor.shared.persistentContainer.viewContext
        let request : NSFetchRequest = Entity.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", "name", data.name)
        do {
            let result = try context.fetch(request)
            if let entity : Entity = result.first {
                context.delete(entity)
                try context.save()
                
                dataArray.remove(at: index)
                delegate.needsDeleteRow(atIndexPath: IndexPath(item : index, section : 0))
            }
        }
        catch {
            self.presenter.showError()
        }
    }
    
    func save(name : String, description : String?, forIndex index : Int) {
        let data = dataArray[index]

        let context = CoreDataAccessor.shared.persistentContainer.viewContext
        let request : NSFetchRequest = Entity.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", "name", data.name)
        do {
            let result = try context.fetch(request)
            if let entity : Entity = result.first {
                entity.name = name
                entity.details = description
                try context.save()
                
                data.name = name
                data.details = description
                self.delegate.needsReloadData()
            }
        }
        catch {
            self.presenter.showError()
        }
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
