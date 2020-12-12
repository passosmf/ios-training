//
//  ViewController.swift
//  MVC-Advanced
//
//  Created by Narlei A Moreira on 19/11/20.
//

import UIKit

class DefaultListViewController: UIViewController {
    var controller: ControllerProtocol!

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        title = controller.getViewTitle()
        
        loadData()
        
    }

    func setFavourite(name: String) {
        
        Favourite.deleteAllDataWhere("1 = 1")

        let favourite = Favourite()
        favourite.name = name
        favourite.saveData()
        
        loadData()

    }
    
    func loadData() {
        controller.loadData { success in
            self.tableView.reloadData()
        }
    }

    static func getView(controller: ControllerProtocol) -> DefaultListViewController {
        let viewDefault = UIStoryboard(name: "DefaultList", bundle: nil).instantiateInitialViewController() as! DefaultListViewController
        viewDefault.controller = controller
        return viewDefault
    }
}

extension DefaultListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let nextController = controller.getNextController(index: indexPath.row)
        //navigationController?.pushViewController(nextController, animated: true)
        
        let name = controller.getTitleForCell(at: indexPath.row)
        setFavourite(name: name)
    }
}

extension DefaultListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getNumberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var name = controller.getTitleForCell(at: indexPath.row)
        
        let data = Favourite.getAllDataWhere("name = '" + name + "'") as? [Favourite]
        
        if data != nil, data!.count > 0 {
            name = data![0].name + " ❤️ "
        }
        
        cell.textLabel?.text = name
        cell.textLabel?.accessibilityIdentifier = "cell_\(indexPath.row)"
        return cell
    }
}
