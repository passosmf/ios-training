//
//  ViewController.swift
//  Xib
//
//  Created by Marcio P Ferreira on 18/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayNames = ["Teste 1", "Teste 2", "Teste 3", "Teste 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FipeInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "FipeInfoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewOne = UIStoryboard(name: "Storyboard", bundle: nil).instantiateInitialViewController() as? DetailViewController {
            navigationController?.pushViewController(viewOne, animated: true)
        }
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FipeInfoTableViewCell", for: indexPath) as! FipeInfoTableViewCell
        cell.setup(name: arrayNames[indexPath.row])
        
        return cell
    }
    
    
}
