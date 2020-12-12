//
//  ViewController.swift
//  Alert
//
//  Created by Marcio P Ferreira on 28/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "Atenção",
                                      message: "Escolha a opção",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Coxinha", style: .default, handler: { (action) in
            print("Coxinha")
        }))
        alert.addAction(UIAlertAction(title: "Kibe", style: .default, handler: { (action) in
            print("Kibe")
        }))
        alert.addAction(UIAlertAction(title: "Risoles", style: .default, handler: { (action) in
            print("Risoles")
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action) in
            print("Cancelar")
        }))
        alert.addAction(UIAlertAction(title: "Nenhuma, ainda é cedo", style: .destructive, handler: { (action) in
            print("Nenhuma")
        }))
        
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = (sender as AnyObject).frame
        
        present(alert, animated: true, completion: nil)
    }
}

