//
//  DetailViewController.swift
//  Xib
//
//  Created by Marcio P Ferreira on 18/11/20.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var tableViewModel: UITableView!
    
    var arrayModels = ["Teste 5", "Teste 6", "Teste 7", "Teste 8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewModel.register(UINib(nibName: "FipeInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "FipeInfoTableViewCell")
        tableViewModel.delegate = self
        tableViewModel.dataSource = self
    }

}

extension DetailViewController: UITableViewDelegate {
    
}


extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FipeInfoTableViewCell", for: indexPath) as! FipeInfoTableViewCell
        cell.setup(name: arrayModels[indexPath.row])
        
        return cell
    }
    
    
}
