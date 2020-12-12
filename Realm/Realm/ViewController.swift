//
//  ViewController.swift
//  Realm
//
//  Created by Marcio P Ferreira on 04/12/20.
//

import UIKit
import RealmSwift

class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("creting...")
        let myDog = Dog()
        myDog.name = "Rex"
        myDog.age = 1
        
        let realm = try! Realm()

        // Persist your data easily
        try! realm.write {
            realm.add(myDog)
        }
        print("saved")
        print("searching age < 2")
        // Query Realm for all dogs less than 2 years old
        let puppies = realm.objects(Dog.self).filter("age < 2")
        puppies.count // => 0 because no dogs have been added to the Realm yet

        print("found:" + puppies.count)
        
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let theDog = realm.objects(Dog.self).filter("age == 1").first
                try! realm.write {
                    theDog!.age = 3
                }
            }
        }
        
        print("searching age < 2")
        // Query Realm for all dogs less than 2 years old
        let puppies2 = realm.objects(Dog.self).filter("age < 2")
        puppies2.count // => 0 because no dogs have been added to the Realm yet

        print("found:" + puppies2.count)

    }


}



