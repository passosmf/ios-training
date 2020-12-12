//
//  ModelController.swift
//  MVVMFipe
//
//  Created by Marcio P Ferreira on 11/12/20.
//

import UIKit

class ModelController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var modelViewModel = ModelViewModel(apiManager: ApiManager())
    
    var activityIndicator: UIActivityIndicatorView?
    
    var selectedBrand: Brand?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator = ActivityIndicatorUtil.startActivityIndicator(view: view)
        view.addSubview(activityIndicator!)
        
        table.delegate = self
        table.dataSource = self
        
        getModels()
    }
    
    private func getModels() {
        modelViewModel.loadModels(brandId: selectedBrand!.id, onComplete:{ success in
            self.table.reloadData()
            ActivityIndicatorUtil.stopActivityIndicator(activityIndicator: self.activityIndicator!)
        })
    }
}

extension ModelController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
}

extension ModelController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelViewModel.getModelsRowsNumber()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = modelViewModel.arrayModels[indexPath.row].name
        cell.textLabel?.accessibilityIdentifier = "cell_\(indexPath.row)"
        return cell
    }
}

