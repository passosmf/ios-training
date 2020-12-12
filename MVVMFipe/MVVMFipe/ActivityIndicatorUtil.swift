//
//  ActivityIndicatorUtil.swift
//  MVVMFipe
//
//  Created by Marcio P Ferreira on 11/12/20.
//

import UIKit

class ActivityIndicatorUtil {
    
    static func startActivityIndicator(view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    static func stopActivityIndicator(activityIndicator: UIActivityIndicatorView)  {
        activityIndicator.stopAnimating()
    }
}
