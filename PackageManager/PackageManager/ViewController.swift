//
//  ViewController.swift
//  PackageManager
//
//  Created by Marcio P Ferreira on 04/11/20.
//

import UIKit
import Kingfisher
import CardScanner

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://miro.medium.com/max/1400/1*uVjgWcISNzIVae_PVRac3A.png")
        imageView.kf.setImage(with: url)
    }

    @IBAction func actionCardScanner(_ sender: Any) {
        
        let scannerView = CardScanner.getScanner { card, date, cvv in
            self.label.text = "\(String(describing: card)) \(String(describing: date)) \(String(describing: cvv))"
        }
        present(scannerView, animated: true, completion: nil)
    }
    
}

