//
//  ViewController.swift
//  AutoLayout
//
//  Created by Marcio P Ferreira on 23/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmButton.layer.cornerRadius = 15
        removeButton.layer.cornerRadius = 15
        
    }


}

