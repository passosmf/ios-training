//
//  ViewController.swift
//  Gesture
//
//  Created by Marcio P Ferreira on 16/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    //isUserInteractionEnabled = true
    
    var count: Int = 0
    
    @IBOutlet weak var labelCount: UILabel!
    
    @IBOutlet weak var tapGesture: UIView!
    
    @IBOutlet weak var swipeGesture: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(add))
        tapGesture?.addGestureRecognizer(tap)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(_:)))
        swipeGesture.direction = .left
        view?.addGestureRecognizer(swipeGesture)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGesture))
        longPress.minimumPressDuration = 1
        view?.addGestureRecognizer(longPress)
    }
    
    @objc func add() {
        count += 1
        labelCount.text = String(count)
    }
    
    @objc func swipeGesture(_ sender: UITapGestureRecognizer) {
        count -= 1
        labelCount.text = String(count)
    }
    
    @objc func longPressGesture(_ sender: UITapGestureRecognizer) {
        count += 1
        labelCount.text = String(count)
    }
    /*
    @objc func add(_ sender: UITapGestureRecognizer) {
        count += 1
        labelCount.text = String(count)
    }
    
    @objc func swipeGesture(_ sender: UITapGestureRecognizer) {
        count -= 1
        labelCount.text = String(count)
    }
    
    @objc func longPressGesture(_ sender: UITapGestureRecognizer) {
        count += 1
        labelCount.text = String(count)
    }
    */
}

