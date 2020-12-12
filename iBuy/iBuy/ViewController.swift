//
//  ViewController.swift
//  iBuy
//
//  Created by Marcio P Ferreira on 30/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var buyManager = ItemManager()

    
    var items = [Item]()
    var filteredItems = [Item]()
    
    var listItem = [ListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        listItem = buyManager.loadData()

        
        filteredItems = items
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredItems = items

        if searchText.isEmpty == false {
            filteredItems = items.filter({ $0.name.contains(searchText) })
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return listItem.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let cityDetail = UIStoryboard(name: "CityDetail", bundle: nil).instantiateInitialViewController() as? CityDetailViewController {
//           cityDetail.city = filteredCities[indexPath.row]
//           present(cityDetail, animated: true, completion: nil)
//        }
    }
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.listItem[indexPath.section].items[indexPath.row].name
            //listItem.ite [indexPath.row].name
        
  
        
        return cell
    }
}

class ListItem {
    var title: String
    var items = [Item]()
    
    init(title: String, items: [Item]) {
        self.title = title
        self.items = items

    }
}

class Item {
    var name: String
    var isDone: Bool
    
    init(name: String, isDone: Bool) {
        self.name = name
        self.isDone = isDone
    }
    
}

class ItemManager {
    var arrayItems = [Item]()
    private var selectedItem = -1
    
    var listItem = [ListItem]()
    
    func loadData() -> [ListItem] {
        
        var arrayOpened = [Item]()
        arrayOpened.append(Item(name: "Item 1", isDone: false))
        arrayOpened.append(Item(name: "Item 2", isDone: false))
        arrayOpened.append(Item(name: "Item 3", isDone: false))
        
        listItem.append(ListItem(title: "Open", items: arrayOpened))
        
        var arrayDone = [Item]()
        arrayDone.append(Item(name: "Done 1", isDone: true))
        arrayDone.append(Item(name: "Done 2", isDone: true))
        arrayDone.append(Item(name: "Done 3", isDone: true))
        
        listItem.append(ListItem(title: "Open", items: arrayOpened))
        return listItem
    }
    
    
    func getSelectedBuyItem() -> Int {
        return selectedItem
    }
    
    func setSelectedBuyItem(buyItemIndex: Int) {
        self.selectedItem = buyItemIndex
    }
    
    func saveBuyItem(buyItem: Item) {
        if selectedItem == -1 {
            arrayItems.append(buyItem)
        } else {
            arrayItems[selectedItem] = buyItem
            selectedItem = -1
        }
    }
    
    func validateFields(name: String) -> [String] {
        if name.isEmpty {
            return  ["⛔️", "Try typing your wish first."]
        }
        return []
    }
    
    func find(name: String) -> Item? {
        for item in arrayItems {
            if item.name == name {
                return item
            }
        }
        return nil
    }
    
    func find(index: Int) -> Item {
        return arrayItems[index]
    }
    
    func removeSelected() {
        arrayItems.remove(at: selectedItem)
        selectedItem = -1
    }
}
