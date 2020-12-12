//
//  ViewController.swift
//  Sharing
//
//  Created by Marcio P Ferreira on 16/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func shareAction(_ sender: Any) {
        
                let text = "This is some text that I want to share."

                // set up activity view controller
                let textToShare = [ text ]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

                // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
    }
}

