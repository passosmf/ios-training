//
//  ViewController.swift
//  TabBar
//
//  Created by Marcio P Ferreira on 26/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionChangeMain(_ sender: Any) {
            
        let vc = UIViewController()
        vc.view.backgroundColor = .brown
        
        UIViewController.replaceRootViewController(viewController: vc)
    }
}

