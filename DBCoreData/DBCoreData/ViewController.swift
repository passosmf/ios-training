//
//  ViewController.swift
//  DBCoreData
//
//  Created by Marcio P Ferreira on 09/12/20.
//
import CoreData
import UIKit

class ViewController: UIViewController {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DBCoreData")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved Error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = persistentContainer.viewContext
        let task = Task(context: context)
        task.desc = "test"
        task.isCompleted = false
        try? context.save()
        
        loadData { tasks in
            if let tasks = tasks {
                for task in tasks {
                    print(task.desc!)
                }
                
            }
        }
    }

    func loadData(completion: ([Task]?) -> Void) {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        let result = try? context.fetch(request)
        let arrayPersons = result as? [Task]
        completion(arrayPersons)
    }
    
    func edit(id: NSManagedObjectID, desc: String) {
        let context = persistentContainer.viewContext
        let task = context.object(with: id) as? Task
        task?.desc = desc
        try? context.save()
    }
    
    func delete(id: NSManagedObjectID) {
        let context = persistentContainer.viewContext
        let task = Task(context: context)
        task.desc = "test2"
        try? context.save()
    }

}

