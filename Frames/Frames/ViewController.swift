//
//  ViewController.swift
//  Frames
//
//  Created by Marcio P Ferreira on 21/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var widthView = CGFloat(135)
    var heightView = CGFloat(120)
    
    var x = CGFloat(0)
    var y = CGFloat(40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView(x: x, y: y)
    }

    func createView(x: CGFloat, y: CGFloat) {
        let nextView = UIView(frame: CGRect(x: x, y: y, width: widthView, height: heightView))
        nextView.backgroundColor = .random()
        let tap = UITapGestureRecognizer(target: self, action: #selector(addView(_:)))
        nextView.addGestureRecognizer(tap)
        nextView.isUserInteractionEnabled = true
        view.addSubview(nextView)
        
        UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
          self.view.addSubview(nextView)
        }, completion: nil)
    }

    func resetView() {
        for view in view.subviews {
            view.removeFromSuperview()
        }
    }
    
    func endGame() {
        let finishView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        finishView.backgroundColor = .random()
        finishView.center = view.center
        
        let labelFinish = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        labelFinish.text = "Mission Concluded!"
        labelFinish.textColor = .black
        finishView.addSubview(labelFinish)
        
        view.addSubview(finishView)
        UIView.animate(withDuration: 2) {
            finishView.frame = self.view.frame
            finishView.backgroundColor = .white
            labelFinish.frame.origin = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
            labelFinish.frame.size = CGSize(width: 150, height: 20)
            labelFinish.center = self.view.center
        } completion: { _ in
            sleep(1)
            self.x = CGFloat(0)
            self.y = CGFloat(40)
            self.resetView()
            self.createView(x: self.x, y: self.y)
        }
    }
    
    @objc func addView(_ gesture: UITapGestureRecognizer) {
        if let viewTapped = gesture.view {
            if (viewTapped.frame.origin.y + viewTapped.frame.size.height + heightView) > view.frame.height,
               (viewTapped.frame.origin.x + viewTapped.frame.size.width + widthView) > view.frame.width {
                endGame()
            } else {
                if (viewTapped.frame.origin.y + viewTapped.frame.size.height + heightView) <= view.frame.height {
                    y = viewTapped.frame.origin.y + viewTapped.frame.size.height
                    createView(x: x, y: y)
                } else {
                    x = x + 135
                    y = CGFloat(40)
                    createView(x: x, y: y)
                }
            }
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1.0
        )
    }
}

