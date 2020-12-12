//
//  ViewController.swift
//  MVVMFipe
//
//  Created by Marcio P Ferreira on 10/12/20.
//

import UIKit

class BrandController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var brandViewModel = BrandViewModel(apiManager: ApiManager())
    
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator = ActivityIndicatorUtil.startActivityIndicator(view: view)
        view.addSubview(activityIndicator!)
        
        table.delegate = self
        table.dataSource = self
        
        getBrands()
    }
    
    private func getBrands() {
        brandViewModel.loadBrands { success in
            self.table.reloadData()
            ActivityIndicatorUtil.stopActivityIndicator(activityIndicator: self.activityIndicator!)
        }
    }

}


extension BrandController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modelController = UIStoryboard(name: "ModelStoryboard", bundle: nil).instantiateInitialViewController() as? ModelController {
            modelController.selectedBrand = brandViewModel.arrayBrands[indexPath.row]
            navigationController?.pushViewController(modelController, animated: true)
        }
    }
}

extension BrandController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandViewModel.getBrandRowsNumber()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = brandViewModel.arrayBrands[indexPath.row].name
        cell.textLabel?.accessibilityIdentifier = "cell_\(indexPath.row)"
        return cell
    }
}

